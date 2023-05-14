
close all
clearvars
clc


%% PARAMETERS

Fc = 50;                                              % Sinusoid frequency
Ncyc = 40;                                            % Number of signal cycles to be simulated
osf = 20;                                             % Oversampling factor [Sa/S]
Var = 0.15;                                           % Noise variance



%% PROCESSING

Fs = osf*Fc;                                          % Sample rate [Sa/s]
Time = 1/Fs*(0:osf*Ncyc-1);                           % Time axis [s]
Sgn = sin(2*pi*Fc*Time);                              % Create testing signal
Sgn = Sgn+Var*randn(1,length(Sgn));                   % Add Gaussian noise

Ew = 2*osf;                                           % Eye-diagram window [Sa] (X-range)
Ep = Ew/Fs*1e3;                                       % Eye-diagram period (to rescale X-axis label numbering)



%% RESULTS

eyediagram(Sgn,Ew,Ep)
title('EYE DIAGRAM')
xlabel('Time [ms]')
grid on



%% NOTES

% 1. At the end of the day, the eye-diagram means simply to graphically overlap successive chunks
%     of a periodic signal to check how uch it varies in time (e.g. due to noise or sync issues).
