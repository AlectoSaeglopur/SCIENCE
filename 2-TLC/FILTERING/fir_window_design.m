
%%% Title: WINDOW METHOD FIR FILTER DESIGN
%%% Author: Filippo Valmori
%%% Date: 08/02/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013)

close all
clearvars
clc


%% PARAMETERS

Fs = 12e3;                                                          % Sample rate [Sa/s]
Order = 28;                                                         % Filter order [NB: shall be even for linear phase, since Ntaps = Order+1]
Ftype = 'BSF';                                                      % Filter type (choose 'LPF', 'HPF', 'BPF' or 'BSF')
Fcut = [1e3 2.5e3];                                                 % Cut-off frequencies [Hz] (see NOTE#2)
Wtype = 'HAN';                                                      % Window type (choose 'REC', 'TRI', 'HAN', 'HAM', 'BLK')

Fc1 = 500;                                                          % "Slower" sinusoid frequency [Hz]
Fc2 = 1700;                                                         % "Faster" sinusoid frequency [Hz] [NB: Fc2 shall be larger than Fc1]
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



%% PROCESSING

B = FirWnd(Order+1,Ftype,Fcut,Wtype,Fs);                            % Design FIR taps through window method
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



%% RESULTS

figure
subplot(2,3,1)
box on
plot(FreqAx,H_mgn,'.-','linewidth',1,'markersize',3,'Color',Black)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
title(strcat('TRANSFER FUNCTION (',Ftype,'-',num2str(Order),'-',Wtype,')'))
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

% 2. "Fcut" shall have x1 element in case of LPF or HPF design, and x2 elements in case of BPF or SBF design.
%    "Fcut" can vary from 0 and to the folding frequency (i.e. Fs/2).
%    "Fcut" represents the frequencies at which the magnitude spectrum shows 6-dB attenuation (since 20*log10(.) is used for its estimate).
