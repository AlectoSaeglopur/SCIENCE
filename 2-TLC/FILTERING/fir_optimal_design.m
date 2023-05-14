
%%% Title: OPTIMAL METHOD FIR FILTER DESIGN
%%% Author: Filippo Valmori
%%% Date: 11/02/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013)

close all
clearvars
clc


%% PARAMETERS %%

Fs = 12e3;                                                          % Sample rate [Sa/s]
Order = 30;                                                         % Filter order [NB: shall be even for linear phase, since Ntaps = Order+1]
Ftype = 'BPF';                                                      % Filter type (choose 'LPF', 'HPF', 'BPF' or 'BSF')
Fedge =[.8 1.4 2.3 2.7]*1e3;                                        % Passband and stopband edges array [Hz] (see NOTE#2)
Att = [1 -30];                                                      % 2-element array specifying maximum passband ripple (positive)and minimum stopband attenuation (negative) [dB]

Fc1 = 0.5e3;                                                        % "Slower" sinusoid frequency [Hz]
Fc2 = 2e3;                                                          % "Faster" sinusoid frequency [Hz] [NB: Fc2 shall be larger than Fc1]
Ncyc1 = 6;                                                          % Number of "slower" sinusoid cycles to be simulated



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

B = FirOpt(Order,Fedge,Att,Ftype,Fs);                               % Design FIR taps through optimal method                            
[H,FreqAxH] = freqz(B,1,Npt,Fs);                                    % Get complex transfer function [NB: keep A=1 for FIR]
H_mgn = 20*log10(abs(H));                                           % Estimate magnitude spectrum [dB] 
H_pha = 180*unwrap(angle(H))/pi;                                    % Estimate phase spectrum [deg]

TimeAx = (0:round(Ncyc1*Fs/Fc1)-1)/Fs;                              % Get time axis for plots
SgnSrc1 = sin(2*pi*Fc1.*TimeAx);                                    % Generate "slower" signal
SgnSrc2 = sin(2*pi*Fc2.*TimeAx);                                    % Generate "faster" signal
SgnSrc = SgnSrc1+SgnSrc2;                                           % Get overall source signal signal
SgnFlt = filter(B,1,SgnSrc);                                        % Filter signal with designed FIR taps
[FreqAxS,SpecSgnSrc,~] = GetSpect(SgnSrc,Fs);                       % Estimate source signal power spectrum
[~,SpecSgnFlt,~] = GetSpect(SgnFlt,Fs);                             % Estimate filtered signal power spectrum



%% RESULTS %%

figure
subplot(2,3,1)
box on
plot(FreqAxH,H_mgn,'.-','linewidth',1,'markersize',3,'Color',Black)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
title(strcat('TRANSFER FUNCTION (',Ftype,'-',num2str(Order),')'))
grid on
subplot(2,3,4)
box on
plot(FreqAxH,H_pha,'.-','linewidth',1.1,'markersize',3,'Color',Grey)
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

% >> Function to calculate FIR filter taps based on optimal method (aka Parks-McClellan algorithm).
function B = FirOpt( Ntaps, Fedge, Att, Ftype, Fs )
    Fnorm = [0 Fedge/(Fs/2) 1];
    Attp = 10^(Att(1)/20)-1;
    Atts = 10^(Att(2)/20);
    switch Ftype
        case 'LPF'
            Magn = [1 1 0 0];
            W = [1 round(Attp/Atts)];                               % for simplicity's sake Wp is always kept equal to 1
        case 'HPF'
            Magn = [0 0 1 1];
            W = [round(Attp/Atts) 1];
        case 'BPF'
            Magn = [0 0 1 1 0 0];
            W = [round(Attp/Atts) 1 round(Attp/Atts)];
        case 'BSF'
            Magn = [1 1 0 0 1 1];
            W = [1 round(Attp/Atts) 1];
        otherwise
            error('Invalid filter type (Ftype)')
    end

    B = firpm(Ntaps,Fnorm,Magn,W);                                  % function "firpm" is the replacement for the obsolete "remez"
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

% 1. Note that for each possible design (with odd or even Ntaps) the FIR filter phase response is always linear in the pass-band (and don't care
%    about the stop-band since those frequency components are attenuated/removed).

% 2. "Fedge" represents the passband and stopband edges array containg the frequency edges in Hz for the transition-bands.
%    "Fedge" shall be a 2-element for LPF/HPF and 4-element for BPF/SBF.

% 3. Note there's no certainty that a single run of the design procedure satisfies the requirements (i.e. bandpass ripple and stopband attenuation).
%    In this case execute another run by increasing Ntaps parameter and check through the transfer function magnitude plots if they are now fulfilled.
