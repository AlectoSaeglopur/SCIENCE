
% Function for testing the overall DVB-S standard (TX-Channel-RX), chain steps are:
% - Scrambler
% - Reed-Solomon coding
% - Interleaving
% - Convolutional encoding
% - Modulation
% - SRRC filtering

close all; clearvars; clc


%% PARAMETERS

Npck = 1;                                                                   % Number of packets to be simulated
bpb = 8;                                                                    % Number of bits per byte
Nerrors = 150;                                                              % Number bits corrupted by channel [SIM#1]
SNR = 5;                                                                    % [dB] Signal-to-noise ratio per symbol (Psgn=1W) [SIM#2,3,4]
DR = 10e3;                                                                  % Data rate [b/s] [SIM#5]

SCR_base = 2;                                                               % Scrambler/descrambler calculation base
SCR_poly = '1 + z^-14 + z^-15';                                             % Scrambler/descrambler polynomial
SCR_init = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0];                                 % Scrambler/descrambler shift-registers initialization
SCR_ENC = comm.Scrambler(SCR_base,SCR_poly, ...                             % Scrambler object
    'InitialConditions',SCR_init);
SCR_DEC = comm.Descrambler(SCR_base,SCR_poly, ...                           % Descramler object
    'InitialConditions',SCR_init);

m_RS = 8;                                                                   % Reed-Solomon number of bits per symbol
GF_prim_poly = 'D^8 + D^4 + D^3 + D^2 + 1';                                 % Galois field primitive polynomial
k_RS = 188;                                                                 % Reed-Solomon message length in bytes
n_RS = 204;                                                                 % Reed-Solomon codeword length in bytes
n_RS_unsh = 2^m_RS-1;                                                       % Reed-Solomon unshortened message length in bytes
k_RS_unsh = n_RS_unsh-(n_RS-k_RS);                                          % Reed-Solomon unshortened codeword length in bytes
RS_gen_poly = rsgenpoly(n_RS_unsh,k_RS_unsh);                               % Reed-Solomon generator polynomial

IL_depth = 12;                                                              % Interlever/deinterleaver number of interal shift registers (SR)
IL_cells = 17;                                                              % Interlever/deinterleaver number of cells inside each SR
IL_init = 0;                                                                % Interlever/deinterleaver initial condition
IL_delay = IL_depth*(IL_depth-1)*IL_cells;                                  % Delay in bytes introduced by de/interleaving steps
INTLVR = comm.ConvolutionalInterleaver('NumRegisters',IL_depth, ...         % Convolutional interleaver object
    'RegisterLengthStep',IL_cells,'InitialConditions',IL_init');
DEINTLVR = comm.ConvolutionalDeinterleaver('NumRegisters',IL_depth, ...     % Convolutional deinterleaver object
    'RegisterLengthStep',IL_cells,'InitialConditions',IL_init');

K = 7;                                                                      % Convolutional encoding constraint length
G1 = 171; G2 = 133;                                                         % Convolutional encoding generator polynomials (in octal)
RC = '1/2';                                                                 % Convolutional encoding code rate
TD = 32;                                                                    % Viterbi decoder traceback depth
trellis = poly2trellis(K,[G1,G2]);                                          % Convolutional encoder/decoder description
Nquant = 8;                                                                 % Viterbi decoder number of soft decision bits [SIM#4]
quant_limit = 3/10^(-SNR/10);
quant_step = 2*quant_limit/2^Nquant;
quant_index = 0:2^Nquant-1;
partitions = -quant_limit+ quant_index(2:end)*quant_step;
if strcmp(RC,'1/2')                                                         % Convolutional encoder/decoder puncture pattern 
    puncture = [1 1];
elseif strcmp(RC,'2/3')
    puncture = [1 0 1 1];
elseif strcmp(RC,'3/4')
    puncture = [1 0 1 1 1 0];
elseif strcmp(RC,'5/6')                                                     % (NB: if RC=5/6, set Npck = 4,9,14,19,24,29,...)
    puncture = [1 0 1 0 1 1 1 0 1 0];
elseif strcmp(RC,'7/8')                                                     % (NB: if RC=7/8, set Npck = 3,10,17,24,31,38,...)                                          
    puncture = [1 0 0 0 1 0 1 1 1 1 1 0 1 0];
end

M_QPSK = 4;                                                                 % QPSK modulation order
phase_offset = pi/4;                                                        % QPSK symbols phase offset
QPSK_MOD = comm.QPSKModulator('PhaseOffset',phase_offset,'BitInput', ...    % QPSK modulator object [SIM#2,3,4]
    true, 'SymbolMapping','Gray','OutputDataType','double');
QPSK_DEM2 = comm.QPSKDemodulator('PhaseOffset',phase_offset, ...            % QPSK demodulator object [SIM#2]
    'BitOutput',true,'SymbolMapping','Gray', ...
    'DecisionMethod','Hard decision');
QPSK_DEM3 = comm.QPSKDemodulator('PhaseOffset',phase_offset, ...            % QPSK demodulator object [SIM#3,4]
    'SymbolMapping','Gray','BitOutput',true, ...
    'DecisionMethod','Approximate log-likelihood ratio');

beta = 0.3;                                                                 % Roll-off factor for SRRC filter
span = 8;                                                                   % Window span in samples for SRRC filter
sps = 6;                                                                    % Number of samples per symbol for SRRC filter upsampling
SRRC_FILTER_TX = comm.RaisedCosineTransmitFilter('Shape', ...               % SRRC TX filter object
    'Square root','RolloffFactor',beta,'FilterSpanInSymbols', ...
    span,'OutputSamplesPerSymbol',sps);
SRRC_FILTER_RX = comm.RaisedCosineReceiveFilter('Shape', ...                % SRRC RX filter object
    'Square root','RolloffFactor',beta,'FilterSpanInSymbols', ...
    span,'InputSamplesPerSymbol',sps,'DecimationFactor',1);
SRRC_delay = span*sps;                                                      % Overall delay in samples introduced by TX-RX SRRC filters

SYR = DR/log2(M_QPSK);                                                      % Symbol rate [s/s]
SAR = DR*sps/log2(M_QPSK);                                                  % Sample rate [S/s]


%% SIMULATION #1 - HARD DECISION WITH FIXED NUMBER OF CORRUPTED BITS (NO MODULATION)

% input_bytes = randi([0,255],k_RS*Npck,1);                                   % TX source byte stream generation [k_RS*Npck x 1]
% input_bits = reshape(transpose(fliplr(de2bi(input_bytes, ...                % Byte to bit conversion [k_RS*Npck*bpb x 1]
%     bpb))),[bpb*length(input_bytes) 1]);
% scrambled_bits = SCR_ENC(input_bits);                                       % Bits after sbrambler [k_RS*Npck*8 x 1]                   
% scrambled_bytes = bi2de(fliplr(transpose(reshape(scrambled_bits,[], ...     % Bit to byte conversion [k_RS*Npck x 1]
%     length(scrambled_bits)/bpb))));
% RS_enc_input_msg = gf(scrambled_bytes,m_RS,GF_prim_poly);                   % RS encoder message representation in GF(2^8) [k_RS*Npck x 1]
% RS_enc_output_cw = rsenc(reshape(RS_enc_input_msg,[k_RS,Npck])', ...        % RS encoder codeword output [Npkc x n_RS]
%     n_RS,k_RS,RS_gen_poly);
% padded_bytes = [reshape(RS_enc_output_cw.x', ...                            % Zero-padding to compensate de/interleaving [n_RS*Npck+IL_delay x 1]
%     [n_RS*Npck,1]);zeros(IL_delay,1)];
% interleaved_bytes = INTLVR(padded_bytes);                                   % Bytes after interleaving [n_RS*Npck+IL_delay x 1]
% interleaved_bits = reshape(transpose(fliplr(de2bi(interleaved_bytes, ...    % Byte to bit conversion [(n_RS*Npck+IL_delay)*bpb x 1]
%     bpb))),[bpb*length(interleaved_bytes) 1]);
% conv_enc_bits = convenc(interleaved_bits,trellis,puncture);                 % Bits after convolutional encoding [(n_RS*Npck+IL_delay)*bpb/RC x 1]
% 
% channel_lenght=length(conv_enc_bits);                                       % Length of the bit stream transmitted over the channel
% err_pos = randi([channel_lenght-IL_delay channel_lenght],[Nerrors 1]);      % Vector with the position of the errors
% conv_enc_bits(err_pos)=not(conv_enc_bits(err_pos));                         % Corruption of the transmitted bit stream
% 
% conv_dec_bits = vitdec(conv_enc_bits,trellis,TD,'trunc','hard',puncture);   % Bits after Viterbi hard decoding [n_RS*Npck+IL_delay*bpb x 1]
% conv_dec_bytes = bi2de(fliplr(transpose(reshape(conv_dec_bits,[], ...       % Bit to byte conversion [n_RS*Npck+IL_delay x 1]
%     length(conv_dec_bits)/bpb))));
% deinterleaved_bytes = DEINTLVR(conv_dec_bytes);                             % Bytes after deinterleaving [n_RS*Npck+IL_delay x 1]
% RS_dec_input_cw = gf(deinterleaved_bytes(IL_delay+1:end), ...               % RS decoder message representation in GF(2^8) [n_RS*Npck x 1]
%     m_RS,GF_prim_poly);
% RS_dec_output_msg = rsdec(reshape(RS_dec_input_cw,[n_RS,Npck])', ...        % RS encoder codeword output [Npkc x k_RS]
%     n_RS,k_RS,RS_gen_poly);
% RS_dec_output_bits = reshape(transpose(fliplr(de2bi( ...                    % Byte to bit conversion and reshaping [k_RS*Npck*bpb x 1]
%     RS_dec_output_msg.x', bpb))),[Npck*k_RS*bpb 1]);
% descrambled_bits = SCR_DEC(RS_dec_output_bits);                             % Bits after descrambler [k_RS*Npck*bpb x 1]
% output_bytes = bi2de(fliplr(transpose(reshape(descrambled_bits,[], ...      % RX final byte stream [k_RS*Npck x 1]
%     length(descrambled_bits)/bpb))));
% 
% if interleaved_bytes == conv_dec_bytes
%     fprintf('CONV_ENCODING CHECK : TRUE\n');
% else
%     fprintf('CONV_ENCODING CHECK : FALSE\n');
% end
% 
% if sum(scrambled_bits ~= RS_dec_output_bits) + sum(input_bytes ~= output_bytes) == 0
%     fprintf('RS - OVERALL CHECK : TRUE\n');
% else
%     fprintf('RS - OVERALL CHECK : FALSE\n');
% end


%% SIMULATION #2 - HARD DECISION WITH AWGN NOISE (QPSK MODULATION)

% input_bytes = randi([0,255],k_RS*Npck,1);                                   % TX source byte stream generation [k_RS*Npck x 1]
% input_bits = reshape(transpose(fliplr(de2bi(input_bytes, ...                % Byte to bit conversion [k_RS*Npck*bpb x 1]
%     bpb))),[bpb*length(input_bytes) 1]);
% scrambled_bits = SCR_ENC(input_bits);                                       % Bits after sbrambler [k_RS*Npck*8 x 1]                   
% scrambled_bytes = bi2de(fliplr(transpose(reshape(scrambled_bits,[], ...     % Bit to byte conversion [k_RS*Npck x 1]
%     length(scrambled_bits)/bpb))));
% RS_enc_input_msg = gf(scrambled_bytes,m_RS,GF_prim_poly);                   % RS encoder message representation in GF(2^8) [k_RS*Npck x 1]
% RS_enc_output_cw = rsenc(reshape(RS_enc_input_msg,[k_RS,Npck])', ...        % RS encoder codeword output [Npkc x n_RS]
%     n_RS,k_RS,RS_gen_poly);
% padded_bytes = [reshape(RS_enc_output_cw.x', ...                            % Zero-padding to compensate de/interleaving [n_RS*Npck+IL_delay x 1]
%     [n_RS*Npck,1]);zeros(IL_delay,1)];
% interleaved_bytes = INTLVR(padded_bytes);                                   % Bytes after interleaving [n_RS*Npck+IL_delay x 1]
% interleaved_bits = reshape(transpose(fliplr(de2bi(interleaved_bytes, ...    % Byte to bit conversion [(n_RS*Npck+IL_delay)*bpb x 1]
%     bpb))),[bpb*length(interleaved_bytes) 1]);
% conv_enc_bits = convenc(interleaved_bits,trellis,puncture);                 % Bits after convolutional encoding [(n_RS*Npck+IL_delay)*bpb/RC x 1]
% mod_symb = QPSK_MOD(conv_enc_bits);                                         % Complex symbols after QPSK modulator [(n_RS*Npck+IL_delay)*bpb/(RC*log2(M)) x 1]
% 
% channel_symb = awgn(mod_symb,SNR);                                          % Addition of AWGN noise to the symbols [(n_RS*Npck+IL_delay)*bpb/(RC*log2(M)) x 1]
% 
% demod_symb = QPSK_DEM2(channel_symb);                                       % Bit stream after hard QPSK demodulator [(n_RS*Npck+IL_delay)*bpb/RC x 1]
% conv_dec_bits = vitdec(demod_symb,trellis,TD,'trunc','hard',puncture);      % Bits after Viterbi hard decoding [n_RS*Npck+IL_delay*bpb x 1]
% conv_dec_bytes = bi2de(fliplr(transpose(reshape(conv_dec_bits,[], ...       % Bit to byte conversion [n_RS*Npck+IL_delay x 1]
%     length(conv_dec_bits)/bpb))));
% deinterleaved_bytes = DEINTLVR(conv_dec_bytes);                             % Bytes after deinterleaving [n_RS*Npck+IL_delay x 1]
% RS_dec_input_cw = gf(deinterleaved_bytes(IL_delay+1:end), ...               % RS decoder message representation in GF(2^8) [n_RS*Npck x 1]
%     m_RS,GF_prim_poly);
% RS_dec_output_msg = rsdec(reshape(RS_dec_input_cw,[n_RS,Npck])', ...        % RS encoder codeword output [Npkc x k_RS]
%     n_RS,k_RS,RS_gen_poly);
% RS_dec_output_bits = reshape(transpose(fliplr(de2bi( ...                    % Byte to bit conversion and reshaping [k_RS*Npck*bpb x 1]
%     RS_dec_output_msg.x', bpb))),[Npck*k_RS*bpb 1]);
% descrambled_bits = SCR_DEC(RS_dec_output_bits);                             % Bits after descrambler [k_RS*Npck*bpb x 1]
% output_bytes = bi2de(fliplr(transpose(reshape(descrambled_bits,[], ...      % RX final byte stream [k_RS*Npck x 1]
%     length(descrambled_bits)/bpb))));
% 
% if interleaved_bytes == conv_dec_bytes
%     fprintf('CONV_ENCODING CHECK : TRUE\n');
% else
%     fprintf('CONV_ENCODING CHECK : FALSE\n');
% end
% 
% if sum(scrambled_bits ~= RS_dec_output_bits) + sum(input_bytes ~= output_bytes) == 0
%     fprintf('RS - OVERALL CHECK : TRUE\n');
% else
%     fprintf('RS - OVERALL CHECK : FALSE\n');
% end


%% SIMULATION #3 - SOFT DECISION WITH AWGN NOISE AND UNQUANTIZED VITERBI (QPSK MODULATION)

% input_bytes = randi([0,255],k_RS*Npck,1);                                   % TX source byte stream generation [k_RS*Npck x 1]
% input_bits = reshape(transpose(fliplr(de2bi(input_bytes, ...                % Byte to bit conversion [k_RS*Npck*bpb x 1]
%     bpb))),[bpb*length(input_bytes) 1]);
% scrambled_bits = SCR_ENC(input_bits);                                       % Bits after sbrambler [k_RS*Npck*8 x 1]                   
% scrambled_bytes = bi2de(fliplr(transpose(reshape(scrambled_bits,[], ...     % Bit to byte conversion [k_RS*Npck x 1]
%     length(scrambled_bits)/bpb))));
% RS_enc_input_msg = gf(scrambled_bytes,m_RS,GF_prim_poly);                   % RS encoder message representation in GF(2^8) [k_RS*Npck x 1]
% RS_enc_output_cw = rsenc(reshape(RS_enc_input_msg,[k_RS,Npck])', ...        % RS encoder codeword output [Npkc x n_RS]
%     n_RS,k_RS,RS_gen_poly);
% padded_bytes = [reshape(RS_enc_output_cw.x', ...                            % Zero-padding to compensate de/interleaving [n_RS*Npck+IL_delay x 1]
%     [n_RS*Npck,1]);zeros(IL_delay,1)];
% interleaved_bytes = INTLVR(padded_bytes);                                   % Bytes after interleaving [n_RS*Npck+IL_delay x 1]
% interleaved_bits = reshape(transpose(fliplr(de2bi(interleaved_bytes, ...    % Byte to bit conversion [(n_RS*Npck+IL_delay)*bpb x 1]
%     bpb))),[bpb*length(interleaved_bytes) 1]);
% conv_enc_bits = convenc(interleaved_bits,trellis,puncture);                 % Bits after convolutional encoding [(n_RS*Npck+IL_delay)*bpb/RC x 1]
% mod_symb = QPSK_MOD(conv_enc_bits);                                         % Complex symbols after QPSK modulator [(n_RS*Npck+IL_delay)*bpb/(RC*log2(M)) x 1]
% 
% channel_symb = awgn(mod_symb,SNR);                                          % Addition of AWGN noise to the symbols [(n_RS*Npck+IL_delay)*bpb/(RC*log2(M)) x 1]
%
% demod_symb = QPSK_DEM3(channel_symb);                                       % Log-likelihood ratio stream after QPSK demodulator [(n_RS*Npck+IL_delay)*bpb/RC x 1]
% conv_dec_bits = vitdec(demod_symb,trellis,TD,'trunc','unquant',puncture);   % Bits after Viterbi soft-unquantized decoding [n_RS*Npck+IL_delay*bpb x 1]
% conv_dec_bytes = bi2de(fliplr(transpose(reshape(conv_dec_bits,[], ...       % Bit to byte conversion [n_RS*Npck+IL_delay x 1]
%     length(conv_dec_bits)/bpb))));
% deinterleaved_bytes = DEINTLVR(conv_dec_bytes);                             % Bytes after deinterleaving [n_RS*Npck+IL_delay x 1]
% RS_dec_input_cw = gf(deinterleaved_bytes(IL_delay+1:end), ...               % RS decoder message representation in GF(2^8) [n_RS*Npck x 1]
%     m_RS,GF_prim_poly);
% RS_dec_output_msg = rsdec(reshape(RS_dec_input_cw,[n_RS,Npck])', ...        % RS encoder codeword output [Npkc x k_RS]
%     n_RS,k_RS,RS_gen_poly);
% RS_dec_output_bits = reshape(transpose(fliplr(de2bi( ...                    % Byte to bit conversion and reshaping [k_RS*Npck*bpb x 1]
%     RS_dec_output_msg.x', bpb))),[Npck*k_RS*bpb 1]);
% descrambled_bits = SCR_DEC(RS_dec_output_bits);                             % Bits after descrambler [k_RS*Npck*bpb x 1]
% output_bytes = bi2de(fliplr(transpose(reshape(descrambled_bits,[], ...      % RX final byte stream [k_RS*Npck x 1]
%     length(descrambled_bits)/bpb))));
% 
% if interleaved_bytes == conv_dec_bytes
%     fprintf('CONV_ENCODING CHECK : TRUE\n');
% else
%     fprintf('CONV_ENCODING CHECK : FALSE\n');
% end
% 
% if sum(scrambled_bits ~= RS_dec_output_bits) + sum(input_bytes ~= output_bytes) == 0
%     fprintf('RS - OVERALL CHECK : TRUE\n');
% else
%     fprintf('RS - OVERALL CHECK : FALSE\n');
% end


%% SIMULATION #4 - SOFT DECISION WITH AWGN NOISE AND QUANTIZED VITERBI (QPSK MODULATION)

% input_bytes = randi([0,255],k_RS*Npck,1);                                   % TX source byte stream generation [k_RS*Npck x 1]
% input_bits = reshape(transpose(fliplr(de2bi(input_bytes, ...                % Byte to bit conversion [k_RS*Npck*bpb x 1]
%     bpb))),[bpb*length(input_bytes) 1]);
% scrambled_bits = SCR_ENC(input_bits);                                       % Bits after sbrambler [k_RS*Npck*8 x 1]                   
% scrambled_bytes = bi2de(fliplr(transpose(reshape(scrambled_bits,[], ...     % Bit to byte conversion [k_RS*Npck x 1]
%     length(scrambled_bits)/bpb))));
% RS_enc_input_msg = gf(scrambled_bytes,m_RS,GF_prim_poly);                   % RS encoder message representation in GF(2^8) [k_RS*Npck x 1]
% RS_enc_output_cw = rsenc(reshape(RS_enc_input_msg,[k_RS,Npck])', ...        % RS encoder codeword output [Npkc x n_RS]
%     n_RS,k_RS,RS_gen_poly);
% padded_bytes = [reshape(RS_enc_output_cw.x', ...                            % Zero-padding to compensate de/interleaving [n_RS*Npck+IL_delay x 1]
%     [n_RS*Npck,1]);zeros(IL_delay,1)];
% interleaved_bytes = INTLVR(padded_bytes);                                   % Bytes after interleaving [n_RS*Npck+IL_delay x 1]
% interleaved_bits = reshape(transpose(fliplr(de2bi(interleaved_bytes, ...    % Byte to bit conversion [(n_RS*Npck+IL_delay)*bpb x 1]
%     bpb))),[bpb*length(interleaved_bytes) 1]);
% conv_enc_bits = convenc(interleaved_bits,trellis,puncture);                 % Bits after convolutional encoding [(n_RS*Npck+IL_delay)*bpb/RC x 1]
% mod_symb = QPSK_MOD(conv_enc_bits);                                         % Complex symbols after QPSK modulator [(n_RS*Npck+IL_delay)*bpb/(RC*log2(M)) x 1]
% 
% channel_symb = awgn(mod_symb,SNR);                                          % Addition of AWGN noise to the symbols [(n_RS*Npck+IL_delay)*bpb/(RC*log2(M)) x 1]
% 
% demod_symb = QPSK_DEM3(channel_symb);                                       % Log-likelihood ratio stream after QPSK demodulator [(n_RS*Npck+IL_delay)*bpb/RC x 1]
% quantized_symb = quantiz(-demod_symb,partitions);                           % Quantization of the log-likelihood ratios
% conv_dec_bits = vitdec(quantized_symb,trellis,TD,'trunc', ...               % Bits after Viterbi soft-quantized decoding [n_RS*Npck+IL_delay*bpb x 1]
%     'soft',Nquant,puncture);
% conv_dec_bytes = bi2de(fliplr(transpose(reshape(conv_dec_bits,[], ...       % Bit to byte conversion [n_RS*Npck+IL_delay x 1]
%     length(conv_dec_bits)/bpb))));
% deinterleaved_bytes = DEINTLVR(conv_dec_bytes);                             % Bytes after deinterleaving [n_RS*Npck+IL_delay x 1]
% RS_dec_input_cw = gf(deinterleaved_bytes(IL_delay+1:end), ...               % RS decoder message representation in GF(2^8) [n_RS*Npck x 1]
%     m_RS,GF_prim_poly);
% RS_dec_output_msg = rsdec(reshape(RS_dec_input_cw,[n_RS,Npck])', ...        % RS encoder codeword output [Npkc x k_RS]
%     n_RS,k_RS,RS_gen_poly);
% RS_dec_output_bits = reshape(transpose(fliplr(de2bi( ...                    % Byte to bit conversion and reshaping [k_RS*Npck*bpb x 1]
%     RS_dec_output_msg.x', bpb))),[Npck*k_RS*bpb 1]);
% descrambled_bits = SCR_DEC(RS_dec_output_bits);                             % Bits after descrambler [k_RS*Npck*bpb x 1]
% output_bytes = bi2de(fliplr(transpose(reshape(descrambled_bits,[], ...      % RX final byte stream [k_RS*Npck x 1]
%     length(descrambled_bits)/bpb))));
% 
% if interleaved_bytes == conv_dec_bytes
%     fprintf('CONV_ENCODING CHECK : TRUE\n');
% else
%     fprintf('CONV_ENCODING CHECK : FALSE\n');
% end
% 
% if sum(scrambled_bits ~= RS_dec_output_bits) + sum(input_bytes ~= output_bytes) == 0
%     fprintf('RS - OVERALL CHECK : TRUE\n');
% else
%     fprintf('RS - OVERALL CHECK : FALSE\n');
% end


%% SIMULATION #5 - SOFT DECISION WITH TX-RX SRRC FILTER, AWGN NOISE AND QUANTIZED VITERBI (QPSK MODULATION)

input_bytes = randi([0,255],k_RS*Npck,1);                                   % TX source byte stream generation [k_RS*Npck x 1]
input_bits = reshape(transpose(fliplr(de2bi(input_bytes, ...                % Byte to bit conversion [k_RS*Npck*bpb x 1]
    bpb))),[bpb*length(input_bytes) 1]);
scrambled_bits = SCR_ENC(input_bits);                                       % Bits after sbrambler [k_RS*Npck*8 x 1]                   
scrambled_bytes = bi2de(fliplr(transpose(reshape(scrambled_bits,[], ...     % Bit to byte conversion [k_RS*Npck x 1]
    length(scrambled_bits)/bpb))));
RS_enc_input_msg = gf(scrambled_bytes,m_RS,GF_prim_poly);                   % RS encoder message representation in GF(2^8) [k_RS*Npck x 1]
RS_enc_output_cw = rsenc(reshape(RS_enc_input_msg,[k_RS,Npck])', ...        % RS encoder codeword output [Npkc x n_RS]
    n_RS,k_RS,RS_gen_poly);
padded_bytes = [reshape(RS_enc_output_cw.x', ...                            % Zero-padding to compensate de/interleaving [n_RS*Npck+IL_delay x 1]
    [n_RS*Npck,1]);zeros(IL_delay,1)];
interleaved_bytes = INTLVR(padded_bytes);                                   % Bytes after interleaving [n_RS*Npck+IL_delay x 1]
interleaved_bits = reshape(transpose(fliplr(de2bi(interleaved_bytes, ...    % Byte to bit conversion [(n_RS*Npck+IL_delay)*bpb x 1]
    bpb))),[bpb*length(interleaved_bytes) 1]);
conv_enc_bits = convenc(interleaved_bits,trellis,puncture);                 % Bits after convolutional encoding [(n_RS*Npck+IL_delay)*bpb/RC x 1]
mod_symb = QPSK_MOD(conv_enc_bits);                                         % Complex symbols after QPSK modulator [(n_RS*Npck+IL_delay)*bpb/(RC*log2(M)) x 1]
SRRC_TX_symb = SRRC_FILTER_TX([mod_symb; zeros(span/2,1)]);                 % Complex symbols after TX SRRC filter [(§+span/2)*sps x 1]

channel_symb = awgn(SRRC_TX_symb,SNR);                                      % Addition of AWGN noise to the symbols [§ x 1]

SRRC_RX_symb = SRRC_FILTER_RX([channel_symb; zeros(span*sps/2,1)]);         % Complex symbols after RX SRRC filter [§+span*sps/2 x 1]
down_sampled_symb = SRRC_RX_symb(SRRC_delay+1:sps:end);                     % Complex symbols after removing waveform transient and sps upsampling due to SRRC filters
demod_symb = QPSK_DEM3(down_sampled_symb);                                  % Log-likelihood ratio stream after QPSK demodulator [(n_RS*Npck+IL_delay)*bpb/RC x 1]
quantized_symb = quantiz(-demod_symb,partitions);                           % Quantization of the log-likelihood ratios
conv_dec_bits = vitdec(quantized_symb,trellis,TD,'trunc', ...               % Bits after Viterbi soft-quantized decoding [n_RS*Npck+IL_delay*bpb x 1]
    'soft',Nquant,puncture);
conv_dec_bytes = bi2de(fliplr(transpose(reshape(conv_dec_bits,[], ...       % Bit to byte conversion [n_RS*Npck+IL_delay x 1]
    length(conv_dec_bits)/bpb))));
deinterleaved_bytes = DEINTLVR(conv_dec_bytes);                             % Bytes after deinterleaving [n_RS*Npck+IL_delay x 1]
RS_dec_input_cw = gf(deinterleaved_bytes(IL_delay+1:end), ...               % RS decoder message representation in GF(2^8) [n_RS*Npck x 1]
    m_RS,GF_prim_poly);
RS_dec_output_msg = rsdec(reshape(RS_dec_input_cw,[n_RS,Npck])', ...        % RS encoder codeword output [Npkc x k_RS]
    n_RS,k_RS,RS_gen_poly);
RS_dec_output_bits = reshape(transpose(fliplr(de2bi( ...                    % Byte to bit conversion and reshaping [k_RS*Npck*bpb x 1]
    RS_dec_output_msg.x', bpb))),[Npck*k_RS*bpb 1]);
descrambled_bits = SCR_DEC(RS_dec_output_bits);                             % Bits after descrambler [k_RS*Npck*bpb x 1]
output_bytes = bi2de(fliplr(transpose(reshape(descrambled_bits,[], ...      % RX final byte stream [k_RS*Npck x 1]
    length(descrambled_bits)/bpb))));

if interleaved_bytes == conv_dec_bytes
    fprintf('CONV_ENCODING CHECK : TRUE\n');
else
    fprintf('CONV_ENCODING CHECK : FALSE\n');
end

if sum(scrambled_bits ~= RS_dec_output_bits) + sum(input_bytes ~= output_bytes) == 0
    fprintf('RS - OVERALL CHECK : TRUE\n');
else
    fprintf('RS - OVERALL CHECK : FALSE\n');
end
