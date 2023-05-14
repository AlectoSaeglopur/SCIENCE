
%%% Title: ANTI-ALIASING/ANTI-IMAGE FILTERING FOR DOWN/UP-SAMPLING
%%% Author: Filippo Valmori
%%% Date: 10/03/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013) [Ch.12]

close all
clearvars
clc


%% PARAMETERS %%

FsO = 20e3;                                                         % Sample rate [Sa/s]
Fc1 = 1e3;                                                          % "Slower" sinusoid frequency [Hz]
Fc2 = 3.5e3;                                                        % "Faster" sinusoid frequency [Hz]
Ncyc = 6;                                                           % Number of "slower" sinusoid cycles to be simulated
X = 4;                                                              % Down/up-sampling factor
Ntaps = 171;                                                        % Number of anti-aliasing/anti-image FIR low-pass filter taps
Fcut = (FsO/2)/X;                                                   % Anti-aliasing/anti-image FIR filter cut-off frequency [Hz] [OPTIMAL VALUE]



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

% 1. Original signal generation
TimeAxO = (0:round(Ncyc*FsO/Fc1)-1)/FsO;                            % Get time axis for plots
SgnO = sin(2*pi*Fc1.*TimeAxO)+sin(2*pi*Fc2.*TimeAxO);               % Generate original signal
[FreqAxO,SpecO,~] = GetSpect(SgnO,FsO);                             % Estimate original spectrum
% 2. Filter design
B = FirWnd(Ntaps,'LPF',Fcut,'HAM',FsO);                             % Get anti-aliasing/anti-image FIR filter taps
[H,FreqAx] = freqz(B,1,Npt,FsO);                                    % Get complex transfer function [NB: keep A=1 for FIR]
H_mgn = 20*log10(abs(H));                                           % Estimate magnitude spectrum [dB]
% 3a. Direct-downsampling
FsD = FsO/X;                                                        % Get downsampled sample rate [Sa/s]
SgnD = SgnO(1:X:end);                                               % Get downsampled signal
[FreqAxD,SpecD,~] = GetSpect(SgnD,FsD);                             % Estimate downsampled spectrum
% 3b. Filtered-downsampling
SgnFD = filter(B,1,SgnO);                                           % Apply anti-aliasing filtering
SgnFD = SgnFD(1:X:end);                                             % Get downsampled signal
[FreqAxFD,SpecFD,~] = GetSpect(SgnFD,FsD);                          % Estimate downsampled spectrum
% 4a. Direct-upsampling
FsU = FsO*X;                                                        % Get upsampled sample rate [Sa/s]
SgnU = Upsample(SgnO,X);                                            % Get upsampled signal
[FreqAxU,SpecU,~] = GetSpect(SgnU,FsU);                             % Estimate upsampled spectrum
% 4b. Filtered-upsampling
SgnFU = filter(B,1,SgnU);                                           % Apply anti-image filtering
[FreqAxFU,SpecFU,~] = GetSpect(SgnFU,FsU);                          % Estimate upsampled spectrum



%% RESULTS %%

figure('Name',sprintf('DOWNSAMPLING (M=%d)',X),'NumberTitle','off')
subplot(2,2,1)
box on
plot(FreqAx/ScFct,H_mgn,'.-','linewidth',1,'markersize',3,'Color',Black)
xlabel('Frequency [kHz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
title('FILTER')
grid on
subplot(2,2,2)
plot(FreqAxO/ScFct,SpecO,'.-','linewidth',1.1,'markersize',5,'Color',Blue)
xlabel('Frequncy [kHz]')
ylabel('Power [dB]')
title('ORIGINAL SPECTRUM')
grid on
subplot(2,2,3)
plot(FreqAxD/ScFct,SpecD,'.-','linewidth',1.1,'markersize',5,'Color',Violet)
xlabel('Frequncy [kHz]')
ylabel('Power [dB]')
title('RESAMPLED SPECTRUM')
grid on
subplot(2,2,4)
plot(FreqAxFD/ScFct,SpecFD,'.-','linewidth',1.1,'markersize',5,'Color',Red)
xlabel('Frequncy [kHz]')
ylabel('Power [dB]')
title('FILTERED+DOWNSAMPLED SPECTRUM')
grid on

figure('Name',sprintf('UPSAMPLING (L=%d)',X),'NumberTitle','off')
subplot(2,2,1)
box on
plot(FreqAx/ScFct,H_mgn,'.-','linewidth',1,'markersize',3,'Color',Black)
xlabel('Frequency [kHz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
title('FILTER')
grid on
subplot(2,2,2)
plot(FreqAxO/ScFct,SpecO,'.-','linewidth',1.1,'markersize',5,'Color',Blue)
xlabel('Frequncy [kHz]')
ylabel('Power [dB]')
title('ORIGINAL SPECTRUM')
grid on
subplot(2,2,3)
plot(FreqAxU/ScFct,SpecU,'.-','linewidth',1.1,'markersize',5,'Color',Violet)
xlabel('Frequncy [kHz]')
ylabel('Power [dB]')
title('RESAMPLED SPECTRUM')
grid on
subplot(2,2,4)
plot(FreqAxFU/ScFct,SpecFU,'.-','linewidth',1.1,'markersize',5,'Color',Red)
xlabel('Frequncy [kHz]')
ylabel('Power [dB]')
title('FILTERED+DOWNSAMPLED SPECTRUM')
grid on



%% FUNCTIONS %%

% >> Function to upsample the input signal by the factor X.
function SgnOut = Upsample( SgnIn, X )
  Len = length(SgnIn);
  SgnOut = zeros(1,X*Len);
  SgnOut(1:X:end) = SgnIn;
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


% >> Function to calculate FIR filter taps based on window method.
function B = FirWnd( Ntaps, Ftype, Fcut, Wtype, Fs )
    if strcmp(Ftype,'LPF') && (length(Fcut) == 1)
        WnL = Fcut*(2*pi/Fs);                                       % Calculate normalized cut-frequency [rad]
        WnH = 0;
    elseif strcmp(Ftype,'HPF') && (length(Fcut) == 1)
        WnL = 0;
        WnH = Fcut*(2*pi/Fs);
    elseif (strcmp(Ftype,'BPF') || strcmp(Ftype,'BSF'))  && (length(Fcut) == 2)
        WnL = Fcut(1)*(2*pi/Fs);
        WnH = Fcut(2)*(2*pi/Fs);
    else
        error('Invalid cut-frequencies (Fcut) or filter type (Ftype)')
    end
    M = (Ntaps-1)/2;
    hH = sin(WnH*(-M:1:-1))./((-M:1:-1)*pi);
    hH(M+1) = WnH/pi;
    hH(M+2:1:Ntaps) = hH(M:-1:1);
    hL = sin(WnL*(-M:1:-1))./((-M:1:-1)*pi);
    hL(M+1) = WnL/pi;
    hL(M+2:1:Ntaps) = hL(M:-1:1);
    switch Ftype                                                    % see Tab. 7.1 at Pag. 221
        case 'LPF'                                                  % LOW-PASS FILTER
            h(1:Ntaps) = hL(1:Ntaps);
        case 'HPF'                                                  % HIGH-PASS FILTER
            h(1:Ntaps) = -hH(1:Ntaps);
            h(M+1) = 1+h(M+1);
        case 'BPF'                                                  % BAND-PASS FILTER
            h(1:Ntaps) = hH(1:Ntaps)-hL(1:Ntaps);
        case 'BSF'                                                  % STOP-PASS FILTER
            h(1:Ntaps) = hL(1:Ntaps)-hH(1:Ntaps);
            h(M+1) = 1+h(M+1);
    end
    switch Wtype                                                    % see Tab. 7.7 at Pag. 241
        case 'REC'                                                  % RECTANGULAR WINDOW
            w(1:Ntaps) = ones(1,Ntaps);
        case 'TRI'
            w = 1-abs(-M:1:M)/M;
        case 'HAN'
            w = 0.5+0.5*cos((-M:1:M)*pi/M);
        case 'HAM'
            w = 0.54+0.46*cos((-M:1:M)*pi/M);
        case 'BLK'
            w = 0.42+0.5*cos((-M:1:M)*pi/M)+0.08*cos(2*(-M:M)*pi/M);
        otherwise
            error(' Invalid window type (Wtype)')
    end
    B = h.*w;                                                       % Scale taps by selected window
end
