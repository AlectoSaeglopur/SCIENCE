
%%% Title: PASSBAND SIGNAL UNDERSAMPLING
%%% Author: Filippo Valmori
%%% Date: 12/03/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013) [Ch.12]

close all
clearvars
clc



%% PARAMETERS

FcRF = 8010;                                                                        % Radio-frequency center frequency [Hz]
FcBB = 50;                                                                          % Baseband bandwidth [Hz]
Ncyc = 5;                                                                           % Number of baseband signal cycles to be simulated



%% CONSTANTS

FsRF = FcRF*1000;                                                                    % RF sample-rate [Sa/s] (NB: keep it high, the RF signal shall simulate the original analog one!)
ScFct = 1e3;                                                                        % Scale factor for time plots (e.g. 1e3 = 1ms)
Blue = [.2 .2 1];                                                                   % Custom blue color
Green = [.2 .8 .2];                                                                 % Custom green color
Orange = [1 .7 .2];                                                                 % Custom orange color
Violet = [.8 0 .8];                                                                 % Custom violet color
Azure = [0 .8 .8];                                                                  % Custom azure color
Red = [1 .2 0];                                                                     % Custom red color
Brown = [.5 .2 0];                                                                  % Custom brown color
Grey = [.7 .7 .7];                                                                  % Custom grey color
Black = [0 0 0];                                                                    % Custom black color



%% PROCESSING

TimeAxRF = 1/FsRF*(0:round(Ncyc*FsRF/FcBB)-1);                                      % Get RF time axis
SgnBB = sin(2*pi*FcBB*TimeAxRF);                                                    % Generate BB signal for plot comparison
SgnRF = SgnBB.*sin(2*pi*FcRF*TimeAxRF);                                             % Genetate analog RF signal
[SgnUS,TimeAxBB,FsUS] = BandpassUndersamp(SgnRF,FcBB,FcRF,FsRF);                    % Apply passband-signal undersampling
[FreqAxRF,SpectRF,~] = GetSpect(SgnRF,FsRF);                                        % Get RF power spectrum
[FreqAxBB,SpectBB,~] = GetSpect(SgnBB,FsRF);                                        % Get BB original power spectrum
[FreqAxUS,SpectUS,~] = GetSpect(SgnUS,FsUS);                                        % Get BB undersampled power spectrum



%% RESULTS

fprintf(' * FcRF = %d Hz\n',FcRF);
fprintf(' * FcBB = %d Hz\n',FcBB);
fprintf(' * FsUS = %d Sa/s\n\n',FsUS);

figure
subplot(1,2,1)
box on
hold on
plot(TimeAxRF*ScFct,SgnRF,'.-','linewidth',1,'markersize',1,'Color',Orange)
plot(TimeAxRF*ScFct,SgnBB,'*-.','linewidth',1,'markersize',1.5,'Color',Red)
plot(TimeAxBB*ScFct,SgnUS,'o-.','linewidth',1.2,'markersize',3,'Color',Blue)
legend('RF','BB','US')
xlabel('Time [ms]')
ylabel('Amplitude [V]')
hold off
grid on
subplot(1,2,2)
box on
hold on
plot(FreqAxRF/ScFct,SpectRF,'*-','linewidth',1,'markersize',3,'Color',Orange)
plot(FreqAxBB/ScFct,SpectBB,'*-','linewidth',1,'markersize',3,'Color',Red)
plot(FreqAxUS/ScFct,SpectUS,'*-','linewidth',1,'markersize',3,'Color',Blue)
xlim([-FcRF-100*FcBB FcRF+100*FcBB]/ScFct)
legend('RF','BB','US')
xlabel('Frequency [kHz]')
ylabel('Power [dB]')
hold off
grid on



%% FUNCTIONS

% >> Function to undersample passband signal.
function [ SgnOut, Time, FsUS ] = BandpassUndersamp( SgnIn, B, Fc, FsRF )
    X = 4;                                                                          % BB oversampling factor (for higher undersampled-signal resolution)
    Fact = Fc/(X*B);
    if Fact ~= round(Fact)
        fprintf(' § Case #3 (non-integer) : Fact = %1.2f\n',Fact);
        Fact = floor(Fact);
        B = Fc/(X*Fact);
    end
    FsUS = 2*B*X;                                                                   % Calculate undersampling sample-rate [Sa/s]
    M = FsRF/FsUS;                                                                  % Calculate undersampling factor
    if mod(Fact,2) == 0
        fprintf(' § Case #1 (even) : Fact = %d\n',Fact);
        Ndly = Fact/2;                                                              % Sampling delay (adjusted for sinusoid input)
        Gain = 1;
    else
        fprintf(' § Case #2 (odd) : Fact = %d\n',Fact);
        Ndly = (Fact-1)/2;
        Gain = -1*(2*X);
    end
    SgnOut = Gain*SgnIn(1+Ndly:M:end);
    Time = 1/FsUS*(0:length(SgnOut)-1)+Ndly/FsUS/M;
end


% >> Function to get the power spectrum of the input signal.
function [ FreqAx, PwrSpect, OvPwrF ] = GetSpect( Sgn, Fs )
    Ns = length(Sgn);                                                               % Length (in samples) of the input waveform
    dF = Fs/Ns;                                                                     % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                                                      % Frequency axis for spectrum plot
    CpxSpect = fftshift(fft(Sgn))/Ns;                                               % Complex spectrum
    PwrSpect = 20*log10(abs(CpxSpect));                                             % Power spectrum [dBW/Hz]
    OvPwrF = 10*log10(sum((abs(CpxSpect)).^2));                                     % Overall signal power [dBW] estimated in frequency domain (NB: do NOT multiply by dF, that's wrong for this descrete representation!)
    % As a check, below the overall power is estimated in time as well %
%     OvPwrT = 10*log10(sum(Sgn.^2)/length(Sgn));                                     % Overall signal power [dBW] estimated in time domain (i.e. P = Vrms^2/R, where Vrms = sqrt(1/N*sum(Sgn[i]^2)) and assuming R = 1 Ohm)
end
