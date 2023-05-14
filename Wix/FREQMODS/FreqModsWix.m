
%%% Title: DIGITAL FREQUENCY MODULATORS (FSK, CPFSK AND GFSK)
%%% Author: Filippo Valmori
%%% Date: 15/02/2019
%%% Reference: [1] https://en.wikipedia.org/wiki/Frequency-shift_keying


close all; clearvars; clc


%% PARAMETERS AND CONSTANTS

Nbits = 480;                                            % Number of bits to be simulated
Rb = 10e3;                                              % Bit rate [b/s]
Fc = 10e6;                                              % Carrier frequency [Hz]
M = 4;                                                  % Modulation order
h = 1.1;                                                % Modulation index
osf = 20;                                               % Baseband oversampling factor
span = 8;                                               % Span for Gaussian filter representation [S] (only GFSK)
sps = 8;                                                % Number of samples per symbol for Gaussian filter representation [Sa/S] (only GFSK)
BT = 0.3;                                               % 3dB bandwidth - symbol time product (only GFSK)

Rs = Rb/log2(M);                                        % Symbol rate [S/s]
dev = h*Rs/2;                                           % Inner frequency deviation [Hz]
FsBB = osf*Rs;                                          % Baseband sample rate [Sa/s]
TsBB = 1/FsBB;                                          % Baseband sample period [s]
FsRF = 12*Fc;                                           % RF sample rate [Sa/s]

WaveBBxlim = 1e-3;                                      % Limit on X-axis for BB waveform plot [s]
SpectBBxlim = FsBB/2e3;                                 % Limit on X-axis for BB spectrum plot [kHz]
SpectBBylim = -120;                                     % Limit on Y-axis for BB spectrum plot [dBW]
SpanRFxlim = 10*Rs;                                     % Span on X-axis for RF spectrum plot [Hz]
SpectRFylim = -110;                                     % Limit on Y-axis for RF spectrum plot [dBW]
Blue = [.2 .2 1];                                       % Custom blue color
Green = [.2 .8 .2];                                     % Custom green color
Orange = [1 .7 .2];                                     % Custom orange color
Violet = [.8 0 .8];                                     % Custom violet color
Azure = [0 .8 .8];                                      % Custom azure color
Red = [1 .2 0];                                         % Custom red color
Brown = [.5 .2 0];                                      % Custom brown color



%% FSK

[Symbs,Nsymbs] = GetSymbs(Nbits,M);                                         % Retrieve random symbols stream and its length
FskSamps = dev*repelem(Symbs,osf);                                          % Multiply symbols for inner deviation and oversample
TimeBB = TsBB*(0:Nsymbs*osf-1);                                             % Time axis for BB waveform
FskWaveI = cos(2*pi*FskSamps.*TimeBB);                                      % In-phase part of the FSK baseband waveform
FskWaveQ = sin(2*pi*FskSamps.*TimeBB);                                      % Quadrature part of the FSK baseband waveform
FskSgnBB = FskWaveI+1i*FskWaveQ;                                            % FSK complex baseband signal
[FskFreqBB,FskSpectBB] = GetSpect(FskSgnBB,FsBB);                           % FSK baseband signal power spectrum
TimeRF = 0:1/FsRF:TimeBB(end);                                              % Time axis for RF waveform
FskSgnRF = spline(TimeBB,FskWaveI,TimeRF).*cos(2*pi*Fc*TimeRF) ...          % FSK radio-frequency signal
    -spline(TimeBB,FskWaveQ,TimeRF).*sin(2*pi*Fc*TimeRF);
[FskFreqRF,FskSpectRF] = GetSpect(FskSgnRF,FsRF);                           % FSK radio-frequency signal power spectrum

figure('Name','FSK','NumberTitle','off'); subplot(2,2,1)
stem(0:Nsymbs*osf-1,FskSamps/1e3,'.','Color',Orange)
axis([Nsymbs*osf*[-0.05 1.05] (M-1)*dev*1.2/1e3*[-1 1]])
title('PCM WAVEFORM');grid on
xlabel('Sample [#]'); ylabel('Frequency Shift [kHz]')

subplot(2,2,2); hold on; box on
plot(TimeBB*1e3,FskWaveI,'.-.','Color',Blue)
plot(TimeBB*1e3,FskWaveQ,'.-','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 -1.2 1.2]); hold off
title('BASEBAND WAVEFORM'); legend(' In-phase',' Quadrature')

subplot(2,2,3);
plot(FskFreqBB/1e3,FskSpectBB,'Color',Green)
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectBBxlim*[-1 1] SpectBBylim 0])
title('BASEBAND SPECTRUM'); grid on

subplot(2,2,4);
plot(FskFreqRF/1e6,FskSpectRF,'Color',Violet)
xlabel('Frequency [MHz]'); ylabel('Power [dBW]')
axis([(SpanRFxlim*[-1 1]+Fc)/1e6 SpectRFylim 0])
title('RADIO-FREQUENCY SPECTRUM'); grid on



%% CPFSK

CpfskPcmPh = 2*pi*Integrator(FskSamps,TsBB);                                % Filtering by means of integrator
CpfskWaveI = cos(CpfskPcmPh);                                               % In-phase part of the CPFSK baseband waveform
CpfskWaveQ = sin(CpfskPcmPh);                                               % Quadrature part of the CPFSK baseband waveform
CpfskSgnBB = CpfskWaveI+1i*CpfskWaveQ;                                      % CPFSK complex baseband signal
[CpfskFreqBB,CpfskSpectBB] = GetSpect(CpfskSgnBB,FsBB);                     % CPFSK baseband power spectrum
CpfskSgnRF = spline(TimeBB,CpfskWaveI,TimeRF).*cos(2*pi*Fc*TimeRF) ...      % CPFSK radio-frequency waveform
    -spline(TimeBB,CpfskWaveQ,TimeRF).*sin(2*pi*Fc*TimeRF);
[CpfskFreqRF,CpfkSpectRF] = GetSpect(CpfskSgnRF,FsRF);                      % CPFSK radio-frequency signal power spectrum

figure('Name','CPFSK','NumberTitle','off')
subplot(2,2,1)
stem(0:Nsymbs*osf-1,CpfskPcmPh,'.','Color',Orange)
axis([Nsymbs*osf*[-0.05 1.05] min(CpfskPcmPh)-5 max(CpfskPcmPh)+5])
title('PCM WAVEFORM'); grid on
xlabel('Sample [#]'); ylabel('Phase Shift [rad]')

subplot(2,2,2); hold on; box on
plot((TimeBB+TsBB)*1e3,CpfskWaveI,'.-.','Color',Blue)
plot((TimeBB+TsBB)*1e3,CpfskWaveQ,'.-','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 -1.2 1.2]); hold off
title('BASEBAND WAVEFORM'); legend(' In-phase',' Quadrature')

subplot(2,2,3)
plot(CpfskFreqBB/1e3,CpfskSpectBB,'Color',Green)
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectBBxlim*[-1 1] SpectBBylim 0])
title('BASEBAND SPECTRUM'); grid on

subplot(2,2,4);
plot(CpfskFreqRF/1e6,CpfkSpectRF,'Color',Violet)
xlabel('Frequency [MHz]'); ylabel('Power [dBW]')
axis([(SpanRFxlim*[-1 1]+Fc)/1e6 SpectRFylim 0])
title('RADIO-FREQUENCY SPECTRUM'); grid on



%% GFSK

GfskPcmFreq = GaussFilter(FskSamps,BT,span,sps);                            % Gaussian filtering
GfskPcmPh = 2*pi*Integrator(GfskPcmFreq,TsBB);                              % Filtering by means of integrator
GfskWaveI = cos(GfskPcmPh);                                                 % In-phase part of the GFSK baseband waveform
GfskWaveQ = sin(GfskPcmPh);                                                 % Quadrature part of the GFSK baseband waveform
GfskSgnBB = GfskWaveI+1i*GfskWaveQ;                                         % GFSK complex baseband signal
[GfskFreqBB,GfskSpectBB] = GetSpect(GfskSgnBB,FsBB);                        % GFSK baseband power spectrum
GfskSgnRF = spline(TimeBB,GfskWaveI,TimeRF).*cos(2*pi*Fc*TimeRF) ...        % GFSK radio-frequency waveform
    -spline(TimeBB,GfskWaveQ,TimeRF).*sin(2*pi*Fc*TimeRF);
[GfskFreqRF,GfskSpectRF] = GetSpect(GfskSgnRF,FsRF);                        % GFSK radio-frequency signal power spectrum

figure('Name','GFSK','NumberTitle','off')
subplot(2,2,1)
stem(0:Nsymbs*osf-1,GfskPcmPh,'.','Color',Orange)
axis([Nsymbs*osf*[-0.05 1.05] min(GfskPcmPh)-5 max(GfskPcmPh)+5])
title('PCM WAVEFORM'); grid on
xlabel('Sample [#]'); ylabel('Phase Shift [rad]')

subplot(2,2,2); hold on; box on
plot((TimeBB+TsBB)*1e3,GfskWaveI,'.-.','Color',Blue)
plot((TimeBB+TsBB)*1e3,GfskWaveQ,'.-','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 -1.2 1.2]); hold off
title('BASEBAND WAVEFORM'); legend(' In-phase',' Quadrature')

subplot(2,2,3)
plot(GfskFreqBB/1e3,GfskSpectBB,'Color',Green)
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectBBxlim*[-1 1] SpectBBylim 0])
title('BASEBAND SPECTRUM'); grid on

subplot(2,2,4);
plot(GfskFreqRF/1e6,GfskSpectRF,'Color',Violet)
xlabel('Frequency [MHz]'); ylabel('Power [dBW]')
axis([(SpanRFxlim*[-1 1]+Fc)/1e6 SpectRFylim 0])
title('RADIO-FREQUENCY SPECTRUM'); grid on



%% RESAMPLING AT TARGET SAMPLE RATE AND GENERATION OF GNUR BASABAND COMPLEX INPUT FILE

FsSDR = 250e3;                                                              % Target baseband sample rate [Sa/s] (e.g. to match SDR requirements)
ModSDR = 'GFSK';                                                             % Modulation for GNUR file input

TimeSDR = 0:1/FsSDR:TimeBB(end);
switch ModSDR
    case 'FSK'
        SdrWaveI = interp1(TimeBB,FskWaveI,TimeSDR);
        SdrWaveQ = interp1(TimeBB,FskWaveQ,TimeSDR);
    case 'CPFSK'
        SdrWaveI = interp1(TimeBB,CpfskWaveI,TimeSDR);
        SdrWaveQ = interp1(TimeBB,CpfskWaveQ,TimeSDR);
    case 'GFSK'
        SdrWaveI = interp1(TimeBB,GfskWaveI,TimeSDR);
        SdrWaveQ = interp1(TimeBB,GfskWaveQ,TimeSDR);
    otherwise
        error('Invalid parameter: ModSDR');
end

fprintf(" - For optimal SDR Fs matching use osf >= %d\n",round(FsSDR/Rs));

figure; hold on
plot(TimeSDR*1e3,SdrWaveI,'b.-')
plot(TimeSDR*1e3,SdrWaveQ,'r.-')
axis([0 TimeSDR(end)*1e3 1.2*[-1 1]])
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on; hold off
title(sprintf('BASEBAND WAVEFORM @ %d kSa/s',FsSDR/1e3));

CpxLen = length(SdrWaveI);
StreamIQ(1:2:CpxLen*2-1) = SdrWaveI;
StreamIQ(2:2:CpxLen*2) = -SdrWaveQ;
fid = fopen(strcat(ModSDR,'_BB_Matlab'),'w');
fwrite(fid,StreamIQ,'float32');
fclose(fid);



%% EXTRA FUNCTIONS

%%% --> Function for generating random bits and mapping them into frequency symbols
%%%     as a function of the selected modulation order and according to Gray coding
function [ OutSymbs, SymbLen ] = GetSymbs( Nbits, M )

%     rng(76)
    TxBits = randi([0 1],1,Nbits);
        
    L = log2(M);                                        % Number of bits per symbol
    GrayMtx = zeros(M,L);                               % Gray mapping matrix
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
    MinVal = 1-2^L;
    for i = 1:SymbLen
        OutSymbs(i) = GrayMap(bi2de(TxBits(1+(i-1)*L:i*L),'left-msb')+1);
        OutSymbs(i) = MinVal+2*OutSymbs(i);
    end

end

%%% --> Function for getting the power spectrum of the input waveform
function [ FreqAx, PwrSpect ] = GetSpect( Sgn, Fs )
    
    Ns = length(Sgn);                                   % Length (in samples) of the input waveform
    dF = Fs/Ns;                                         % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                          % Frequency axis for spectrum plot
    CpxSpect = fftshift(fft(Sgn))/Ns;                   % Complex spectrum
    PwrSpect = 20*log10(abs(CpxSpect));                 % Power spectrum (in dBW)

end

%%% --> Function for integrating the input signal (specifying also its sample period)
function [ OutSamps ] = Integrator( InSamps, Ts )

    IntegrNum = 1;                                          % Numerator taps of integrator
    IntegrDen = [1 -1];                                     % Denominator taps of integrator (1st order IIR)
    OutSamps = filter(Ts*IntegrNum,IntegrDen,InSamps);
    
end

%%% --> Function for filtering the input signal by means of Gaussian taps and
%%%     adding/removing proper delay samples
function [ OutSamps ] = GaussFilter( InSamps, BT, span, sps )
    
    GaussTaps = gaussdesign(BT,span,sps);               % Retrieve Gaussian filter taps
    GaussDelay = span*sps/2;
    OutSamps = filter(GaussTaps,1,[InSamps zeros(1,GaussDelay)]);
    OutSamps = OutSamps(1+GaussDelay:end);
    
end
