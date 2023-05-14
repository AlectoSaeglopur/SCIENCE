
%%% Title: GOERTZEL ALGORITHM
%%% Author: Filippo Valmori
%%% Date: 17/02/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013)

close all
clearvars
clc


%% PARAMETERS %%

Fs = 8e3;                                                           % Sample rate [Sa/s]
Fc1 = 0.5e3;                                                        % "Slower" sinusoid frequency [Hz]
Fc2 = 1e3;                                                          % "Faster" sinusoid frequency [Hz] [NB: Fc2 shall be larger than Fc1]
Ncyc1 = 6;                                                          % Number of "slower" sinusoid cycles to be simulated
A = 1e-1;                                                           % Sinusoid amplitude [V]



%% CONSTANTS

ScFct = 1e3;                                                        % Scale factor for time plots (e.g. 1e3 = 1ms)
Blue = [.2 .2 1];                                                   % Custom blue color
Green = [.2 .8 .2];                                                 % Custom green color
Orange = [1 .7 .2];                                                 % Custom orange color
Violet = [.8 0 .8];                                                 % Custom violet color
Azure = [0 .8 .8];                                                  % Custom azure color
Red = [1 .2 0];                                                     % Custom red color
Brown = [.5 .2 0];                                                  % Custom brown color
Grey = [.7 .7 .7];                                                  % Custom grey color
Black = [0 0 0];                                                    % Custom black color



%% PROCESSING %%

TimeAx = (0:round(Ncyc1*Fs/Fc1)-1)/Fs;                              % Get time axis for plots
Sgn1 = A*sin(2*pi*Fc1.*TimeAx);                                     % Generate "slower" signal
Sgn2 = A*sin(2*pi*Fc2.*TimeAx);                                     % Generate "faster" signal
Sgn = Sgn1+Sgn2;                                                    % Get overall source signal signal
[FreqAxS,SpecFft,~] = GetSpect(Sgn,Fs);                             % Estimate power spectrum through FFT algorithm

SpecGrzX = zeros(1,length(FreqAxS));
SpecGrzA = zeros(1,length(FreqAxS));
for i = 1:length(SpecFft)
    [Xk, Ak] = galg(Sgn,i);
    SpecGrzX(i) = Xk;
    SpecGrzA(i) = Ak;
end
SpecGrzX = 20*log10(abs(circshift(SpecGrzX, ...
    1-floor(length(SpecFft)/2))));                                  % Estimate power spectrum through Goertzel algorithm DFT coefficients
SpecGrzA = 20*log10(abs(circshift(SpecGrzA, ...
    1-floor(length(SpecFft)/2))));                                  % Estimate power spectrum through Goertzel algorithm magnitude spectrum



%% RESULTS %%

figure
subplot(2,2,1)
box on; hold on
plot(TimeAx*ScFct,Sgn,'.-','linewidth',1.1,'markersize',5,'Color',Blue)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('WAVEFORM')
grid on

subplot(2,2,2)
box on; hold on
plot(FreqAxS/ScFct,SpecFft,'.-','linewidth',1.1,'markersize',5,'Color',Red)
xlabel('Frequency [kHz]')
ylabel('Power [dB]')
title('FFT')
grid on

subplot(2,2,3)
box on; hold on
plot(FreqAxS/ScFct,SpecGrzX,'.-','linewidth',1.1,'markersize',5,'Color',Green)
xlabel('Frequency [kHz]')
ylabel('Power [dB]')
title('GOERTZEL (Xk)')
grid on

subplot(2,2,4)
box on; hold on
plot(FreqAxS/ScFct,SpecGrzA,'.-','linewidth',1.1,'markersize',5,'Color',Brown)
xlabel('Frequency [kHz]')
ylabel('Power [dB]')
title('GOERTZEL (Ak)')
grid on



%% FUNCTIONS %%

% >> Function to execute Goertzel algorithm.
function [ Xk, Ak ] = galg( x, k )
    N = length(x);
    x = [x 0];
    vk = zeros(1,N+3);
    for n = 1:N+1
        vk(n+2) = 2*cos(2*pi*k/N)*vk(n+1)-vk(n)+x(n);
    end
    Xk = (vk(N+3)-exp(-2*pi*1j*k/N)*vk(N+2))/N;                                 % Calculate k-th DFT complex coefficient
    Ak = vk(N+3)^2+vk(N+2)^2-2*cos(2*pi*k/N)*vk(N+3)*vk(N+2);
    Ak = sqrt(Ak)/N;                                                            % Calculate k-th point of magnitude spectrum
end


% >> Function to get the power spectrum of the input signal.
function [ FreqAx, PwrSpect, OvPwrF ] = GetSpect( Sgn, Fs )
    Ns = length(Sgn);                                                           % Length (in samples) of the input waveform
    dF = Fs/Ns;                                                                 % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                                                  % Frequency axis for spectrum plot
    CpxSpect = fftshift(fft(Sgn))/Ns;                                           % Complex spectrum
    PwrSpect = 20*log10(abs(CpxSpect));                                         % Power spectrum [dBW/Hz]
    OvPwrF = 10*log10(sum((abs(CpxSpect)).^2));                                 % Overall signal power [dBW] estimated in frequency domain (NB: do NOT multiply by dF, that's wrong for this descrete representation!)
    % As a check, below the overall power is estimated in time as well %
%     OvPwrT = 10*log10(sum(Sgn.^2)/length(Sgn));                                 % Overall signal power [dBW] estimated in time domain (i.e. P = Vrms^2/R, where Vrms = sqrt(1/N*sum(Sgn[i]^2)) and assuming R = 1 Ohm)
end
