
%%% Title: FREQUENCY-SAMPLING METHOD FIR FILTER DESIGN
%%% Author: Filippo Valmori
%%% Date: 08/02/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013)

close all
clearvars
clc


%% PARAMETERS %%

Fs = 12e3;                                                          % Sample rate [Sa/s]
Order = 16;                                                         % Filter order [NB: shall be even for linear phase, since Ntaps = Order+1]
Hk = [1 1 0.5 0 0 0 0 0 0];                                         % Desired sampled transfer function [.] (see NOTE#2)

Fc1 = 500;                                                          % "Slower" sinusoid frequency [Hz]
Fc2 = 2200;                                                         % "Faster" sinusoid frequency [Hz] [NB: Fc2 shall be larger than Fc1]
Ncyc1 = 10;                                                         % Number of "slower" sinusoid cycles to be simulated



%% CONSTANTS

Npt = 512;                                                          % Number of points for filter representation
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

B = FirFsm(Order+1,Hk);                                               % Design FIR taps through frequency-sampling method
[H,FreqAx] = freqz(B,1,Npt,Fs);                                     % Get complex transfer function [NB: keep A=1 for FIR]
H_mgn = 20*log10(abs(H));                                           % Estimate magnitude spectrum [dB] 
H_pha = 180*unwrap(angle(H))/pi;                                    % Estimate phase spectrum [deg]

TimeAx = (0:round(Ncyc1*Fs/Fc1)-1)/Fs;                              % Get time axis for plots
SgnSrc1 = sin(2*pi*Fc1.*TimeAx);                                    % Generate "slower" signal
SgnSrc2 = sin(2*pi*Fc2.*TimeAx);                                    % Generate "faster" signal
SgnSrc = SgnSrc1+SgnSrc2;                                           % Get overall signal signal
SgnFlt = filter(B,1,SgnSrc);                                        % Filter signal with designed FIR taps
[FreqAxS,SpecSgnSrc,~] = GetSpect(SgnSrc,Fs);                       % Estimate source signal power spectrum
[~,SpecSgnFlt,~] = GetSpect(SgnFlt,Fs);                             % Estimate filtered signal power spectrum



%% RESULTS %%

figure
subplot(2,3,1)
box on
plot(FreqAx,H_mgn,'.-','linewidth',1,'markersize',3,'Color',Black)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
title(strcat('TRANSFER FUNCTION (',num2str(Order),')'))
grid on
subplot(2,3,4)
box on
plot(FreqAx,H_pha,'.-','linewidth',1.1,'markersize',3,'Color',Grey)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Phase [deg]','fontsize',11)
grid on

subplot(2,3,2)
box on; hold on
plot(TimeAx*ScFct,SgnSrc1,'.-.','linewidth',1.1,'markersize',5,'Color',Red)
plot(TimeAx*ScFct,SgnSrc2,'.-.','linewidth',1.1,'markersize',5,'Color',Orange)
plot(TimeAx*ScFct,SgnSrc,'.-','linewidth',1.1,'markersize',5,'Color',Green)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('WAVEFORMS BEFORE/AFTER FILTERING')
legend(' Fc_1','Fc_2','Fc_T')
grid on
hold off
subplot(2,3,5)
plot(TimeAx*ScFct,SgnFlt,'.-','linewidth',1.1,'markersize',5,'Color',Green)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
grid on

subplot(2,3,3)
plot(FreqAxS/ScFct,SpecSgnSrc,'.-','linewidth',1.1,'markersize',5,'Color',Azure)
xlabel('Frequncy [kHz]')
ylabel('Power [dB]')
title('SPECTRA BEFORE/AFTER FILTERING')
grid on
subplot(2,3,6)
plot(FreqAxS/ScFct,SpecSgnFlt,'.-','linewidth',1.1,'markersize',5,'Color',Blue)
xlabel('Frequncy [kHz]')
ylabel('Power [dB]')
grid on



%% FUNCTIONS %%

% >> Function to calculate FIR filter taps based on frequency-sampling method.
function B = FirFsm( Ntaps, Hk )
    B = zeros(1,Ntaps);
    M = (Ntaps-1)/2;
    for n = 1:Ntaps
        B(n) = (1/Ntaps)*(Hk(1)+2*sum(Hk(2:1:M+1).*cos(2*pi*((1:M))*(n-1-M)/Ntaps)));
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



%% NOTES

% 1. Note that for each possible design (with odd Ntaps) the FIR filter phase response is always linear in the pass-band (and don't care
%    about the stop-band since those frequency components are attenuated/removed).

% 2. Hk shall have length M+1, where M = (N-1)/2.
%    Hk is the discretization of the desired transfer function, sampled at k = (Fs/2)/(M+1)*(0:M) [Hz].
