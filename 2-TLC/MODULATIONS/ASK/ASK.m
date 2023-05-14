
%%% Title: DIGITAL/ANALOG AMPLITUDE MODULATORS (ASK/AM)
%%% Author: Filippo Valmori
%%% Date: 15/02/2019
%%% Reference: [1] https://en.wikipedia.org/wiki/Frequency-shift_keying


close all; clearvars; clc


%% PARAMETERS AND CONSTANTS

Nbits = 300;                                                                % Number of bits to be simulated
Rb = 10e3;                                                                  % Bit rate [b/s]
Fc = 10e6;                                                                  % Carrier frequency [Hz]
M = 4;                                                                      % Modulation order
osf = 16;                                                                   % Baseband oversampling factor
PhOfst = pi/3;                                                              % Constellation phase offset [rad]

Rs = Rb/log2(M);                                                            % Symbol rate [S/s]
FsBB = osf*Rs;                                                              % Baseband sample rate [Sa/s]
TsBB = 1/FsBB;                                                              % Baseband sample period [s]
FsRF = 12*Fc;                                                               % RF sample rate [Sa/s]

WaveBBxlim = 4e-3;                                                          % Limit on X-axis for BB waveform plot [s]
SpectBBxlim = FsBB/2e3;                                                     % Limit on X-axis for BB spectrum plot [kHz]
SpectBBylim = -70;                                                          % Limit on Y-axis for BB spectrum plot [dBW]
SpanRFxlim = 10*Rs;                                                         % Span on X-axis for RF spectrum plot [Hz]
SpectRFylim = -90;                                                          % Limit on Y-axis for RF spectrum plot [dBW]
Blue = [.2 .2 1];                                                           % Custom blue color
Green = [.2 .8 .2];                                                         % Custom green color
Orange = [1 .7 .2];                                                         % Custom orange color
Violet = [.8 0 .8];                                                         % Custom violet color
Azure = [0 .8 .8];                                                          % Custom azure color
Red = [1 .2 0];                                                             % Custom red color
Brown = [.5 .2 0];                                                          % Custom brown color



%% DIGITAL / ASK

[Symbs,Nsymbs] = GetSymbs(Nbits,M);                                         % Retrieve random symbols stream and its length
TimeBB = TsBB*(0:Nsymbs*osf-1);                                             % Time axis for BB waveform
AskSgnBB = repelem(Symbs,osf)*exp(1i*PhOfst);                               % ASK complex baseband signal (with constellation rotation)
AskWaveI = real(AskSgnBB);                                                  % ASK baseband in-phase waveform
AskWaveQ = imag(AskSgnBB);                                                  % ASK baseband quadrature waveform
[AskFreqBB,AskSpectBB,~] = GetSpect(AskSgnBB,FsBB);                         % ASK baseband signal power spectrum
TimeRF = 0:1/FsRF:TimeBB(end);                                              % Time axis for RF waveform
AskSgnRF = InterpAlf(TimeBB,AskWaveI,TimeRF).*cos(2*pi*Fc*TimeRF) ...       % ASK radio-frequency signal
    -InterpAlf(TimeBB,AskWaveQ,TimeRF).*sin(2*pi*Fc*TimeRF);
[AskFreqRF,AskSpectRF,~] = GetSpect(AskSgnRF,FsRF);

figure('Name','ASK','NumberTitle','off');
subplot(2,2,1); hold on; box on
plot(TimeBB*1e3,AskWaveI,'.-','Color',Blue)
plot(TimeBB*1e3,AskWaveQ,'.-.','Color',Azure)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 1.2*max(Symbs)*[-1 1]]); hold off
title('BASEBAND WAVEFORM'); legend(' In-phase',' Quadrature')
subplot(2,2,2); box on
plot(TimeRF*1e3,AskSgnRF,'.-.','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 1.2*max(Symbs)*[-1 1]])
title('BANDPASS WAVEFORM')
subplot(2,2,3);
plot(AskFreqBB/1e3,AskSpectBB,'Color',Green)
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectBBxlim*[-1 1] SpectBBylim 0])
title('BASEBAND SPECTRUM'); grid on
subplot(2,2,4);
plot(AskFreqRF/1e6,AskSpectRF,'Color',Violet)
xlabel('Frequency [MHz]'); ylabel('Power [dBW]')
axis([(SpanRFxlim*[-1 1]+Fc)/1e6 SpectRFylim 0])
title('BANDPASS SPECTRUM'); grid on



%% ANALOG / AM

AmSgnBB = 1+cos(2*pi*Rs*TimeBB)-sin(2*pi*Rs/3*TimeBB);                      % Example of AM modulating signal
[AmFreqBB,AmSpectBB,~] = GetSpect(AmSgnBB,FsBB);
AmSgnRF = spline(TimeBB,AmSgnBB,TimeRF).*sin(2*pi*Fc*TimeRF);
[AmFreqRF,AmSpectRF,~] = GetSpect(AmSgnRF,FsRF);

figure('Name','AM','NumberTitle','off');
subplot(2,2,1); hold on; box on
plot(TimeBB*1e3,AmSgnBB,'.-.','Color',Blue)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 1.2*max(Symbs)*[-1 1]]); hold off
title('BASEBAND WAVEFORM')
subplot(2,2,2); box on
plot(TimeRF*1e3,AmSgnRF,'.-.','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 1.2*max(Symbs)*[-1 1]])
title('BANDPASS WAVEFORM')
subplot(2,2,3);
plot(AmFreqBB/1e3,AmSpectBB,'Color',Green)
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectBBxlim*[-1 1] SpectBBylim-300 0])
title('BASEBAND SPECTRUM'); grid on
subplot(2,2,4);
plot(AmFreqRF/1e6,AmSpectRF,'Color',Violet)
xlabel('Frequency [MHz]'); ylabel('Power [dBW]')
axis([(SpanRFxlim*[-1 1]+Fc)/1e6 SpectRFylim 0])
title('BANDPASS SPECTRUM'); grid on



%% EXTRA FUNCTIONS

function [ OutSymbs, SymbLen ] = GetSymbs( Nbits, M )
%     rng(76)
    TxBits = randi([0 1],1,Nbits);
    L = log2(M);                                                            % Number of bits per symbol
    GrayMtx = zeros(M,L);                                                   % Gray mapping matrix
    LastCell = [0;1];
    GrayMtx(1:2,end) = LastCell;
    for i = 2:L
        GrayMtx(1+2^(i-1):2^i,end-i+2:end) = flipud(LastCell);
        GrayMtx (1+2^(i-1):2^i,end-i+1) = 1;
        LastCell = GrayMtx(1:2^i,end-i+1:end);
    end
    GrayMap = zeros(1,M);
    for i = 1:M
        j = 0;
        while j <= M
            if j == bi2de(GrayMtx(i,:),'left-msb')
                GrayMap(i) = j;
                break;
            else
                j = j+1;
            end
        end
    end
    SymbLen = Nbits/L;
    OutSymbs = zeros(1,SymbLen);
    MinVal = 1-M;
    for i = 1:SymbLen
        OutSymbs(i) = GrayMap(bi2de(TxBits(1+(i-1)*L:i*L),'left-msb')+1);
        OutSymbs(i) = MinVal+2*OutSymbs(i);
    end
end


function [ FreqAx, PwrSpect, OvPwrF ] = GetSpect( Sgn, Fs )
    Ns = length(Sgn);                                                           % Length (in samples) of the input waveform
    dF = Fs/Ns;                                                                 % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                                                  % Frequency axis for spectrum plot
    CpxSpect = fftshift(fft(Sgn))/Ns;                                           % Complex spectrum
    PwrSpect = 20*log10(abs(CpxSpect));                                         % Power spectrum [dBW/Hz]
    OvPwrF = 10*log10(sum((abs(CpxSpect)).^2));                                 % Overall signal power [dBW] estimated in frequency domain (NB: do NOT multiply by dF, that's wrong for this descrete representation!)
    % as a check, below overall power is estimated in time as well %
%     OvPwrT = 10*log10(sum(Sgn.^2)/length(Sgn));                                 % Overall signal power [dBW] estimated in time domain (i.e. P = Vrms^2/R, where Vrms = sqrt(1/N*sum(Sgn[i]^2)) and assuming R = 1 Ohm)
end


function [ SgnB ] = InterpAlf( TimeA, SgnA, TimeB )
    LenB = length(TimeB);
    SgnB = zeros(1,LenB);
    Idx = 2;                                                                % Index for time limit instatnt A for B
    for j = 1:LenB
        if ( TimeB(j) > TimeA(Idx) )
            Idx = Idx+1;
        end
        SgnB(j) = SgnA(Idx-1);
    end
end


% [NB#1] When M = 2, PhOfst = pi/2 assures phase continuity at symbol times!
