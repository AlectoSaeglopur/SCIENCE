
%%% Title: ADAPTIVE FILTER FOR SYSTEM MODELING THROUGH LMS ALGORITHM
%%% Author: Filippo Valmori
%%% Date: 25/02/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013) [Ch.10]

close all
clearvars
clc


%% PARAMETERS

Fs = 10e3;                                                          % Sample rate [Sa/s]
Order = 5;                                                          % IIR filter order [.] (unknown system)
Fcut = [1 2]*1e3;                                                   % IIR cutoff frequencies ('BPF' by default) [Hz] (unknown system)
Rip = 25;                                                           % IIR filter Stopband ripple [dB] (unknown system)

Ntaps = 41;                                                         % Number of adaptive filter taps (FIR) [.]
Mu = 1e-3;                                                          % Adaptve filter convergence factor (NB: see "adapt_filter_noise_canceling.m" script for optimal setting)

Ncyc = 800;                                                         % Number of input signal cycles to be simulated (case #1+2)
Amp = 1;                                                            % Input signal amplitude [V] (case #1+2)
Fc1 = 0.5e3;                                                        % Frequency of 1st input tone [Hz] (case #1)
Fc2 = 1.5e3;                                                        % Frequency of 2nd input tone [Hz] (case #1)
Fc3 = 2.5e3;                                                        % Frequency of 3rd input tone [Hz] (case #1)



%% CONSTANTS

Npt = 512;                                                          % Number of points for filter representation
ScFct = 1e3;                                                        % Scale factor for time plots (e.g. 1e3 = 1ms)
Blue = [.2 .2 1];                                                   % Custom blue color
Green = [.2 .8 .2];                                                 % Custom green color
Azure = [0 .8 .8];                                                  % Custom azure color
Red = [1 .2 0];                                                     % Custom red color



%% PROCESSING

[B,A] = cheby2(Order,Rip,Fcut/(Fs/2),'bandpass');                   % Design Type-II Chebyshev IIR filter taps (unknown system)
[Hs,FreqAxHs] = freqz(B,A,Npt,Fs);                                  % Get unknown system complex transfer function
Hs_mgn = 20*log10(abs(Hs));                                         % Estimate magnitude spectrum [dB] 
Hs_pha = 180*unwrap(angle(Hs))/pi;                                  % Estimate phase spectrum [deg]

LenSa = round(Ncyc*Fs/Fc1);                                         % Overall number of samples to be simulated
TimeAx = (0:LenSa-1)/Fs;                                            % Get signals time axis
SgnX1 = Amp*sin(2*pi*Fc1*TimeAx)+Amp*sin(2*pi*Fc2*TimeAx)+ ...
        Amp*sin(2*pi*Fc3*TimeAx);                                   % Multitone input signal (case#1)
SgnD1 = filter(B,A,SgnX1);                                          % Unknown system output (case#1)
W1 = AdaptFiltSM(SgnD1,SgnX1,Ntaps,Mu);                             % Apply LMS adaptive filtering for system modeling (case#1)
[Hw1,FreqAxHw1] = freqz(W1,1,Npt,Fs);                               % Get complex final adaptive filter transfer function (case#1)
Hw1_mgn = 20*log10(abs(Hw1));                                       % Estimate magnitude spectrum [dB] 
Hw1_pha = 180*unwrap(angle(Hw1))/pi;                                % Estimate phase spectrum [deg]

SgnX2 = Amp*randn(1,LenSa);                                         % Pure noise input signal (case#2)
SgnD2 = filter(B,A,SgnX2);                                          % Unknown system output (case#2)
W2 = AdaptFiltSM(SgnD2,SgnX2,Ntaps,Mu);                             % Apply LMS adaptive filtering for system modeling (case#2)
[Hw2,FreqAxHw2] = freqz(W2,1,Npt,Fs);                               % Get complex final adaptive filter transfer function (case#2)
Hw2_mgn = 20*log10(abs(Hw2));                                       % Estimate magnitude spectrum [dB] 
Hw2_pha = 180*unwrap(angle(Hw2))/pi;                                % Estimate phase spectrum [deg]



%% RESULTS

figure
subplot(2,3,1)
plot(FreqAxHs,Hs_mgn,'.-','Color',Blue)
title("UNKNOWN SYSTEM")
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
ylim([-Rip-20 5])
grid on
subplot(2,3,4)
plot(FreqAxHs,Hs_pha,'.-','Color',Blue)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Phase [deg]','fontsize',11)
grid on

subplot(2,3,2)
plot(FreqAxHw1,Hw1_mgn,'.-','Color',Red)
title("ADAPTIVE FILTER (#1)")
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
ylim([-Rip-20 5])
grid on
subplot(2,3,5)
plot(FreqAxHw1,Hw1_pha,'.-','Color',Red)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Phase [deg]','fontsize',11)
grid on

subplot(2,3,3)
plot(FreqAxHw2,Hw2_mgn,'.-','Color',Green)
title("ADAPTIVE FILTER (#2)")
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
ylim([-Rip-20 5])
grid on
subplot(2,3,6)
plot(FreqAxHw2,Hw2_pha,'.-','Color',Green)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Phase [deg]','fontsize',11)
grid on



%% FUNCTIONS

% >> Function to apply adaptive filtering for system modeling through LMS algorithm.
function W = AdaptFiltSM( SgnD, SgnX, Ntaps, Mu )
    LenSa = length(SgnX);
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



%% FUNCTIONS

% 1. The only difference between case #1 and #2 is the input signal (X). As can be seen from the results, the wider
%    the bandwidth of the input signal the more accurately the adaptive filter can copy the unknown system transfer
%    (thus, a pure noise signal with white spectrum is the best choice in this sense).

% 2. Use Fig. 10.11 as reference.
