
close all; clearvars; clc

% Script for simulating the QPSK waveform transmitted over channel after SRRC filtering
% and the samples detected in reception after corresponding matched filtering


%% PARAMETERS

Nbits = 50;                                                                   % Number of transmitted bits
DR = 10e3;                                                                    % Data rate [b/s]
SNR = 20;                                                                     % [dB] Signal-to-noise ratio per symbol (assuming Psgn=1W)
Tscale = 1000;                                                                % Time scale for waveform plot (e.g. for "ms" use Tscale = 1000)
Fc = 400e6;                                                                   % [Hz] Carrier frequency                                                          

ResFact = 12e3;
M = 4;                                                                        % Modulation order (4 for QPSK)
phase_offset = pi/4;                                                          % QPSK constellation phase offset
QPSK_MOD = comm.QPSKModulator('PhaseOffset',phase_offset,'BitInput', ...      % QPSK modulator object
    true, 'SymbolMapping','Gray','OutputDataType','double');
beta = 0.3;                                                                   % Roll-off factor for SRRC filter
span = 10;                                                                     % Window span in samples for SRRC filter
sps = 8;                                                                      % Number of samples per symbol for SRRC filter upsampling
SRRC_FILTER_TX = comm.RaisedCosineTransmitFilter('Shape','Square root', ...   % SRRC TX filter object
  'RolloffFactor',beta,'FilterSpanInSymbols',span, ...
  'OutputSamplesPerSymbol',sps);
SRRC_FILTER_RX = comm.RaisedCosineReceiveFilter('Shape','Square root', ...    % SRRC RX filter object
  'RolloffFactor',beta,'FilterSpanInSymbols',span, ...
  'InputSamplesPerSymbol',sps,'DecimationFactor',1);
SRRC_delay = span*sps;                                                        % Overall delay in samples introduced by TX-RX SRRC filters
SYR = DR/log2(M);                                                             % [s/s] Symbol rate 
SAR1 = DR*sps/log2(M);                                                        % [S/s] Sample rate before up-resampling



%% SIMULATION #1(BASEBAND PROCESSING AND SAMPLING IN RX)

input_bits = randi([0,1],Nbits,1);
mod_symb = QPSK_MOD(input_bits);
SRRC_TX_symb = SRRC_FILTER_TX([mod_symb; zeros(span/2,1)]);
channel_symb = awgn(SRRC_TX_symb,SNR);
SRRC_RX_symb = SRRC_FILTER_RX([channel_symb; zeros(span*sps/2,1)]);

t1 = Tscale/SYR*(0:Nbits/log2(M)-1)+SRRC_delay*Tscale/SAR1;
t2 = Tscale/SAR1*(0:length(SRRC_RX_symb)-1);
figure; 
box on; hold on
plot(t2,real(SRRC_RX_symb),'b',t2,imag(SRRC_RX_symb),'r')
stem(t1,real(mod_symb),'b-.x'); stem(t1,imag(mod_symb),'r-.x')
xlabel('Time [ms]'); ylabel('Amplitude [V]')
legend('RX samples (I)','RX samples (Q)', ...
'TX symbols (I)','TX symbols (Q)','Location','NW')
title('Sampling of received signal after SRRC filtering')
grid on
