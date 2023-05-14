
%%% Title: ADAPTIVE FILTER FOR LINE ENHANCEMENT THROUGH LMS ALGORITHM
%%% Author: Filippo Valmori
%%% Date: 25/02/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013) [Ch.10]

close all
clearvars
clc


%% PARAMETERS

Fs = 5e3;                                                           % Sample rate [Sa/s]
Fc = 100;                                                           % Frequency of info tone [Hz]
Ncyc = 150;                                                         % Number of info signal cycles to be simulated [.]
Amp = 1;                                                            % Info signal amplitude [V]

PwrX = 4;                                                           % AWGN power [W]
Ntaps = 201;                                                        % Number of filter taps [.]
Delta = 7;                                                          % Input signal delay for adaptive filter [Sa]
Mu = 5e-6;                                                          % Convergence factor (NB: see "adapt_filter_noise_canceling.m" script for optimal setting)



%% CONSTANTS

XwinT = round(8*Fs/Fc);                                             % X-window for time plots
YlimF = -80;                                                        % Y-window for frequency plots
ScFct = 1e3;                                                        % Scale factor for time plots (e.g. 1e3 = 1ms)
Blue = [.2 .2 1];                                                   % Custom blue color
Green = [.2 .8 .2];                                                 % Custom green color
Azure = [0 .8 .8];                                                  % Custom azure color
Red = [1 .2 0];                                                     % Custom red color
Black = [0 0 0];                                                    % Custom black color



%% PROCESSING

LenSa = round(Ncyc*Fs/Fc);                                          % Overall number of samples to be simulated
TimeAx = (0:LenSa-1)/Fs;                                            % Get signals time axis
SgnS = Amp*sin(2*pi*Fc*TimeAx);                                     % Info sinusoidal signal
SgnN = sqrt(PwrX)*randn(1,LenSa);                                   % Generate noise samples
SgnD = SgnS+SgnN;                                                   % Generate noisy signal detected
SgnX = filter([zeros(1,Delta) 1],1,SgnD);                           % Generate input noisy signal delayed version
SgnY = AdaptFiltLE(SgnD,SgnX,Ntaps,Mu);                             % Apply LMS adaptive filtering for line enhancement
[FreqAx,SpecS,~] = GetSpect(SgnS(end-XwinT:end),Fs);                % Estimate original signal power spectrum
[~,SpecE,~] = GetSpect(SgnY(end-XwinT:end),Fs);                     % Estimate noisy power spectrum
[~,SpecD,~] = GetSpect(SgnD(end-XwinT:end),Fs);                     % Estimate filtered signal power spectrum (NB: initial samples removed since still soaked in noise)



%% RESULTS

figure
subplot(2,4,1)
plot(TimeAx*ScFct,SgnS,'.-','Color',Blue)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('ORIGINAL WAVE')
xlim(ScFct*[TimeAx(end-XwinT) TimeAx(end)])
ylim(2*Amp*[-1 1])
grid on
subplot(2,4,2)
plot(TimeAx*ScFct,SgnD,'.-','Color',Red)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('NOISY WAVE')
xlim(ScFct*[TimeAx(end-XwinT) TimeAx(end)])
ylim(8*Amp*[-1 1])
grid on
subplot(2,4,3)
plot(TimeAx*ScFct,SgnY,'.-','Color',Green)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('FILTERED WAVE')
xlim(ScFct*[TimeAx(end-XwinT) TimeAx(end)])
ylim(2*Amp*[-1 1])
grid on
subplot(2,4,5)
plot(FreqAx/ScFct,SpecS,'.-','Color',Blue)
xlabel('Frequency [kHz]')
ylabel('Power [dBW]')
title('ORIGINAL SPECTRUM')
ylim([YlimF 0])
grid on
subplot(2,4,6)
plot(FreqAx/ScFct,SpecD,'.-','Color',Red)
xlabel('Frequency [kHz]')
ylabel('Power [dBW]')
title('NOISY SPECTRUM')
ylim([YlimF 0])
grid on
subplot(2,4,7)
plot(FreqAx/ScFct,SpecE,'.-','Color',Green)
xlabel('Frequency [kHz]')
ylabel('Power [dBW]')
title('FILTERED SPECTRUM')
ylim([YlimF 0])
grid on
subplot(2,4,4)
plot(TimeAx*ScFct,SgnY-SgnS,'.-','Color',Black)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('ESTIMATION ERROR (Y-S)')
grid on



%% FUNCTIONS

% >> Function to apply adaptive filtering for line enhancement through LMS algorithm.
function SgnY = AdaptFiltLE( SgnD, SgnX, Ntaps, Mu )
    LenSa = length(SgnD);
    W = zeros(1,Ntaps);                                             % Initialize adaptive filter taps
    SgnY = zeros(1,LenSa);                                          % Initialize adaptive filter output
    SgnE = SgnY;                                                    % Initialize final filtered signal
    for i = Ntaps+1:LenSa
        SgnY(i) = 0;
        for j = 1:Ntaps
            SgnY(i) = SgnY(i)+W(j)*SgnX(i-j);                       % Calculate filter output signal
        end
        SgnE(i) = SgnD(i)-SgnY(i);                                  % Estimate difference signal
        for j = 1:Ntaps
            W(j) = W(j)+2*Mu*SgnE(i)*SgnX(i-j);                     % Update filter taps
        end
    end
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
