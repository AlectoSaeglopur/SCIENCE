
%%% Title: GOERTZEL TONE-GENERATOR
%%% Author: Filippo Valmori
%%% Date: 12/02/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013) [Ch.8]

close all
clearvars
clc


%% PARAMETERS

LenSa = 400;                                                                    % Input impulse length [Sa]
Fs = 10e3;                                                                      % Sample rate [Sa]
Fc = 500;                                                                       % Desired tone frequency [Hz]
Amp = 1;                                                                        % Impulse amplitude [V] (NB: it becomes in turn the amplitude of the generated sinusoid)
Dly = 20;                                                                       % Impulse delay [Sa]


%% CONSTANTS

Npt = 512;                                                                      % Number of points for filter representation
ScFct = 1e3;                                                                    % Scale factor for time plots (e.g. 1e3 = 1ms)
Blue = [.2 .2 1];                                                               % Custom blue color
Azure = [0 .8 .8];                                                              % Custom azure color
Red = [1 .2 0];                                                                 % Custom red color
Grey = [.7 .7 .7];                                                              % Custom grey color
Black = [0 0 0];                                                                % Custom black color



%% PROCESSING

ImpWave = zeros(1,LenSa);
ImpWave(Dly) = Amp;
TimeAx = 1/Fs*(0:LenSa-1);


Omega = 2*pi*Fc/Fs;                                                             % Calculate normalized frequency [rad]
B = [0,sin(Omega)];                                                             % Calculate filter numerator taps
A = [1,-2*cos(Omega),1];                                                        % Calculate filter denominator taps
[H,FreqAxH] = freqz(B,A,Npt,Fs);                                                % Get complex transfer function
H_mgn = 20*log10(abs(H));                                                       % Estimate filter transfer function magnitude spectrum [dB]
H_pha = 180*unwrap(angle(H))/pi;                                                % Estimate filter transfer function spectrum [deg]
ToneWave = filter(B,A,ImpWave);
[FreqAxS,ToneSpec,~] = GetSpect(ToneWave(Dly:end),Fs);                          % Estimate tone power spectrum



%% RESULTS

figure
subplot(2,2,1)
box on
plot(FreqAxH,H_mgn,'.-','linewidth',1,'markersize',3,'Color',Black)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
title('FILTER MAGNITUDE')
grid on
subplot(2,2,2)
box on
plot(FreqAxH,H_pha,'.-','linewidth',1.1,'markersize',3,'Color',Grey)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Phase [deg]','fontsize',11)
title('FILTER PHASE')
grid on


subplot(2,2,3)
box on
hold on
stem(TimeAx*ScFct,ImpWave,'-o','linewidth',1.1,'markersize',3,'Color',Blue)
plot(TimeAx*ScFct,ToneWave,'.-','linewidth',1.1,'markersize',3,'Color',Azure)
xlabel('Time [ms]')
ylim(1.1*Amp*[-1 1])
title('IMPULSE-TONE WAVEFORMS')
grid on
hold off

subplot(2,2,4)
plot(FreqAxS/ScFct,ToneSpec,'.-','linewidth',1.1,'markersize',5,'Color',Red)
ylim([-80 20*log10(Amp)])
xlabel('Frequncy [kHz]')
ylabel('Power [dB]')
title('TONE SPECTRUM')
grid on


%% FUNCTIONS

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
