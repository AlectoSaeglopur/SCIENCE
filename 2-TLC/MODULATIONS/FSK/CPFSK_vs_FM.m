
% Comparison between analog and digital frequency modulations. This has been
% performed by generating corresponding baseband waveforms and spectra for
% FM and 2-CPFSK modulations (using respectively sine and square waves as
% modulating signal). As expected, results are similar. 

close all; clearvars; clc


%% COMMON PARAMETERS

Nbits = 100;                                                % Number of bits to be simulated
Rb = 10e3;                                                  % Bit rate [b/s]
h = 1;                                                      % Modulation index
Eps = 1e-14;                                                % Correction factor for spectra estimate
ScTF = 1e3;                                                 % Time/frequency scale factor (e.g. 1000 -> ms/kHz)
WaveXlim = 1e-3;
SpectXlim = 90;
SpectYlim = [-400 50];
Blue = [.2 .2 1];                                           % Custom blue color
Green = [.2 .8 .2];                                         % Custom green color
Orange = [1 .7 .2];                                         % Custom orange color
Violet = [.8 0 .8];                                         % Custom violet color
Azure = [0 .8 .8];                                          % Custom azure color
Red = [1 .2 0];                                             % Custom red color



%% DIGITAL CASE (CPFSK)

osfD = 16;                                                  % Digital baseband oversampling factor
devD = h*Rb/2;                                              % Digital frequency deviation [Hz]
FsBBD = osfD*Rb;                                            % Digital baseband sample rate [Sa/s]
TsBBD = 1/FsBBD;                                            % Digital baseband sample period [s]

AntSymbs = (-1).^(0:Nbits-1);                               % Sequence of antipodal symbols (+/-1)
ModSgnD = devD*repelem(AntSymbs,osfD);                      % Digital modulating signal (oversampled square wave)
PhaseD = 2*pi*Integrator(ModSgnD,TsBBD);                    % Phase integration
DigWaveI = cos(PhaseD);                                     % In-phase part of the digital baseband waveform
DigWaveQ = sin(PhaseD);                                     % Quadrature part of the digital baseband waveform
DigWaveI(end) = DigWaveI(end)+Eps;                          % The actual final would cause the spectrum not to be computed!
DigWaveQ(end) = DigWaveQ(end)+Eps;                          % The actual final would cause the spectrum not to be computed!
DigSgnBB = DigWaveI+1i*DigWaveQ;                            % Complex digital baseband signal
TimeBBD = TsBBD*(0:Nbits*osfD-1);                           % Time axis for digital waveform
[FreqAxD,SpectD] = GetSpect(DigSgnBB,FsBBD);                % Digital spectrum estimate (see [NB#2] below)



%% ANALOG CASE (FM)

Fm = Rb/2;                                                  % Frequency of the modulating sinusoid [Hz]
Am = 1;                                                     % Amplitude of the modulating sinusoid
devA = h*Fm/Am;                                             % Analog frequency deviation [Hz]  
osfA = 2*osfD;                                              % Not essential using an increased osf! (just to get better waveform resolution)
FctX = pi/2;                                                % See [NB#1] below
FsBBA = osfA*Fm;                                            % Analog baseband sample rate [Sa/s]
TsBBA = 1/FsBBA;                                            % Analog baseband sample period [s]
Tcycles = floor(Nbits/2);                                   % Number of sinusoid cycles corresponding to Nbits
TimeBBA = TsBBA*(0:Tcycles*osfA-1);                         % Time axis for analog waveform
ModSgnA = Am*devA*sin(2*pi*Fm*TimeBBA)*FctX;                % Modulating sinusoid (already multiplied by deviation)
PhaseA = 2*pi*Integrator(ModSgnA,TsBBA);                    % Phase integration
AnaWaveI = cos(PhaseA);                                     % In-phase part of the analog baseband waveform
AnaWaveQ = sin(PhaseA);                                     % Quadrature part of the analog baseband waveform
AnaSgnBB = AnaWaveI+1i*AnaWaveQ;                            % Complex analog baseband signal
[FreqAxA,SpectA] = GetSpect(AnaSgnBB,FsBBA);                % Analog spectrum estimate (see [NB#2] below)



%% RESULTS

figure('Name',' BASEBAND RESULTS','NumberTitle','off');
subplot(3,2,1); hold on; box on
plot(TimeBBD*ScTF,ModSgnD/ScTF,'.-','Color',Orange)
plot(TimeBBA*ScTF,ModSgnA/ScTF,'.-.','Color',Green);
xlabel('Time [ms]'); ylabel('Frequency Shift [kHz]'); grid on
axis([0 1 1.3*devD*FctX/ScTF*[-1 1]]); hold off
title('MODULATING SIGNALS'); legend(' Digital (Square Wave)',' Analog (Sinusoid)')

subplot(3,2,2); hold on; box on
plot(TimeBBD*ScTF,PhaseD,'.-','Color',Orange)
plot(TimeBBA*ScTF,PhaseA,'.-.','Color',Green)
xlabel('Time [ms]'); ylabel('Phase Shift [rad]'); grid on
axis([0 1 h*[-.3 3.5]]); hold off
title('AFTER INTEGRATOR'); legend(' Digital',' Analog')

subplot(3,2,3); hold on; box on
plot(TimeBBD*ScTF,DigWaveI,'.-.','Color',Blue)
plot(TimeBBD*ScTF,DigWaveQ,'.-','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveXlim*ScTF -1.2 1.2]); hold off
title('DIGITAL WAVEFORM'); legend(' In-phase',' Quadrature')

subplot(3,2,4); hold on; box on
plot(TimeBBA*ScTF,AnaWaveI,'.-.','Color',Blue)
plot(TimeBBA*ScTF,AnaWaveQ,'.-','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveXlim*ScTF -1.2 1.2]); hold off
title('ANALOG WAVEFORM'); legend(' In-phase',' Quadrature')

subplot(3,2,5)
plot(FreqAxD/ScTF,SpectD,'.-','Color',Violet)
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectXlim*[-1 1] SpectYlim])
title('DIGITAL SPECTRUM'); grid on

subplot(3,2,6)
plot(FreqAxA/ScTF,SpectA,'.-','Color',Azure)
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectXlim*[-1 1] SpectYlim])
title('ANALOG SPECTRUM'); grid on



%% EXTRA FUNCTIONS

% >> Function for integrating the input signal (specifying also its sample period).
function [ OutSamps ] = Integrator( InSamps, Ts )
    IntegrNum = 1;                                          % Numerator taps of integrator
    IntegrDen = [1 -1];                                     % Denominator taps of integrator (1st order IIR)
    OutSamps = filter(Ts*IntegrNum,IntegrDen,InSamps);
end

% >> Function for getting the power spectrum of the input waveform.
function [ FreqAx, PwrSpect ] = GetSpect( Sgn, Fs )   
    Ns = length(Sgn);                                       % Length (in samples) of the input waveform
    dF = Fs/Ns;                                             % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                              % Frequency axis for spectrum plot
    
    AAA = fft(Sgn);
    CpxSpect = fftshift(AAA)/Ns;                       % Complex spectrum
    PwrSpect = 20*log10(abs(CpxSpect));                     % Power spectrum [dBW]
end



%% NOTES

% [NB#1] In order to compare digital and analog outcomes, the area of the modulating signals (estimated by
% the integrator) must be the same. Since AreaA = integral(sin)|0-pi = 2 and AreaD = integr(1)|0-pi = pi,
% the factor by which ModSgnA has to be multiplied results FctX = AreaD/AreaA = pi/2.

% [NB#2] As can be seen from the last two figures, both analog and digital spectra are composed of distinct
% lines (i.e. notcontinuous spectra) since the baseband waves (both real and imaginary parts) result periodic.
% Then, analyzing the digital spectrum in detail, it shows harminics at frequencies: [a] devD (since the
% in-phase part of the corresponding waveform is a sinusoid with rate devD), [b] DC (since the quadrature
% part of the corresponding waveform has a non-zero mean value), [c] K*2*devD with K assuming positive integer
% values (since the quadrature part of the corresponding waveform is the absolute value of sinusoid with rate
% 2*devD and, thus, generates all the even and odd harminics of the fundamental frequency 2*devD).
