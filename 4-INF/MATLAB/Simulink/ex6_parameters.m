
%%% Title: DVB-S PARAMETERS
%%% Author: Filippo Valmori
%%% Date: 12/08/2023
%%% Reference: [1] DVB-S standard (EN-300-421-v1.1.2)

clearvars
close all
clc


%% SYSTEM

Tsim = 100e-3;                                                                      % Overall simulation duration [s]


%% MODULATION

Rb = 100e3;                                                                         % Bit-rate [b/s]
M = 4;                                                                              % Modulation order
PhOfst = pi/M;                                                                      % PSK constellation phase offset [rad]
Rs = Rb/log2(M);                                                                    % Symbol-rate [Sy/s]



%% PULSE-SHAPER (SRRC FILTER)

PS_beta = 0.35;                                                                     % Roll-off factor
PS_span = 8;                                                                        % Span for filter representation [Sy]
PS_osf = 10;                                                                        % Over-sampling factor [Sa/Sy]



%% CHANNEL

CHA_SNR = 90;                                                                       % Signal-to-noise ratio over AWGN channel [dB]



%% SCRAMBLER

SCR_poly = '1+z^-14+z^-15';                                                         % Generator polynomial
SCR_init = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0];                                         % Shift-register initial state



%% REED-SOLOMON

RS_m = 8;                                                                           % Extended Galois field degree (aka number of bits per symbol)
RS_prim_poly = 'X^8+X^4+X^3+X^2+1';                                                 % Primitive polynomial
RS_k = 188;                                                                         % Message length (in symbols)
RS_n = 204;                                                                         % Codeword length (in symbols)



%% INTERLEAVER

INT_I = 17;                                                                         % Number of rows (bitwise)
INT_M = (RS_n/INT_I)*RS_m;                                                          % Number of columns (bitwise)



%% VITERBI

VIT_K = 7;                                                                          % Constrain length
VIT_cv1 = 171;                                                                      % Upper connection vector (oct)
VIT_cv2 = 133;                                                                      % Lower connection vector (oct)
VIT_td = 15;                                                                        % Decoder traceback depth (aka memory factor)
VIT_punct = '1/2';                                                                  % Puncturing factor (1/2, 2/3, 3/4 or 5/6)
switch VIT_punct
    case '1/2'
        VIT_pv = [1; 1];
    case '2/3'
        VIT_pv = [1; 0; 1; 1];                                                      % Puncturing vector at rate 2/3
    case '3/4'
        VIT_pv = [1; 0; 1; 1; 1; 0];
    case '5/6'
        VIT_pv = [1; 0; 1; 0; 1; 1; 1; 0; 1; 0];
    otherwise
        error("Invalid puncturing factor.");
end

