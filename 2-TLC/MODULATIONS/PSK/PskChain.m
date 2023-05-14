
%%% Title: DIGITAL PHASE MODULATIONS (PSK, OPSK AND DPSK)
%%% Author: Filippo Valmori
%%% Date: 26/02/2019
%%% Reference: [1] https://en.wikipedia.org/wiki/Phase-shift_keying


close all; clearvars; clc


%% PARAMETERS AND CONSTANTS

Nbits = 2400;                                           % Number of bits to be simulated
Rb = 10e3;                                              % Bit rate [b/s]
Fc = 1e6;                                               % Carrier frequency [Hz]
M = 4;                                                  % Modulation order
EbN0 = 9;                                               % Energy-per-bit-to-noise-power-spectral-density ratio (Eb/N0) [dB]
osfBB = 8;                                              % BB oversampling factor (and also sps factor for RCC filter design)
osfRF = 12;                                             % RF oversampling factor
span = 8;                                               % Span for RRC filter representation [S]
beta = 0.5;                                             % Roll-off factor for RRC filter representation
PhOfs = 0;                                              % Phase delay between I and Q vias [see NOTES]

Rs = Rb/log2(M);                                        % Symbol rate [S/s]
ConstOfs = (1-M)*pi/M;                                  % Constellation phase offset [rad]
FsBB = osfBB*Rs;                                        % Baseband sample rate [Sa/s]
TsBB = 1/FsBB;                                          % Baseband sample period [s]

TextX = -0.03;                                          % Shift on X-axis for constellation plot text
TextY = 0.17;                                           % Shift on Y-axis for constellation plot text
WaveBBxlim = 5e-3;                                      % Limit on X-axis for BB and RF waveform plot [s]
SpectYlim1 = -130;                                      % Lower limit on Y-axis for BB spectrum plot [dBW]
SpectYlim2 = -20;                                       % Upper limit on Y-axis for BB spectrum plot [dBW]
SpectBBxlim = FsBB/2e3;                                 % Limit on X-axis for BB spectrum plot [kHz]
SpanRFxlim = 6*Rs;                                      % Span on X-axis for RF spectrum plot [Hz]
Blue = [.2 .2 1];                                       % Custom blue color
Green = [.2 .8 .2];                                     % Custom green color
Orange = [1 .8 .2];                                     % Custom orange color
Violet = [.8 0 .8];                                     % Custom violet color
Azure = [0 .8 .8];                                      % Custom azure color
Red = [1 .2 0];                                         % Custom red color
Brown = [.5 .2 0];                                      % Custom brown color
Grey = [.65 .65 .65];                                   % Custom grey color



%% 1. PROCESSING WITHOUT FILTERING (TX ONLY)

[TxSymbs,Nsymbs,Map] = GetSymbs(Nbits,M,ConstOfs);                              % Generation of random Tx symbols and mapping constellation
PskSgnBB = repelem(TxSymbs,osfBB);                                              % Complex baseband signal (after symbol-to-samples oversampling)
DelayBB = round(FsBB*PhOfs/(Rs*2*pi));                                          % Delay (in samples) between baseband I and Q waveforms
TimeBB = TsBB*(0:Nsymbs*osfBB-1-DelayBB);                                       % Time axis for baseband waveform
PskWaveI = real(PskSgnBB(1+DelayBB:end));                                       % Baseband in-phase waveform
PskWaveQ = imag(PskSgnBB(1:end-DelayBB));                                       % Baseband quadrature waveform
[PskFreqBB,PskSpectBB,~] = GetSpect(PskSgnBB,FsBB);                               % Baseband power spectrum
FsRF = FsBB*round(osfRF*Fc/FsBB);                                               % RF sample rate [Sa/s]
osfRF = FsRF/Rs;                                                                % RF oversampling factor
DelayRF = round(FsRF*PhOfs/(Rs*2*pi));                                          % Delay (in samples) of the bandpass waveform
TimeRF = 1/FsRF*(0:Nsymbs*osfRF-1-DelayRF);                                     % Time axis for bandpass waveform
PskSgnRF = repelem(TxSymbs,osfRF);                                              % Real bandpass signal
PskSgnRF = real(PskSgnRF(1+DelayRF:end)).*cos(2*pi*Fc*TimeRF)- ...              % Quadrature modulation
    imag(PskSgnRF(1+DelayRF:end)).*sin(2*pi*Fc*TimeRF);
[PskFreqRF,PskSpectRF,~] = GetSpect(PskSgnRF,FsRF);                               % Bandpass power spectrum



%% 2. PROCESSING WITH SRRC FILTERING (TX+RX AT BASEBAND)

TxPskRccSgnBB = upsample(TxSymbs,osfBB);                                        % Symbol-to-samples upsampling
TxPskRccSgnBB = RccFilter(TxPskRccSgnBB,beta,span,osfBB);                       % Root-raised-cosine filtering
TxPskRccWaveI = real(TxPskRccSgnBB(1+DelayBB:end));                             % Baseband in-phase waveform
TxPskRccWaveQ = imag(TxPskRccSgnBB(1:end-DelayBB));                             % Baseband quadrature waveform
TxPskRccSgnBB = TxPskRccWaveI+1i*TxPskRccWaveQ;                                 % Complex baseband signal
[TxPskRccFreqBB,TxPskRccSpectBB,~] = GetSpect(TxPskRccSgnBB,FsBB);              % Complex baseband spectrum
TxPskRccSgnRF = spline(TimeBB,TxPskRccWaveI,TimeRF).*cos(2*pi*Fc*TimeRF)- ...   % Real bandpass signal
    spline(TimeBB,TxPskRccWaveQ,TimeRF).*sin(2*pi*Fc*TimeRF);
[TxPskRccFreqRF,TxPskRccSpectRF,~] = GetSpect(TxPskRccSgnRF,FsRF);              % Complex bandpass spectrum
SNR = 10*log10(10^(EbN0/10)*log2(M)/osfBB);                                     % Signal-to-noise ratio (S/N) [dB]
ChanSgnBB = awgn(TxPskRccSgnBB,SNR,'measured');                                 % Noisy baseband signal after channel
RxPskRccSgnBB = RccFilter(ChanSgnBB,beta,span,osfBB);                           % Rx baseband signal after matched SRRC filtering
TimeSymb = 1/Rs*(0:Nsymbs-1);



%% 3. ALTERNATIVE PROCESSING WITH SRRC FILTERING AND UP/DOWN CONVERSION (TX+RX)

Ndummy = 1;                                                                     % Number of dummy zero-symbols to be appended at the beginning and end of Tx stream [S]
Nfir = 50;                                                                      % Number of FIR low-pass filter taps for down-conversion
Nsymbs3 = Nbits/log2(M)+2*Ndummy;                                               % Number of symbols to be simulated
TxBits = randi([0 1],1,Nbits);                                                  % Random source bits generation
PskTable = GetPskTable(M,ConstOfs);                                             % Retrieve PSK constellation table
[TxSymbs3,TimeRs] = Mapper(TxBits,PskTable,Ndummy,Rs);                          % Bit-to-symbol mapping
[TxSgnBB,TimeBB3] = PulseShaper(TxSymbs3,Nsymbs3,beta,span,osfBB,PhOfs,Rs);     % SRRC pulse shaping to get the Tx baseband waveform (C)
[TxFreqBB,TxSpectBB,~] = GetSpect(TxSgnBB,FsBB);                                % FFT for evaluating the Tx baseband power spectrum
[TxSgnRF3,TimeRF3] = UpConverter(TxSgnBB,TimeBB3,Nsymbs3,osfRF,PhOfs,Rs,Fc);    % Up-conversion to get the Tx bandpass waveform (R)
[TxFreqRF,TxSpectRF,~] = GetSpect(TxSgnRF3,FsRF);                               % FFT for evaluating the Tx bandpass power spectrum
SNR = 10*log10(10^(EbN0/10)*log2(M)/osfRF);                                     % Signal-to-noise ratio (S/N) [dB]
RxSgnRF = awgn(TxSgnRF3,SNR,'measured');                                        % AWGN channel simulation
RxSgnDownBB = DownConverter(RxSgnRF,Fc,FsRF,FsBB,Nfir);                         % Down-conversion to to get the Rx baseband waveform (C)
RxSgnBB = RccFilter(RxSgnDownBB,beta,span,osfBB);                               % SRRC matched filtering
RxSymbs = downsample(RxSgnBB,osfBB);                                            % Down-sampling from samples to symbols
RxBits = Demapper(RxSymbs(1+Ndummy:end-Ndummy),PskTable);                       % PSK hard demapping
Nerr = sum(TxBits~=RxBits);                                                     % Check the number of corrupted bits
[RxFreqRF,RxSpectRF,~] = GetSpect(RxSgnRF,FsRF);                                % FFT for evaluating the Rx baseband power spectrum
[RxFreqBB,RxSpectBB,~] = GetSpect(RxSgnBB,FsBB);                                % FFT for evaluating the Rx baseband power spectrum

fprintf(" * III. Number of errors = %d out of %d bits\n",Nerr,Nbits);



%% PLOTS

figure('Name','1 - TX WITHOUT FILTERING','NumberTitle','off')
subplot(2,2,1); box on
plot(real(Map.Const),imag(Map.Const),'.','MarkerSize',30,'Color',Green)
xlabel('In-phase'); ylabel('Quadrature'); grid on
axis(1.5*[-1 1 -1 1])
title('CONSTELLATION');
text(real(Map.Const(1:M))+TextX,imag(Map.Const(1:M))+TextY,num2str(de2bi(Map.Gray(1:M),log2(M),'left-msb')))
subplot(2,2,2); hold on; box on
plot(TimeRF*1e3,PskSgnRF,'.--','Color',Orange)
plot(TimeBB*1e3,PskWaveI,'.-','Color',Blue)
plot(TimeBB*1e3,PskWaveQ,'.-.','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 1.301*[-1 1]]); hold off
title('WAVEFORMS'); legend(' Bandpass',' Baseband (I)',' Baseband (Q)')
subplot(2,2,3); box on
plot(PskFreqBB/1e3,PskSpectBB,'-','Color',Violet)
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectBBxlim*[-1 1] SpectYlim1+20 SpectYlim2+10])
title('BASEBAND SPECTRUM'); grid on
subplot(2,2,4); box on
plot(PskFreqRF/1e6,PskSpectRF,'-','Color',Azure)
xlabel('Frequency [MHz]'); ylabel('Power [dBW]')
axis([1e-6*[Fc-SpanRFxlim Fc+SpanRFxlim] SpectYlim1+20 SpectYlim2+10])
title('BANDPASS SPECTRUM'); grid on

figure('Name','2a - TX WITH SRRC FILTERING','NumberTitle','off')
subplot(2,2,1); box on
plot(real(Map.Const),imag(Map.Const),'.','MarkerSize',30,'Color',Green)
xlabel('In-phase'); ylabel('Quadrature'); grid on
axis(1.5*[-1 1 -1 1])
title('CONSTELLATION');
text(real(Map.Const(1:M))+TextX,imag(Map.Const(1:M))+TextY,num2str(de2bi(Map.Gray(1:M),log2(M),'left-msb')))
subplot(2,2,2); hold on; box on
plot(TimeRF*1e3,TxPskRccSgnRF,'.--','Color',Orange)
plot(TimeBB*1e3,TxPskRccWaveI,'.-','Color',Blue)
plot(TimeBB*1e3,TxPskRccWaveQ,'.-.','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 .601*[-1 1]]); hold off
title('WAVEFORMS'); legend(' Bandpass',' Baseband (I)',' Baseband (Q)')
subplot(2,2,3); box on
plot(TxPskRccFreqBB/1e3,TxPskRccSpectBB,'-','Color',Violet)
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectBBxlim*[-1 1] SpectYlim1 SpectYlim2])
title('BASEBAND SPECTRUM'); grid on
subplot(2,2,4); box on
plot(TxPskRccFreqRF/1e6,TxPskRccSpectRF,'-','Color',Azure)
xlabel('Frequency [MHz]'); ylabel('Power [dBW]')
axis([1e-6*[Fc-SpanRFxlim Fc+SpanRFxlim] SpectYlim1 SpectYlim2])
title('BANDPASS SPECTRUM'); grid on

figure('Name','2b - RX WITH SRRC MATCHED FILTERING','NumberTitle','off');
box on; hold on;
plot(TimeBB*1e3,real(RxPskRccSgnBB),'-','Color',Blue)
plot(TimeBB*1e3,imag(RxPskRccSgnBB),'.-.','Color',Red)
stem(TimeSymb*1e3,real(TxSymbs),'o:','Color',Blue)
stem(TimeSymb*1e3,imag(TxSymbs),'*:','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveBBxlim*1e3 1.5*[-1 1]]); hold off
title('BASEBAND WAVEFORMS'); legend(' Rx waveform (I)',' Rx waveform (Q)',' Tx symbols (I)',' Tx symbols (Q)')

figure('Name','3. RX SIGNALS','NumberTitle','off')
subplot(2,2,1); hold on; box on
plot(TimeRF3*1e3,RxSgnRF,'.--','Color',GetColor('Orange'))
plot(TimeBB3*1e3,real(RxSgnDownBB),'.-','Color',GetColor('Brown'))
plot(TimeBB3*1e3,imag(RxSgnDownBB),'.-.','Color',GetColor('Green'))
legend(' Bandpass',' Baseband (I)',' Baseband (Q)')
xlabel('Time [ms]'); ylabel('Voltage [V]'); grid on
axis([0 WaveBBxlim*1e3 [-1 1]])
title('WAVEFORMS AFTER DOWN-CONVERSION'); hold off
subplot(2,2,2); hold on; box on
plot(TimeBB3*1e3,real(RxSgnBB),'b.-')
plot(TimeBB3*1e3,imag(RxSgnBB),'r.-.')
stem(TimeRs*1e3,real(TxSymbs3),'b*:')
stem(TimeRs*1e3,imag(TxSymbs3),'r*:')
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
legend(' Rx Baseband Wave (I)',' Rx Baseband Wave (Q)',' Tx Symbols (I)',' Tx Symbols (Q)')
axis([0 WaveBBxlim*1e3 1.5*[-1 1]]); hold off
title('SAMPLING AFTER MATCHED FILTER');
subplot(2,2,3); box on
plot(RxFreqRF/1e6,RxSpectRF,'-','Color',GetColor('Azure'))
xlabel('Frequency [MHz]'); ylabel('Power [dBW]')
axis([1e-6*[Fc-SpanRFxlim Fc+SpanRFxlim] SpectYlim1 SpectYlim2])
title('BANDPASS SPECTRUM'); grid on
subplot(2,2,4); box on
plot(RxFreqBB/1e3,RxSpectBB,'-','Color',GetColor('Violet'))
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')
axis([SpectBBxlim*[-1 1] SpectYlim1 SpectYlim2+10])
title('BASEBAND SPECTRUM'); grid on



%% FUNCTIONS

%%% Function for generating random bits and mapping them into phase symbols as
%%% a function of the selected modulation order and according to Gray coding
function [ OutSymbs, Nsymb, Mapping ] = GetSymbs( Nbits, M, PhOfs )
    L = log2(M);                                                                % Number of bits per symbol
    GrayMtx = zeros(M,L);                                                       % Gray binary mapping matrix
    LastCell = [0;1];
    GrayMtx(1:2,end) = LastCell;
    for i = 2:L
        GrayMtx(1+2^(i-1):2^i,end-i+2:end) = flipud(LastCell);
        GrayMtx (1+2^(i-1):2^i,end-i+1) = 1;
        LastCell = GrayMtx(1:2^i,end-i+1:end);
    end
    GrayMtx = bi2de(GrayMtx,'left-msb');                                        % Gray decimal mapping matrix
    GrayMap = zeros(1,M);                                                       % Map between bits and constellation points
    for j = 0:M-1
        GrayMap(j+1) = find(GrayMtx==j);
    end
%     rng(76)                                                                   % Uncomment to force seed for random generation
    TxBits = randi([0 1],1,Nbits);                                              % Bits random generation
    Nsymb = Nbits/L;                                                            % Number of output symbols
    AngStep = 2*pi/M;                                                           % Angle distance between two consecutive points in constellation
    OutSymbs = zeros(1,Nsymb);
    Angles = PhOfs+AngStep*(0:M-1);
    Const = cos(Angles)+1i*sin(Angles);                                         % Complex PSK constellation     
    Mapping = struct('Const',Const,'Gray',GrayMtx);
    for i = 1:Nsymb
        OutSymbs(i) = Const(GrayMap(bi2de(TxBits(1+(i-1)*L:i*L),'left-msb')+1));        % Bits-to-symbol mapping
    end
%     Npad = 3;                                                                 % Block for padding N zero-symbols at the beginning and end of stream
%     OutSymbs = [zeros(1,Npad) OutSymbs zeros(1,Npad)];
%     Nsymb = length(OutSymbs);
end

% Function for getting the power spectrum of the input waveform
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

% Function for filtering the input signal by means of SRRC taps and
% adding/removing proper delay samples
function [ OutSamps ] = RccFilter( InSamps, beta, span, sps )
    RccTaps = rcosdesign(beta,span,sps,'sqrt');                                 % Retrieve SRCC filter taps
    RccDelay = span*sps/2;
    OutSamps = filter(RccTaps,1,[InSamps zeros(1,RccDelay)]);
    OutSamps = OutSamps(1+RccDelay:end);
end

% Function for retrieving the PSK bits-to-constellation-symbols
%  mapping according to Gray encoding
function Table = GetPskTable( M, Ofst )
    
    GrayMtx = GetGray(M);
    Table = struct('Bits',zeros(1,M),'Symbs',zeros(1,M));
    for j = 1:M
        Table.Bits(j) = bi2de(GrayMtx(j,:),'left-msb');
        Table.Symbs(j) = exp(1i*(Ofst+2*pi*(j-1)/M));    
    end

end

% Function for getting an M-sequence of Gray coded decimal numbers
function [ GrayMtx ] = GetGray( M )
    L = log2(M);                                                                % Number of bits per symbol
    GrayMtx = zeros(M,L);                                                       % Gray mapping matrix
    LastCell = [0;1];
    GrayMtx(1:2,end) = LastCell;
    for i = 2:L
        GrayMtx(1+2^(i-1):2^i,end-i+2:end) = flipud(LastCell);
        GrayMtx (1+2^(i-1):2^i,end-i+1) = 1;
        LastCell = GrayMtx(1:2^i,end-i+1:end);
    end
end

% Function for mapping an input bit stream into the constellation
% symbols specified by Table
function [ OutSymbs, Time ] = Mapper( InBits, Table, Ndummy, Rs )
    M = length(Table.Symbs);
    L = log2(M);                                                                % Number of bits per symbol
    InLen = length(InBits);
    OutLen = InLen/L;
    OutSymbs = zeros(1,OutLen);
    for j = 1:OutLen
        CurBits = bi2de(InBits(1+(j-1)*L:j*L),'left-msb');
        for i = 1:M
            if Table.Bits(i) == CurBits
                OutSymbs(j) = Table.Symbs(i);
                break;
            end
        end
    end
    OutSymbs = [zeros(1,Ndummy) OutSymbs zeros(1,Ndummy)];
    Time = 1/Rs*(0:length(OutSymbs)-1);
end

% Function for hard demapping the input symbols into bits according to Table
function [ OutBits ] = Demapper( InSymbs, Table )
    M = length(Table.Symbs);
    L = log2(M);                                                                % Number of bits per symbol
    InLen = length(InSymbs);
    OutBits = zeros(1,InLen*L);                                                 % Output bits (in antipodal form in case of soft-decoding)
    for k = 1:InLen
        Dist = abs(real(InSymbs(k))-real(Table.Symbs))+ ...
            abs(imag(InSymbs(k))-imag(Table.Symbs));
        [~,MinIdx] = min(Dist);
        OutBits(1+(k-1)*L:k*L) = de2bi(Table.Bits(MinIdx),L,'left-msb');
    end
end

% Function for pulse shaping the input complex symbol into a baseband
% waveform (upsampling + filtering + I/Q phase offset)
function [ TxSgnBB, TimeBB ] = PulseShaper( TxSymbs, Nsymbs, beta, span, osfBB, PhOfs, Rs)
    FsBB = Rs*osfBB;
    DelayBB = round(FsBB*PhOfs/(Rs*2*pi));                                      % Delay (in samples) between baseband I and Q waveforms
    TimeBB = 1/FsBB*(0:Nsymbs*osfBB-1-DelayBB);                                 % Time axis for baseband waveform
    TxSgnBB = upsample(TxSymbs,osfBB);                                          % Symbol-to-samples upsampling 
    TxSgnBB = RccFilter(TxSgnBB,beta,span,osfBB);                               % Root-raised-cosine filtering
    TxWaveI = real(TxSgnBB(1+DelayBB:end));                                     % Baseband in-phase waveform
    TxWaveQ = imag(TxSgnBB(1:end-DelayBB));                                     % Baseband quadrature waveform
    TxSgnBB = TxWaveI+1i*TxWaveQ;                                               % Complex baseband signal
end

% Function for up-converting the baseband waveform into the corresponding
% bandpass signal at carrier frequency Fc
function [ TxSgnRF, TimeRF ] = UpConverter( TxSgnBB, TimeBB, Nsymbs, osfRF, PhOfs, Rs, Fc )

    FsRF = Rs*osfRF;
    DelayRF = round(FsRF*PhOfs/(Rs*2*pi));                                      % Delay (in samples) of the bandpass waveform
    TxWaveI = real(TxSgnBB);
    TxWaveQ = imag(TxSgnBB);
    TimeRF = 1/FsRF*(0:Nsymbs*osfRF-1-DelayRF);                                 % Time axis for bandpass waveform
    TxSgnRF = spline(TimeBB,TxWaveI,TimeRF).*cos(2*pi*Fc*TimeRF)- ...           % Real bandpass signal
        spline(TimeBB,TxWaveQ,TimeRF).*sin(2*pi*Fc*TimeRF);
    
end

% Function for I/Q down-converting the bandpass waveform into the corresponding
% baseband signal (LPF + resampling)
function [ SgnBB ] = DownConverter( SgnRF, Fc, FsRF, FsBB, Ntaps )
    FirDelay = Ntaps/2;
    FirTaps = fir1(Ntaps,1/FsBB,'low');
    TimeRF = 1/FsRF*(0:length(SgnRF)-1);
    WaveI = 2*SgnRF.*cos(2*pi*Fc*TimeRF);
    WaveQ = -2*SgnRF.*sin(2*pi*Fc*TimeRF);
    SgnBB = filter(FirTaps,1,[WaveI+1i*WaveQ zeros(1,FirDelay)]);
    TimeBB = 0:1/FsBB:TimeRF(end);
    SgnBB = spline(TimeRF,SgnBB(1+FirDelay:end),TimeBB);
end

% Function for getting the RGB code of the input color
function [ RGB ] = GetColor( Color )
    switch Color
        case 'Blue'
            RGB = [.2 .2 1];                                                    % Custom blue color
        case 'Green'
            RGB = [.2 .8 .2];                                                   % Custom green color
        case 'Orange'
            RGB = [1 .8 .2];                                                    % Custom orange color
        case 'Violet'
            RGB = [.8 0 .8];                                                    % Custom violet color
        case 'Azure'
            RGB = [0 .8 .8];                                                    % Custom azure color
        case 'Red'
            RGB = [1 .2 0];                                                     % Custom red color
        case 'Brown'
            RGB = [.5 .2 0];                                                    % Custom brown color
        case 'Grey'
            RGB = [.65 .65 .65];                                                % Custom grey color
    end
end


%% NOTES

% NB#1: PhOfs represents the phase delay between I and Q vias. Thus, in particular, PhOfs = 0 or pi,
%     implies standard PSK (Phase Sfift Keying) or OPSK modulation respectively)
%     
% @todo#1: Implement DPSK modulation!
% @todo#2: Implement demodulation + demapper + theoretical vs experimental BER comparison at BB (con SRRC o no??)
% @todo#3: mantieni RF demodulation
    
