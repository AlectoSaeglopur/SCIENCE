%
% Script for testing "GetSpect" function.
%

close all; clearvars; clc


%% PARAMETERS

Fs = 10e3;                                                                      % Waveform sample rate [Fs/s] (NB: increasing Fs yields a power estimation closer and closer to the theoretical value expected!)
Fr = 50;                                                                        % Waveform frequency [Hz]
A = 1;                                                                          % Waveform amplitude [V]
NcycT = 5;                                                                      % Number of waveform cycles to be simulated (as multiple of "Fr")
R = 1;                                                                          % Fictional resistance for power estimation [DO NOT CHANGE]


%% RESULTS %%

TimeAx = 0:1/Fs:NcycT/Fr;
Wave = A*sin(2*pi*Fr*TimeAx);
[FreqAx,PwrSpect,OvPwrF,OvPwrT] = GetSpect(Wave,Fs);

fprintf(' >> TheoPwr = %1.3f dBW\n',10*log10(R*(A/sqrt(2))^2))                   % theoretical power of sinusoid (through Vrms)
fprintf(' >> ExpPwrF = %1.3f dBW\n',OvPwrF)                                      % experimental power in frequency
fprintf(' >> ExpPwrT = %1.3f dBW\n',OvPwrT)                                      % experimental power in time

figure; box on
plot(TimeAx*1e3,Wave,'r.-')
xlabel('TimeAx [ms]')
ylabel('Current [mA]')
title('WAVEFORM')
grid on

figure; box on
plot(FreqAx/1e3,PwrSpect,'b.-')
xlabel('Frequency [kHz]')
ylabel('Power [dBW/Hz]')
title('POWER SPECTRUM')
grid on


%% FUNCTIONS

function [ FreqAx, PwrSpect, OvPwrF, OvPwrT ] = GetSpect( Sgn, Fs )
    Ns = length(Sgn);                                                           % Length (in samples) of the input waveform
    dF = Fs/Ns;                                                                 % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                                                  % Frequency axis for spectrum plot
    CpxSpect = fftshift(fft(Sgn))/Ns;                                           % Complex spectrum
    PwrSpect = 20*log10(abs(CpxSpect));                                         % Power spectrum [dBW/Hz]
    OvPwrF = 10*log10(sum((abs(CpxSpect)).^2));                                 % Overall signal power [dBW] estimated in frequency domain (NB: do NOT multiply by dF, that's wrong for this descrete representation!)
    % as a check, below overall power is estimated in time as well %
    OvPwrT = 10*log10(sum(Sgn.^2)/length(Sgn));                                 % Overall signal power [dBW] estimated in time domain (i.e. P = Vrms^2/R, where Vrms = sqrt(1/N*sum(Sgn[i]^2)) and assuming R = 1 Ohm)
end
