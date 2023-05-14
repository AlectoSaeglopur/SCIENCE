
close all; clearvars; clc


%% MAIN PARAMETERS

global Nsymbs Rs Fc dev M                   % Global variables definition
global Fs_RF Fs_BB ResFctRF

Nsymbs = 200;                              % Target number of bits to be simulated
Rb = 10e3;                                 % [b/s] Target data rate
A = 1;                                      % [V] Carrier waveform amplitude
Fc = 10e6;                                 % [Hz] Carrier frequency
dev = 50e3;                                 % [Hz] Inner frequency deviation
M = 8;                                      % Modulation order
osf = 8;                                    % Oversampling factor at RF/BB (e.g. "8" means about four times the minumum Nyquist rate)
SNR = 100;                                   % [dB] Signal-to-noise ratio over channel

BT = 0.3;                                   % Gaussian filter BT product (used only for GFSK modulation)
span = 8;                                   % Gaussian filter window span (in samples)
sps = 8;                                    % Number of samples per symbol for Gaussian filter upsampling


%% CHECKS AND SECONDARY PARAMETERS

ResFctRF = osf*round(Fc*log2(M)/Rb);        % Upsampling factor at RF
Rs = Fc*osf/ResFctRF;                       % [S/s] Actual symbol rate (since at RF the ratio between Fc and Rs must be an integer!)
Ts = 1/Rs;                                  % [s] Symbol time
Rb = Rs*log2(M);                            % [b/s] Actual bit rate
Fs_RF = Rs*ResFctRF                        % [Sa/s] Sample rate at RF in Tx and Rx
Ts_RF = 1/Fs_RF;                            % [s] Sample period
h = 2*dev/Rs;                               % Modulation index

IntNum = 1;                                 % Numerator taps of integrator (used only for CPFSK and GFSK modulations)
IntDen = [1 -1];                            % Denominator taps of integrator (1st order IIR)
Nfir = 20;                                  % Order of the FIR low-pass filter used for Rx downconvertion

GaussTaps = gaussdesign(BT,span,sps);       % Gaussian filter taps
GaussDelay = span*sps;                      % Gaussian filter delay (in samples)
ResFctBB = 1*sps;                          % Upsample factor at BB (used only for CPFSK and GFSK)
Fs_BB = Rs*ResFctBB                        % [Sa/s] Sample rate at BB in Tx

CheckParam(h);                              % Check validity of main paramenters and variables

ScFctRF = 1e6;                              % Scale factor for x-axis of RF plots (e.g. "1e6" means "us" and "MHz")
ScFctBB = 1e3;                              % Scale factor for x-axis of BB plots (e.g. "1e3" means "ms" and "kHz")
BitWinInit = 5;                             % Number of bit periods for time plot window beginning
BitWinFin = 9;                              % Number of bit periods for time plot window end
FreqInitLim = 0;                            % [Hz] Frequency axis initial limit for spectra plots
FreqFinLim = 2*Fc/ScFctRF;                  % [Hz] Frequency axis final limit for spectra plots
MinPwrFskRF = 1e-15;                        % [W] Minimum power level for FSK frequency plot at RF
MinPwrFskBB = 1e-9;                         % [W] Minimum power level for FSK frequency plot at BB
MinPwrCpfskRF = 1e-20;                      % [W] Minimum power level for CPFSK frequency plot at RF
MinPwrCpfskBB = 1e-10;                      % [W] Minimum power level for CPFSK frequency plot at BB
MinPwrGfskRF = 1e-33;                       % [W] Minimum power level for GFSK frequency plot at RF
MinPwrGfskBB = 1e-15;                       % [W] Minimum power level for GFSK frequency plot at BB
DarkGreen = [.0 .4 .4];                     % RGB custom green color for plots
LightGrey = [.5 .5 .5];                     % RGB custom grey color for plots


%% FSK MODULATION

[InBits,InSymbs,GrayMtx] = BitSymbGen('Random');                % Generation of Tx bit stream, corresponding symbol stream and Gray matrix
Time1 = Ts_RF*(0:ResFctRF*length(InSymbs)-1);                   % Time axis for FSK and CPFSK sample streams after RF upsampling
FskSamp = repelem(InSymbs,ResFctRF);                            % FSK samples representing the instantaneous frequency shift in time
FskWaveRF = A*sin(2*pi*(Fc+FskSamp).*Time1);                    % FSK modulated waveform at RF
FskWaveBB = A*sin(2*pi*FskSamp.*Time1);                         % FSK modulated waveform at BB
[FskFreqRF,FskPwrSpetrRF] = GetSpectrum(FskWaveRF);             % FSK power spectrum at RF
[FskFreqBB,FskPwrSpetrBB] = GetSpectrum(FskWaveBB);             % FSK power spectrum at BB

% figure('Name','1 - FSK','NumberTitle','off');
% subplot(2,2,1)
% stem(ScFctRF*Time1,FskSamp/1e3,'r.-'); xlabel('Time [us]'); ylabel('Shift [MHz]'); grid on
% axis([-Ts max(ScFctRF*Time1)+Ts 1.15*(M-1)*dev*[-1 1]/1e3]); title('Symbol stream')
% subplot(2,2,2); hold on
% plot(ScFctRF*Time1,FskWaveRF,'g-','LineStyle','-.')
% plot(ScFctRF*Time1,FskWaveBB,'Color',DarkGreen,'LineWidth',1)
% xlabel('Time [us]'); ylabel('Amplitude [V]'); hold off
% axis([BitWinInit*Ts*ScFctRF BitWinFin*Ts*ScFctRF -1.1*A 1.1*A])
% for j = 1:length(InSymbs)-1
%     line([j*Ts*ScFctRF j*Ts*ScFctRF],[-1.1*A 1.1*A],'LineStyle','--','Color',LightGrey)
% end
% title('Waveforms'); leg = legend(' RF',' BB'); leg.FontSize = 8;
% subplot(2,2,3)
% semilogy(FskFreqRF/ScFctRF,FskPwrSpetrRF,'b')
% xlabel('Frequency [MHz]'); ylabel('Power [W]')
% title('RF Spectrum'); axis([FreqInitLim FreqFinLim MinPwrFskRF 1]); grid on
% subplot(2,2,4)
% semilogy(FskFreqBB/ScFctBB,FskPwrSpetrBB,'c')
% xlabel('Frequency [kHz]'); ylabel('Power [W]'); grid on
% title('BB Spectrum'); axis([5*dev*(M-1)/ScFctBB*[-1 1] MinPwrFskBB 1]);


%% CPFSK MODULATION

Time2 = 1/Fs_BB*(0:ResFctBB*Nsymbs+GaussDelay-1);               % Time axis for GFSK sample stream after BB upsampling and Gaussian filtering
CpfskSamp = 2*pi*filter(Ts_RF*IntNum,IntDen,FskSamp);           % CPFSK samples after integrator representing the instantaneous phase shift in time
CpfskWaveRF = A*sin(2*pi*Fc*Time1+CpfskSamp);                   % CPFSK modulated waveform at RF
CpfskWaveBB = A*sin(CpfskSamp);                                 % CPFSK modulated waveform at BB
[CpfskFreqRF,CpfskPwrSpetrRF] = GetSpectrum(CpfskWaveRF);       % CPFSK power spectrum at RF
[CpfskFreqBB,CpfskPwrSpetrBB] = GetSpectrum(CpfskWaveBB);       % CPFSK power spectrum at BB

% figure('Name','2 - CPFSK','NumberTitle','off');
% subplot(2,2,1)
% stem(ScFctRF*Time1,CpfskSamp,'r.-'); xlabel('Time [us]'); ylabel('Shift [rad]'); grid on
% axis([-Ts max(ScFctRF*Time1)+Ts 1.15*[min(CpfskSamp) max(CpfskSamp)]]); title('Symbol stream')
% subplot(2,2,2); hold on
% plot(ScFctRF*Time1,CpfskWaveRF,'g-','LineStyle','-.')
% plot(ScFctRF*Time1,CpfskWaveBB,'Color',DarkGreen,'LineWidth',1)
% xlabel('Time [us]'); ylabel('Amplitude [V]'); hold off
% axis([BitWinInit*Ts*ScFctRF BitWinFin*Ts*ScFctRF -1.1*A 1.1*A])
% for j = 1:Nsymbs-1
%     line([j*Ts*ScFctRF j*Ts*ScFctRF],[-1.1*A 1.1*A],'LineStyle','--','Color',LightGrey)
% end
% title('Waveforms'); leg = legend(' RF',' BB'); leg.FontSize = 8;
% subplot(2,2,3)
% semilogy(CpfskFreqRF/ScFctRF,CpfskPwrSpetrRF,'b')
% xlabel('Frequency [MHz]'); ylabel('Power [W]')
% title('RF Spectrum'); axis([FreqInitLim FreqFinLim MinPwrCpfskRF 1]); grid on
% subplot(2,2,4)
% semilogy(CpfskFreqBB/ScFctBB,CpfskPwrSpetrBB,'c')
% xlabel('Frequency [kHz]'); ylabel('Power [W]'); grid on
% title('BB Spectrum'); axis([5*dev*(M-1)/ScFctBB*[-1 1] MinPwrCpfskBB 1]);


%% GFSK MODULATION

Time3 = Ts_RF*(0:ResFctRF*Nsymbs+ResFctRF/ ...                  % Time axis for GFSK sample stream after RF upsampling
    ResFctBB*GaussDelay-1);
InSampBB = repelem(InSymbs,ResFctBB);                           % Input symbols after BB upsampling
GfskSamp = filter(GaussTaps,1,[InSampBB ...                     % GFSK symbols after Gaussian filter (i.e. instantaneous frequency shifts in time)
    zeros(1,GaussDelay)]);
GfskSamp = spline(Time2,GfskSamp,Time3);                        % GFSK symbols after RF upresampling
GfskSymbPh = 2*pi*filter(Ts_RF*IntNum,IntDen,GfskSamp);         % GFSK symbols after integrator representing the instantaneous phase shift in time
GfskWaveRF = A*sin(2*pi*Fc*Time3+GfskSymbPh);                   % GFSK modulated waveform at RF
GfskWaveBB = A*sin(GfskSymbPh);                                 % GFSK modulated waveform at BB
[GfskFreqRF,GfskPwrSpetrRF] = GetSpectrum(GfskWaveRF);          % GFSK power spectrum at RF
[GfskFreqBB,GfskPwrSpetrBB] = GetSpectrum(GfskWaveBB);          % GFSK power spectrum at BB

% figure('Name','3 - GFSK','NumberTitle','off');
% subplot(2,2,1)
% stem(ScFctRF*Time3,GfskSymbPh,'r.-'); grid on; title('Symbol stream')
% axis([-Ts max(ScFctRF*Time3)+Ts 1.15*[min(GfskSymbPh) max(GfskSymbPh)]]); xlabel('Time [us]'); ylabel('Shift [rad]')
% subplot(2,2,2); hold on
% plot(ScFctRF*Time3,GfskWaveRF,'g-','LineStyle','-.')
% plot(ScFctRF*Time3,GfskWaveBB,'Color',DarkGreen,'LineWidth',1)
% xlabel('Time [us]'); ylabel('Amplitude [V]'); hold off
% axis([BitWinInit*Ts*ScFctRF BitWinFin*Ts*ScFctRF -1.1*A 1.1*A])
% for j = 1:Nsymbs-1
% line(Ts_RF*ScFctRF*ResFctRF/ResFctBB*GaussDelay/2+[j*Ts*ScFctRF j*Ts*ScFctRF],[-1.1*A 1.1*A],'LineStyle','--','Color',LightGrey)
% end
% title('Waveforms'); leg = legend(' RF',' BB'); leg.FontSize = 8;
% subplot(2,2,3)
% semilogy(GfskFreqRF/ScFctRF,GfskPwrSpetrRF,'b')
% xlabel('Frequency [MHz]'); ylabel('Power [W]')
% title('RF Spectrum'); axis([FreqInitLim FreqFinLim MinPwrGfskRF 1]); grid on
% subplot(2,2,4)
% semilogy(GfskFreqBB/ScFctBB,GfskPwrSpetrBB,'c')
% xlabel('Frequency [kHz]'); ylabel('Power [W]'); grid on
% title('BB Spectrum'); axis([5*dev*(M-1)/ScFctBB*[-1 1] MinPwrGfskBB 1]);



%% RF/BB DEMODULATION AND RESULTS

Fs_BB = Rs*osf;                                                 % [Sa/s] Sample rate at BB in Rx (updating the Tx variable already existing)

fprintf("\n - Modulation Index = %1.2f\n",h);
fprintf(" - SNR over channel = %1.2f dB\n",SNR);

fprintf('\n RF DEMODULATION\n');
ChanSamps = awgn(FskWaveRF,SNR,'measured');
OutBits = FreqDemodRF(ChanSamps,GrayMtx,'Non-Coherent');
fprintf(' 1) FSK : Nerr = %d out of %d\n',sum(InBits~=OutBits),Nsymbs*log2(M))

ChanSamps = awgn(CpfskWaveRF,SNR,'measured');
OutBits = FreqDemodRF(ChanSamps,GrayMtx,'Non-Coherent');
fprintf(' 2) CPFSK : Nerr = %d out of %d\n',sum(InBits~=OutBits),Nsymbs*log2(M))

ChanSamps = awgn(GfskWaveRF(1+ResFctRF/ResFctBB*GaussDelay:end),SNR,'measured');
OutBits = FreqDemodRF(ChanSamps,GrayMtx,'Non-Coherent');
fprintf(' 3) GFSK : Nerr = %d out of %d\n',sum(InBits~=OutBits),Nsymbs*log2(M))


fprintf(' ______________________\n\n BB DEMODULATION\n');
ChanSamps = awgn(FskWaveRF,SNR,'measured');
RxSymbBB = DownConvertion(ChanSamps,Nfir);
OutBits = FreqDemodBB(RxSymbBB,GrayMtx,'Non-Coherent');
fprintf(' 1) FSK : Nerr = %d out of %d\n',sum(InBits~=OutBits),Nsymbs*log2(M))

% ChanSamps = awgn(CpfskWaveRF,SNR,'measured');
% RxSymbBB = DownConvertion(ChanSamps,Nfir);
% OutBits = FreqDemodBB(RxSymbBB,GrayMtx,'Non-Coherent');
% fprintf(' 2) CPFSK : Nerr = %d out of %d\n',sum(InBits~=OutBits),Nsymbs*log2(M))
% 
% ChanSamps = awgn(GfskWaveRF(1+ResFctRF/ResFctBB*GaussDelay:end),SNR,'measured');
% RxSymbBB = DownConvertion(ChanSamps,Nfir);
% OutBits = FreqDemodBB(RxSymbBB,GrayMtx,'Non-Coherent');
% fprintf(' 3) GFSK : Nerr = %d out of %d\n\n',sum(InBits~=OutBits),Nsymbs*log2(M))


%% EXTRA FUNCTIONS

%%% --> Function to check the validity of initial parameters and variables.
function [ ] = CheckParam( ModIdx )

    global M
    
    if M < 2 || log2(M) ~= round(log2(M))
        error('Modulation order must be a power of 2 and greater than 1!')
    end

    if 2*ModIdx ~= round(2*ModIdx)
        warning('Tone spacing does not provide orthogonality for either coherent or non-coherent detection!');
    elseif ModIdx ~= round(ModIdx)
        warning('Tone spacing does not provide orthogonality for non-coherent detection!');
    end  

end


%%% --> Function to generate Tx bit and symbol streams, plus the Gray mapping matrix.
function [ SrcBits, SrcSymbs, GrayMtx ] = BitSymbGen( InSeed )

    global Nsymbs M dev

    if strcmp(InSeed,'Fixed')
        rng(23)                                         % Set specific seed for random initialization  
    end
    
    L = log2(M);                                        % Number of bits per symbol
    GrayMtx = zeros(M,L);                               % Gray mapping matrix
    LastCell = [0;1];
    GrayMtx(1:2,end) = LastCell;
    for i = 2:L
        GrayMtx(1+2^(i-1):2^i,end-i+2:end) = flipud(LastCell);
        GrayMtx (1+2^(i-1):2^i,end-i+1) = 1;
        LastCell = GrayMtx(1:2^i,end-i+1:end);
    end

    SrcSymbs = 2*randi([1 M],1,Nsymbs)-M-1;            % Random generation of Tx symbol stream within the alphabet fixed by M
    SrcSymbs = PadExtraSymbs(SrcSymbs);                % Pad extra symbols to avoid discontinuities at the end of waveform

    SrcBits = zeros(1,L*length(SrcSymbs));             % Corresponding Tx bit stream
    for j = 1:length(SrcSymbs)
     SrcBits(1+(j-1)*L:j*L) = GrayMtx((SrcSymbs(j)+M+1)/2,:);
    end

    Nsymbs = length(SrcSymbs);                         % Update the actual number of simulated bits
    SrcSymbs = SrcSymbs*dev;                           % Multiply the integer symbols by the deviation value to get a value in Hz

end


%%% --> Function to pad final extra symbols to Tx symbol stream so that the last output of the
%%%     integrator is zero in order to avoid discontinuities for CPFSK and GFSK.
 function [ OutSymbs ] = PadExtraSymbs( InSymbs )
 
    OvSum = sum(InSymbs);                               % Bias of the input symbol stream
    if OvSum == 0
        OutSymbs = InSymbs;
    else
        ExtraSymbs = -sign(OvSum)*ones(1,abs(OvSum));   % Extra symbols to be padded (+1 if Bias < 0, -1 otherwise)
        OutSymbs = [InSymbs,ExtraSymbs];
    end
 
 end

%%% --> Function to estimate the power spectrum of an input signal.
function [ FreqAx, PwrSpectrum ] = GetSpectrum( InSgn )

    global Fs_RF;
    
    Ns = length(InSgn);                                 % Length (in samples) of the input waveform
    dF = Fs_RF/Ns;                                      % Discretization step for frequency axis
    FreqAx = -Fs_RF/2:dF:Fs_RF/2-dF;                    % Frequency axis for spectrum plot
    AmpSpect = abs(fftshift(fft(InSgn))/Ns);            % Amplitude spectrum
    PwrSpectrum = AmpSpect.^2;                          % Power spectrum

end


%%% --> Function to demodulate frequency modulated symbols at RF (using energy
%%%     detectors with correlators as matched filters and Gray demapping).
function [ OutBits ] = FreqDemodRF( InSamps, GrayMtx, Mode )

    global Nsymbs dev Fc M Fs_RF ResFctRF

    if strcmp(Mode,'Non-Coherent')

        Time = 1/Fs_RF*(0:length(InSamps)-1);           % Time axis for correlators
        FreqDev =  dev*(2*(1:M)-M-1);                   % Possible deviation values (in Hz)
        L = log2(M);                                    % Number of bits per symbol

        IntVias = zeros(M,Nsymbs);                      % Matrix of the integrators output on each via
        for j = 1:M
            CorVia = InSamps.*sin(2*pi*(Fc+FreqDev(j))*Time)+ ...    % Output of the j-th correlator
                1i*InSamps.*sin(2*pi*(Fc+FreqDev(j))*Time-pi/2);
            IntVias(j,:) = sum(reshape(CorVia,ResFctRF,Nsymbs));
        end
          
        EnVias = abs(IntVias);                          % Energy per bit detected for each deviation
        [~,IdxMax] = max(EnVias);                       % Choose the via (and so the symbol) with maximum energy during each symbol time
        
        OutBits = zeros(1,Nsymbs*L);                    % Symbol-to-bits demapping using the Gray matrix
        for j = 1:Nsymbs
            OutBits(1+(j-1)*L:j*L) = GrayMtx(IdxMax(j),:);
        end  
        
    else
        error('Invalid demodulation mode!')
    end

end


%%% --> Function to downconvert the incoming RF waveform/samples (I-Q mixing and low-pass
%%%     filtering) and downsample from RF to BB sample rate
function [ OutSamps ] = DownConvertion( InSamps, Nfir )

    global Fc Rs Fs_BB Fs_RF

    Offset = 0;                                         % Offset (in samples) of the final downsampling step
    FirDelay = Nfir/2;                                  % Delay (in samples) introduced by the FIR LPF
    Wn = 1/Fs_BB;                                       % LPF cut-off frequency
    FirTaps = fir1(Nfir,Wn,'low');                      % Taps of the FIR LPF

    Time = 1/Fs_RF*(0:length(InSamps)-1);               % Time axis for mixing
    SampRF_I = 2*InSamps.*sin(2*pi*Fc.*Time);           % In-phase mixing
    SampRF_Q = 2*InSamps.*sin(2*pi*Fc.*Time-pi/2);      % Quadrature mixing
    SampBB = filter(FirTaps,1,[SampRF_I+ ...            % Low-pass filtering
        1i*SampRF_Q zeros(1,FirDelay)]);
    SampBB = SampBB(1+FirDelay:end);                    % Cut of delay symbols (due to FIR filtering)
    OutSamps = downsample(SampBB,round(Fc/Rs),Offset);  % Downsampling at baseband Fs (to ease computational complexity)
    
end


%%% --> Function to demodulate frequency modulated symbols at BB (using energy
%%%     detectors with correlators as matched filters and Gray demapping).
function [ OutBits ] = FreqDemodBB( InSamps, GrayMtx, Mode )

    global Nsymbs M dev Fs_BB ResFctBB

    if strcmp(Mode,'Non-Coherent')
        
        L = log2(M);                                    % Number of bits per symbol
        FreqDev =  dev*(2*(1:M)-M-1);                   % Possible deviation values (in Hz) 
        Time = 1/Fs_BB*(0:length(InSamps)-1);           % Time axis for correlators
        IntVias = zeros(M,Nsymbs);                      % Matrix of the integrators output for all vias
  
        for j = 1:M
            CorSgn = exp(-1i*2*pi*FreqDev(j)*Time);
            CorVias = InSamps.*CorSgn;
            IntVias(j,:) = sum(reshape(CorVias,ResFctBB,Nsymbs));
            
            figure; hold on
            plot(Time,real(CorVias),'r.-')
            plot(Time,imag(CorVias),'b.--')
            title('PRE-FILTER')
            grid on; hold off
            
            FirTaps = fir1(20,1/10,'low');
            CorVias = filter(FirTaps,1,CorVias);
            
            figure; hold on
            plot(Time,real(CorVias),'r.-')
            plot(Time,imag(CorVias),'b.--')
            title('POST-FILTER')
            grid on; hold off
            
            % prova a mettere integratore lungo tutto t su entrambe le vie e vedi plot!
        end
        [~,IdxMax] = max(abs(IntVias));                 % Choose the via (and so the symbol) with maximum energy during each symbol time

        OutBits = zeros(1,Nsymbs*L);                    % Symbol-to-bits demapping using the Gray matrix
        for j = 1:Nsymbs
            OutBits(1+(j-1)*L:j*L) = GrayMtx(IdxMax(j),:);
        end
        
    else
        error('Invalid demodulation mode!')
    end

end



% NB: The demodulator algorithm (for both BB and RF cases) is able to recover by itself the TX symbols
% only because the channel introduces no phase shift / delay between TX and RX waveforms! Otherwise it
% shall be added a symbol synchronizer in order to understand where to sample symbols (and, of course,
% this cannot be done at RF since too demanding computationally).
