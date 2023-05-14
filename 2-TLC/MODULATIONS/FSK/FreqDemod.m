
%%% Title: DIGITAL FREQUENCY DEMODULATION
%%% Author: Filippo Valmori
%%% Date: 15/11/2020
%%% Chain:
%%%     - Gray mapping
%%%     - FSK modulation
%%%     - AWGN channel with delay
%%%     - Frequency demodulator
%%%     - Symbol synchronization
%%%     - Static demapping or Adaptive demapping
%%%     - Sync word detector


close all; clearvars; clc


%% PARAMETERS

Rb = 6e3;                                               % Bit rate [b/s]
M = 4;                                                  % Modulation order
dev = 3e3;                                              % Inner frequency deviation [Hz]
osf = 16;                                                % Baseband oversampling factor
EbN0 = 3;                                              % Energy-per-bit-to-noise-power-spectral-density ratio (Eb/N0) [dB]
ChDelay = 13;                                           % Channel delay [Sa]

Ninfo = 1200;                                           % Number of info bits [b]
Nprb = 192;                                             % Number of preamble bits [b]
SW = ['D3';'91';'B2'];                                  % Sync Word hexadecimal value
Ndum = 4;                                               % Number of random dummy symbols appended at the end of packet [S]
SwThrErr = 1;                                           % Number of errors accepted during Sync Word detection [b]

k = 2;                                                  % [VERS.1] Correlation delay between I/Q vias during frequency demodulation [Sa]
DmpMth = 'STC';                                         % [VERS.1] Demapping method ('STC' for static or 'ADP' for adaptive)
Nbins = 50;                                             % [VERS.1] Number of bins for adaptive demapping thresholds estimation [only ADP]
ClustSz = 1;                                            % [VERS.1] Size for adaptive clustering size (i.e. +/- span around each max bin) [only ADP]

LpfMth = 'FIR';                                         % [VERS.2] Low-pass filtering method ('FIR' for FIR filter or 'MWA' for moving window average)
Ntaps = 20;                                             % [VERS.2] Number of FIR filter taps (NB: it must be even) [only FIR]
CutFct = 1;                                             % [VERS.2] FIR filter extra cut-off factor (higher means narrower passband)
WinSz = osf;                                            % [VERS.2] Window size [Sa] [only MWA]

SsMet = 'ZCR';                                          % Symbol synchronizer (ZCR, M&M, ELT or GRD)
SsDF = 1;                                               % Symbol synchronizer damping factor (typ. 1)
SsNLB =  0.02;                                          % Symbol synchronizer normalized loop bandwidth (typ. 0.01)
SsDG = 2.7;                                             % Symbol synchronizer detector gain (typ. 2.7)
SsCutTry = false;                                       % [Not used]

Rs = Rb/log2(M);                                        % Symbol rate [S/s]
h = 2*(M-1)*dev/Rs;                                     % Modulation index
Fs = osf*Rs;                                            % Baseband sample rate [Sa/s]
Ts = 1/Fs;                                              % Baseband sample period [s]
SwLen = length(Hex2Bin(SW));                            % Sync word length [b]

AxScFct = 1e3;                                          % Time axis scale factor for plots (e.g. 1e3 means ms)
PlotCtr = 63+(Nprb/log2(M)*osf);                        % Center sample for time plots
PltSpan = 40;                                           % Span for time plots
Blue = [.2 .2 1];                                       % Custom blue color
Green = [.2 .8 .2];                                     % Custom green color
Orange = [1 .7 .2];                                     % Custom orange color
Violet = [.8 0 .8];                                     % Custom violet color
Azure = [0 .8 .8];                                      % Custom azure color
Red = [1 .2 0];                                         % Custom red color
Brown = [.5 .2 0];                                      % Custom brown color



%% PROCESSING: TX AND CHANNEL

fprintf("\n >>> PARAMETERS <<<\n\n");
fprintf(" * M = %d\n",M);
fprintf(" * Rb = %1.1f kb/s\n",Rb/1e3);
fprintf(" * Rs = %1.1f kS/s\n",Rs/1e3);
fprintf(" * dev = %1.1f kHz\n",dev/1e3);
fprintf(" * h = %1.2f\n\n",h);

CheckParam(Ninfo,Nprb,SwLen,M);
Map = GetMap(M);
[TxBits,TxSymbs,Nsymbs] = GetPkt(Map,Nprb,SW,Ninfo,Ndum);                   % Retrieve random symbols stream and its length
FskSamps = dev*repelem(TxSymbs,osf);                                        % Multiply symbols for inner deviation and oversample
Time = Ts*(0:Nsymbs*osf-1);                                                 % Time axis for BB waveform
FskWaveI = cos(2*pi*FskSamps.*Time);                                        % In-phase part of the FSK baseband waveform
FskWaveQ = sin(2*pi*FskSamps.*Time);                                        % Quadrature part of the FSK baseband waveform
FskSgnBB = FskWaveI+1i*FskWaveQ;                                            % FSK complex baseband signal

SNR = 10*log10(2*10^(EbN0/10)*log2(M)/osf);                                 % Signal-to-noise ratio (S/N) [dB]
ChanSamps = awgn([zeros(1,ChDelay) FskSgnBB],SNR,'measured');               % AWGN channel



%% PROCESSING: DEMOD AND RX [VERS.1]

tic
DemSamps_v1 = FreqDemod_v1(ChanSamps,k,osf,DmpMth,h);                       % Frequency quadrature demodulation
[SyncSymbs_v1,~] = SymbSynchr(DemSamps_v1,osf,SsMet,SsNLB, ...              % Symbol synchronization
    SsDF,SsDG,SsCutTry,true);

if strcmp(DmpMth,'ADP')
    [BinsVal,BinsEdges] = histcounts(SyncSymbs_v1,Nbins);                   % Divide symbols into bins
    CCF = true;                                                             % Check cluster flag
    while CCF
        [~,MaxIdx] = FindMaxN(BinsVal,M);
        [BinsVal,CCF] = AddCluster(BinsVal,MaxIdx,ClustSz);                 % Apply clustering and repeat if needed
    end
    DemThr = GetThresholds(BinsEdges(MaxIdx));                              % Estimate demapping thresholds
else
    DemThr = -2^log2(M)+2*(1:M-1);
end
RxBits_v1 = Demapper(SyncSymbs_v1,Map,DemThr);                              % Symbol-to-bit demapping
SwIdx = SyncWordDetector(RxBits_v1,SW,SwThrErr);                            % Sync word detection
Telap = toc;

fprintf(" >>> VERS.1 (%s) <<<\n\n",DmpMth);
if SwIdx < 0
    fprintf(" - Sync Word not detected\n");
    fprintf(" - Time elapsed = %1.3f s\n\n\n",Telap);
else
    fprintf(" - Sync Word detected at index # %d\n",SwIdx);
    Nerr = sum(TxBits(1+Nprb+SwLen:1+Nprb+SwLen+Ninfo)~= ...                % Compare Tx and Rx info bits to detect errors
        RxBits_v1(SwIdx:SwIdx+Ninfo));
    fprintf(" - Number of corrupted bits : %d out of %d\n",Nerr,Ninfo);
    fprintf(" - Time elapsed = %1.2f ms\n\n\n",Telap*1e3);
end



%% PROCESSING: DEMOD AND RX [VERS.2]

fprintf(" >>> VERS.2 (%s) <<<\n\n",LpfMth);
for PhIdx = 0:M-1
    tic
    DemSamps_v2 = FreqDemod_v2(ChanSamps,M,dev,Fs,LpfMth,WinSz, ...         % Frequency demodulation with correlators
        Ntaps,CutFct,PhIdx*osf/M);
    [SyncSymbs_v2,~] = SymbSynchr(DemSamps_v2,osf,SsMet,SsNLB, ...          % Symbol synchronization
        SsDF,SsDG,SsCutTry,true);
    DemThr = -2^log2(M)+2*(1:M-1);                                          % Retrieve demapper decision thresholds
    RxBits = Demapper(SyncSymbs_v2,Map,DemThr);                             % Symbol-to-bit demapping
    SwIdx = SyncWordDetector(RxBits,SW,SwThrErr);                           % Sync word detection
    Telap = toc;
    
    fprintf(" * %d-deg Shift\n%",PhIdx*360/M);                                 % Phase shift in degrees
    if SwIdx < 0
        fprintf("   - Sync Word not detected\n");
        fprintf("   - Time elapsed = %1.2f ms\n\n",Telap*1e3);
    else
        fprintf("   - Sync Word detected at index # %d\n",SwIdx);
        Nerr = sum(TxBits(1+Nprb+SwLen:1+Nprb+SwLen+Ninfo)~= ...            % Compare Tx and Rx info bits to detect errors
            RxBits(SwIdx:SwIdx+Ninfo));
        fprintf("   - Number of corrupted bits : %d out of %d\n",Nerr,Ninfo);
        fprintf("   - Time elapsed = %1.2f ms\n\n",Telap*1e3);
    end
end



%% PLOTS      

figure('Name','VERS.1','NumberTitle','off')
subplot(2,2,1); box on; hold on
Time = Ts*(0:length(ChanSamps)-1);
plot(Time*AxScFct,real(ChanSamps),'.--','Color',Blue)
plot(Time*AxScFct,imag(ChanSamps),'.-','Color',Red)
axis([Ts*AxScFct*[(PlotCtr-PltSpan) (PlotCtr+PltSpan)] -1.5 1.5])
legend('In-phase','Quadrature','Location','NW');
xlabel('Time [ms]'); ylabel('Amplitude [V]')
title('FSK SAMPLES')
grid on; hold off
subplot(2,2,2)
Time = Ts*(0:length(DemSamps_v1)-1);
plot(Time*AxScFct,DemSamps_v1,'.-','Color',Orange)
xlim(Ts*AxScFct*[(PlotCtr-3*PltSpan) (PlotCtr+3*PltSpan)])
xlabel('Time [ms]')
grid on
title('DEMOD SAMPLES')
subplot(2,2,3)
Time = 1/Rs*(0:length(SyncSymbs_v1)-1);
plot(Time*AxScFct,SyncSymbs_v1,'.','Color',Green)
xlabel('Time [ms]')
grid on
title('SYNC SYMBOLS')
subplot(2,2,4); box on; hold on
histogram(SyncSymbs_v1,Nbins,'FaceColor',Violet)
for j = 1:M-1
    line([DemThr(j) DemThr(j)],[5 45],'LineWidth',1,'Color',Brown,'LineStyle','-.')
end
xlabel('Symbol value')
legend('Occurrence','Threshold')
title('DEMAPPING')
grid on; hold off

figure('Name','VERS.2','NumberTitle','off')
subplot(2,2,1); box on; hold on
Time = Ts*(0:length(ChanSamps)-1);
plot(Time*AxScFct,real(ChanSamps),'.--','Color',Blue)
plot(Time*AxScFct,imag(ChanSamps),'.-','Color',Red)
axis([Ts*AxScFct*[(PlotCtr-PltSpan) (PlotCtr+PltSpan)] -1.5 1.5])
legend('In-phase','Quadrature','Location','NW');
xlabel('Time [ms]'); ylabel('Amplitude [V]')
title('FSK SAMPLES')
grid on; hold off
subplot(2,2,2)
Time = Ts*(0:length(DemSamps_v2)-1);
plot(Time*AxScFct,DemSamps_v2,'.-','Color',Orange)
xlim(Ts*AxScFct*[(PlotCtr-3*PltSpan) (PlotCtr+3*PltSpan)])
xlabel('Time [ms]')
grid on
title('DEMOD SAMPLES')
subplot(2,2,3)
Time = 1/Rs*(0:length(SyncSymbs_v2)-1);
plot(Time*AxScFct,SyncSymbs_v2,'.','Color',Green)
xlabel('Time [ms]')
grid on
title('SYNC SYMBOLS')
subplot(2,2,4); box on; hold on
histogram(SyncSymbs_v2,Nbins,'FaceColor',Violet)
for j = 1:M-1
    line([DemThr(j) DemThr(j)],[5 45],'LineWidth',1,'Color',Brown,'LineStyle','-.')
end
xlabel('Symbol value')
legend('Occurrence','Threshold')
title('DEMAPPING')
grid on; hold off



%% FUNCTIONS

% >> Function for checking the main simulation parameters.
function [ ] = CheckParam( Ninfo, Nprb, SwLen, M )

    L = log2(M);
    
    if L ~= round(L)
        error(' INVALID MODULATION ORDER (M)');
    elseif mod(Ninfo,L)
        error(' INVALID INFO LENGTH (Ninfo)');
    elseif mod(Nprb,L*M)
        error(' INVALID PREAMBLE LENGTH (Nprb)');
    elseif mod(SwLen,L)
        error(' INVALID WORD LENGTH (SwLen)');
    end
end


% >> Function for retrieving the Gray mapping between bits and symbols
%    as a function of M.
function [ Map ] = GetMap( M )
    
    L = log2(M);
    GrayMtx = zeros(M,L);
    LastCell = [0;1];
    GrayMtx(1:2,end) = LastCell;
    MinVal = 1-2^L;
    for i = 2:L
        GrayMtx(1+2^(i-1):2^i,end-i+2:end) = flipud(LastCell);
        GrayMtx (1+2^(i-1):2^i,end-i+1) = 1;
        LastCell = GrayMtx(1:2^i,end-i+1:end);
    end
    Map = zeros(2,M);
    for i = 1:M
        Map(1,i) = i-1;
        for j = 1:M
            if i-1 == bi2de(GrayMtx(j,:),'left-msb')
                Map(2,i) = MinVal+2*(j-1);
                break;
            end
        end
    end

    
end


% >> Function for building the packet by specifying the mapping table,
%    the info / preamble length and the sync word value. Info bits are
%    randomly generated, whereas the preamble is a repetion of all the
%    constellation points.
function [ OutBits, OutSymbs, SymbLen ] = GetPkt( GrayMap, Nprb, SW, Ninfo, Ndum)

%     rng(76)
    M = size(GrayMap,2);
    L = log2(M);                                                                % Number of bits per symbol
    PrbCycle = zeros(1,L*M);
    for i = 1:M
        PrbCycle(1+(i-1)*L:i*L) = de2bi(i-1,L,'left-msb');
    end
    
    OutBits = [repmat(PrbCycle,[1,Nprb/length(PrbCycle)]) ...                   % Packet bits (Prb+Sw+Info+Dummy)
        Hex2Bin(SW) randi([0 1],1,Ninfo) randi([0 1],1,Ndum*L)];
    
    Nbits = length(OutBits);
    SymbLen = Nbits/L;
    OutSymbs = zeros(1,SymbLen);
    for i = 1:SymbLen                                                           % Bit-to-symbol mapping
        OutSymbs(i) = GrayMap(2,bi2de(OutBits(1+(i-1)*L:i*L), ...
            'left-msb')+1);
    end


end


% >> Function for implementing baseband non-coherent frequency demodulation.
%    The algorithm correlates delayed and conjugate samples before estimating
%    the arc tangent, giving as output the corresponding oversampled symbols.
function [ OutSamps ] = FreqDemod_v1( InSamps, k, osf, DmpMth, h )   

    CorLen = length(InSamps)-k;
    CorSamps = InSamps(1:CorLen).*conj(InSamps(1+k:end));
    OutSamps = -atan2(imag(CorSamps),real(CorSamps));
    if ~strcmp(DmpMth,'ADP')
        Sens = (pi*k*h)/osf;                                                    % Demodulator sensitivity (i.e. static scale factor to restore Rx symbols as on Tx side)
        OutSamps = OutSamps/Sens;
    end

end


% >> Function for implementing baseband coherent frequency demodulation. The algorithm
%    correlates the input complex signal with all M possible sinusoids, low-pass filters by
%    means of a FIR or moving window averager, chooses the most likely via and returns as
%    output the oversamples real symbol stream.
function [ OutSamps ] = FreqDemod_v2( InSamps, M, dev, Fs, LpfMth, WinSz, Ntaps, CutFct, Nskip )

    InSamps = InSamps(1+Nskip:end);
    LenIn = length(InSamps);                                                    % Input stream length [Sa]
    Time = 1/Fs*(0:LenIn-1);                                                    % Time axis for correlators
    FiltVias = zeros(M,LenIn);                                                  % Correlate&Filter output matrix (for all vias)
    FreqDev =  dev*(2*(1:M)-M-1);                                               % Possible deviation values [Hz]
    
    if LpfMth == 'MWA'                                                          % Moving window average as LPF method
        for j = 1:M
            CorSgn = exp(-1i*2*pi*FreqDev(j)*Time);                             % j-th correlating signal
            CorOut = InSamps.*CorSgn;                                           % Output of j-th correlator
            FiltVias(j,:) = MovWinIntegr(CorOut,WinSz/2);                       % Apply moving window average for low-pass filtering 
        end
    else                                                                        % FIR as LPF method
        FirDelay = Ntaps/2;                                                     % Delay introduced by FIR [Sa]
        Wn = 2*dev/(Fs*CutFct);                                                 % Normalized cut-off frequency
        for j = 1:M
            CorSgn = exp(-1i*2*pi*FreqDev(j)*Time);                             % j-th correlating signal
            CorOut = InSamps.*CorSgn;                                           % Output of j-th correlator
            FirTaps = fir1(Ntaps,Wn,'low');                                     % Design FIR taps
            FiltOut = filter(FirTaps,1,[CorOut zeros(1,FirDelay)]);             % Apply FIR filter
            FiltVias(j,:) = FiltOut(1+FirDelay:end);                            % Remove initial delay introduced by FIR
        end
    end
    
    OutSamps = zeros(1,LenIn);
    CompVect = zeros(1,M);                                                      % Vector for comparing each samples over all vias
    for i = 1:LenIn
        for j = 1:M
            if j <= M/2
                CompVect(j) = (real(FiltVias(j,i))+imag(FiltVias(j,i)));
            else
                CompVect(j) = (real(FiltVias(j,i))-imag(FiltVias(j,i)));
            end
        end
        [~,Idx] = max(abs(CompVect));                                           % Choose the via with highest likelihood
        OutSamps(i) = Idx*2-M-1;                                                % Convert index into corresponding symbol
    end

end


% >> Function for executing the moving-window average of the incoming stream by specifying
%     the size of the window.
function [ OutSamps ] = MovWinIntegr( InSamps, WinSz )

    LenIn = length(InSamps);
    OutSamps = zeros(1,LenIn);
    MovWin = [InSamps(1:WinSz-1) 0];
    for j = WinSz:LenIn
        MovWin(2:WinSz) = MovWin(1:WinSz-1);
        MovWin(1) = InSamps(j);
        OutSamps(j) = mean(MovWin);
    end
    
end


% >> Function for executing the symbol synchronization, requiring as input the number of samples per symbol (sps),
%    the calculation method (Mth), the normalized loop bandwidth of the loop filter (NLB), the damping factor (DF),
%    the phase detector gain (Kp) and the CutTry and Init flags. Typical values for NLB (aka BnTs), DF and Kp (aka
%    DG, see p.461-462 of [1]) are respectively 0.01, 1 and 2.7. The calculation method can be choosen among [A]
%    Mueller-Muller = M&M (decision-directed), [B] Zero-Crossing = ZCR (decision-directed), [C] Gardner = GRD (non
%    -data-aided) and [D] Early-Late = ELT (non-data-aided) [3]. By enabling the CutTry flag the synchronization
%    convergence time can be speeded up for some algorithms in specific cases (e.g. for M&M if ChDelay=osf/2).
%    Disabling the Init flag allows to keep the values of the persistent variables from previous run on the same
%    input signal (and this typically improves performances a little).
function [ OutSymbs, TEA ] = SymbSynchr( InSamps, sps, Mth, NLB, DF, Kp, CutTry, Init )
    %%% PARAMETERS %%%
    K0 = -1;                                                                    % DDS gain (p.476)
    Alpha = 0.5;                                                                % Free parameter for piecewise polynomial interpolation (p.468)
    CoefIP = [0,0,1,0; ...                                                      % Farrow coefficients for the piecewise parabolic interpolator (Tab. 8.4.1, p.470)
        -Alpha,1+Alpha,-1+Alpha,-Alpha;
        Alpha,-Alpha,-Alpha,Alpha];
    theta = NLB/(sps*(DF+0.25/DF));                                             % Temporary parameters for estimating K1 and K2                           
    d  = (1+2*DF*theta+theta^2)*K0*Kp;
    K1 = (4*DF*theta)/d;                                                        % Proportional gain of the loop filter (see Fig. 8.4.21, p.479)
    K2 = (4*theta*theta)/d;                                                     % Integrator gain of the loop filter (see Fig. 8.4.21, p.479)
    NumSrb = 0.0;                                                               % Strobes counter
    SrbFlag = false;                                                            % Strobe flag (p.475)
    HisSrb = false(1,sps);                                                      % Strobes history  
    persistent Mu;                                                              % Fractional interpolation interval
    persistent StLF;                                                            % Loop filter state
    persistent PrInLF;                                                          % Loop filter previous input
    persistent NCO;                                                             % Output of the Numerically-Controlled Oscillator (see Fig. 8.4.21, p.479)
    persistent StIP;                                                            % Interpolator state
    persistent TED;                                                             % Timing error detector buffer
    if Init == true
        Mu = 0.0;
        StLF = 0.0;
        PrInLF = 0.0;
        NCO = 0.0;                                                          
        StIP = complex(zeros(3,1),zeros(3,1));
        TED = complex(zeros(1,sps),zeros(1,sps));
    end
    if CutTry == true                                                           % Try cutting the input sample stream to recover the negative case in which ChDelay = osf/2
        if strcmp(Mth,'M&M') || strcmp(Mth,'GRD')
            InSamps = InSamps(1+round(sps/2):end);
        elseif strcmp(Mth,'ELT')
            InSamps = InSamps(1+round(sps/4):end);
        end
    end
    InLen = length(InSamps);                                                    % Length of the input stream [Sa]
    MaxOutLen = ceil(InLen*11/(10*sps));                                        % Maximum length of the output stream (+10% skew) [S] 
    TEA = zeros(1,InLen);                                                       % Timing error array
    OutSymbs = complex(zeros(MaxOutLen,1),zeros(MaxOutLen,1));                  % Output symbols
    %%% [1] MUELLER-MULLER ALGORITHM %%%
    if strcmp(Mth,'M&M')
        for i = 1:InLen
            % INTERPOLATOR %
           TEA(i) = Mu;
            NumSrb = NumSrb+SrbFlag;                                            % Update the number of strobes
            x = [InSamps(i); StIP];                                             % Refer to Fig. 8.4.2 (p.449), Eq. 8.72-8.73 (p.468) and Fig. 8.4.16 (p.471)
            OutIP = sum((CoefIP*x).*[1;Mu;Mu^2]);                               % Interpolator output
            StIP = x(1:3); 
            if SrbFlag
                OutSymbs(NumSrb) = OutIP;
            end
            % TIMING ERROR DETECTOR %
            if SrbFlag && all(~HisSrb(2:end))                                   % TED calculation occurs on a strobe (this condition allows TED to be updated after a skip, if TED update is desired only at regular strobings then check "HisSrb(1) == true" in addition to the previous condition (p.493)
              e = sign(real(TED(1)))*real(OutIP)-sign(real(OutIP))*real(TED(1)) + ...
                sign(imag(TED(1)))*imag(OutIP)-sign(imag(OutIP))*imag(TED(1));
            else
              e = 0.0;
            end
            switch sum([HisSrb(2:end),SrbFlag])                                 % Check stuffing and skipping (p.490-494)                  
                case 0
                    % DO NOTHING                                                % Skip current sample if NO strobe across N samples, i.e. HisSrb(2:end) = [0,0,...,0] & SrbFlag = 0
                case 1
                    TED = [TED(2:end),OutIP];                                   % Shift TED buffer regularly if ONE strobe across N samples
                otherwise % > 1
                    TED = [TED(3:end),0,OutIP];                                 % Stuff a missing sample if TWO (OR MORE) strobes across N samples, i.e. HisSrb(2:end) = [1,0,...,0] & SrbFlag = 1
            end
            % LOOP FILTER %
            ItgLF = PrInLF+StLF;                                                % Output of the loop filter integrator branch (see Fig. 8.4.21, p.479)                                                                    
            v = e*K1+ItgLF;                                                     % Output of the loop filter (see Fig. 8.4.21, p.479)
            StLF = ItgLF;                                                       % Update loop filter state
            PrInLF = e*K2;                                                      % Update loop filter previous input
            % INTERPOLATION CONTROLLER %                                        % Modulo-1 counter IC which generates/updates strobe signal "SrbFlag" and fractional interpolation interval "Mu" (see Sec. 8.4.3 and Fig. 8.4.19)
            W = v+1/sps;                                                        % Counter input (NB: W should be small when locked)    
            HisSrb = [HisSrb(2:end),SrbFlag];                                   % Update strobes history
            SrbFlag = (NCO<W);                                                  % Check if a strobe occurred (and if so, update Mu)
            if SrbFlag                                                      
              Mu = NCO/W;
            end
            NCO = mod(NCO-W,1);                                                 % Update counter
        end
    %%% [2] ZERO-CROSSING ALGORITHM %%%
    elseif strcmp(Mth,'ZCR')
        for i = 1:InLen
            % INTERPOLATOR %
            TEA(i) = Mu;
            NumSrb = NumSrb+SrbFlag;                                            % Update the number of strobes
            x = [InSamps(i); StIP];                                             % Refer to Fig. 8.4.2 (p.449), Eq. 8.72-8.73 (p.468) and Fig. 8.4.16 (p.471)
            OutIP = sum((CoefIP*x).*[1;Mu;Mu^2]);                               % Interpolator output
            StIP = x(1:3);
            if SrbFlag
                OutSymbs(NumSrb) = OutIP;
            end
            % TIMING ERROR DETECTOR %
            if SrbFlag && all(~HisSrb(2:end))                                   % TED calculation occurs on a strobe (this condition allows TED to be updated after a skip, if TED update is desired only at regular strobings then check "HisSrb(1) == true" in addition to the previous condition (p.493)
                t1 = TED(end/2+1-rem(sps,2));                                   % Calculate the midsample point for odd or even samples per symbol
                t2 = TED(end/2+1);
                MidSamp = (t1+t2)/2;
                e = real(MidSamp)*(sign(real(TED(1)))-sign(real(OutIP)))+ ...
                    imag(MidSamp)*(sign(imag(TED(1)))-sign(imag(OutIP)));
            else
                e = 0.0;
            end
            switch sum([HisSrb(2:end),SrbFlag])                                 % Check stuffing and skipping (p.490-494)
                case 0
                    % DO NOTHING                                                % Skip current sample if NO strobe across N samples, i.e. HisSrb(2:end) = [0,0,...,0] & SrbFlag = 0
                case 1
                    TED = [TED(2:end),OutIP];                                   % Shift TED buffer regularly if ONE strobe across N samples
                otherwise
                    TED = [TED(3:end),0,OutIP];                                 % Stuff a missing sample if TWO (OR MORE) strobes across N samples, i.e. HisSrb(2:end) = [1,0,...,0] & SrbFlag = 1
            end
            % LOOP FILTER %
            ItgLF = PrInLF+StLF;                                                % Output of the loop filter integrator branch (see Fig. 8.4.21, p.479)                                                                    
            v = e*K1+ItgLF;                                                     % Output of the loop filter (see Fig. 8.4.21, p.479)
            StLF = ItgLF;                                                       % Update loop filter state
            PrInLF = e*K2;                                                      % Update loop filter previous input
           % INTERPOLATION CONTROLLER %                                         % Modulo-1 counter IC which generates/updates strobe signal "SrbFlag" and fractional interpolation interval "Mu" (see Sec. 8.4.3 and Fig. 8.4.19)
            W = v+1/sps;                                                        % Counter input (NB: W should be small when locked)    
            HisSrb = [HisSrb(2:end),SrbFlag];                                   % Update strobes history
            SrbFlag = (NCO<W);                                                  % Check if a strobe occurred (and if so, update Mu)
            if SrbFlag                                                      
              Mu = NCO/W;
            end
            NCO = mod(NCO-W,1);                                                 % Update counter
        end  
    %%% [3] GARDNER ALGORITHM %%%
    elseif strcmp(Mth,'GRD')
        for i = 1:InLen
            % INTERPOLATOR %
        	TEA(i) = Mu;
            NumSrb = NumSrb+SrbFlag;                                            % Update the number of strobes
            x = [InSamps(i); StIP];                                             % Refer to Fig. 8.4.2 (p.449), Eq. 8.72-8.73 (p.468) and Fig. 8.4.16 (p.471)
            OutIP = sum((CoefIP*x).*[1;Mu;Mu^2]);                               % Interpolator output
            StIP = x(1:3);
            if SrbFlag
                OutSymbs(NumSrb) = OutIP;
            end
            % TIMING ERROR DETECTOR %
            if SrbFlag && all(~HisSrb(2:end))                                   % TED calculation occurs on a strobe (this condition allows TED to be updated after a skip, if TED update is desired only at regular strobings then check "HisSrb(1) == true" in addition to the previous condition (p.493)
                t1 = TED(end/2+1-rem(sps,2));                                   % Calculate the midsample point for odd or even samples per symbol
                t2 = TED(end/2+1);
                MidSamp = (t1+t2)/2;
                e = real(MidSamp)*(real(TED(1))-real(OutIP))+ ...
                    imag(MidSamp)*(imag(TED(1))-imag(OutIP));
            else
                e = 0.0;
            end
            switch sum([HisSrb(2:end),SrbFlag])                                 % Check stuffing and skipping (p.490-494)
                case 0
                    % DO NOTHING                                                % Skip current sample if NO strobe across N samples, i.e. HisSrb(2:end) = [0,0,...,0] & SrbFlag = 0
                case 1
                    TED = [TED(2:end),OutIP];                                   % Shift TED buffer regularly if ONE strobe across N samples
                otherwise
                    TED = [TED(3:end),0,OutIP];                                 % Stuff a missing sample if TWO (OR MORE) strobes across N samples, i.e. HisSrb(2:end) = [1,0,...,0] & SrbFlag = 1
            end
            % LOOP FILTER %
            ItgLF = PrInLF+StLF;                                                % Output of the loop filter integrator branch (see Fig. 8.4.21, p.479)                                                                    
            v = e*K1+ItgLF;                                                     % Output of the loop filter (see Fig. 8.4.21, p.479)
            StLF = ItgLF;                                                       % Update loop filter state
            PrInLF = e*K2;                                                      % Update loop filter previous input
            % INTERPOLATION CONTROLLER %                                        % Modulo-1 counter IC which generates/updates strobe signal "SrbFlag" and fractional interpolation interval "Mu" (see Sec. 8.4.3 and Fig. 8.4.19)
            W = v+1/sps;                                                        % Counter input (NB: W should be small when locked)    
            HisSrb = [HisSrb(2:end),SrbFlag];                                   % Update strobes history
            SrbFlag = (NCO<W);                                                  % Check if a strobe occurred (and if so, update Mu)
            if SrbFlag                                                      
              Mu = NCO/W;
            end
            NCO = mod(NCO-W,1);                                                 % Update counter
        end
    %%% [4] EARLY-LATE ALGORITHM %%%
    elseif strcmp(Mth,'ELT')
        for i = 1:InLen
            % INTERPOLATOR %
            TEA(i) = Mu;
            NumSrb = NumSrb+SrbFlag;                                            % Update the number of strobes
            x = [InSamps(i); StIP];                                             % Refer to Fig. 8.4.2 (p.449), Eq. 8.72-8.73 (p.468) and Fig. 8.4.16 (p.471)
            OutIP = sum((CoefIP*x).*[1;Mu;Mu^2]);                               % Interpolator output
            StIP = x(1:3);           
            if SrbFlag
                OutSymbs(NumSrb) = OutIP;
            end
            % TIMING ERROR DETECTOR %            
            if (~SrbFlag) && HisSrb(end) && all(~HisSrb(1:end-1))               % TED calculation occurs one sample after a strobe
                e = real(TED(end))*(real(OutIP)-real(TED(end-1)))+ ...
                    imag(TED(end))*(imag(OutIP)-imag(TED(end-1)));
            else
                e = 0.0;
            end
            switch sum([HisSrb(2:end),SrbFlag])                                 % Check stuffing and skipping (p.490-494)
                case 0
                    % DO NOTHING                                                % Skip current sample if NO strobe across N samples, i.e. HisSrb(2:end) = [0,0,...,0] & SrbFlag = 0
                case 1
                    TED = [TED(2:end),OutIP];                                   % Shift TED buffer regularly if ONE strobe across N samples
                otherwise
                    TED = [TED(3:end),0,OutIP];                                 % Stuff a missing sample if TWO (OR MORE) strobes across N samples, i.e. HisSrb(2:end) = [1,0,...,0] & SrbFlag = 1
            end
            % LOOP FILTER %
            ItgLF = PrInLF+StLF;                                                % Output of the loop filter integrator branch (see Fig. 8.4.21, p.479)                                                                    
            v = e*K1+ItgLF;                                                     % Output of the loop filter (see Fig. 8.4.21, p.479)
            StLF = ItgLF;                                                       % Update loop filter state
            PrInLF = e*K2;                                                      % Update loop filter previous input
            % INTERPOLATION CONTROLLER %                                        % Modulo-1 counter IC which generates/updates strobe signal "SrbFlag" and fractional interpolation interval "Mu" (see Sec. 8.4.3 and Fig. 8.4.19)
            W = v+1/sps;                                                        % Counter input (NB: W should be small when locked)    
            HisSrb = [HisSrb(2:end),SrbFlag];                                   % Update strobes history
            SrbFlag = (NCO<W);                                                  % Check if a strobe occurred (and if so, update Mu)
            if SrbFlag                                                      
              Mu = NCO/W;
            end
            NCO = mod(NCO-W,1);                                                 % Update counter
        end      
    else
        error('Invalid SS method!');
    end
    if NumSrb > MaxOutLen                                                       % Truncate output symbol stream if longer than 10% skew
        warning('SS dropping | %d -> %d',NumSrb,MaxOutLen);
        NumSrb = MaxOutLen;
    end
    OutSymbs = OutSymbs(1:NumSrb,1);                                            % Cut the final output symbol stream
end


% >> Function for finding the N maximum values and their indeces within the
%    incoming array.
function [ MaxVal, MaxIdx ] = FindMaxN( InVect, N )

    Len = length(InVect);
    MaxVal = InVect(1:N);
    MaxIdx = 1:N;
    [MinVal,MinPos] = min(MaxVal);
    for j = 1+N:Len
        if InVect(j) > MinVal
            MaxVal(MinPos) = InVect(j);
            MaxIdx(MinPos) = j;
            [MinVal,MinPos] = min(MaxVal);
        end
    end
    
end


% >> Function for finding the N maximum values and their indeces within the
%    incoming array.
function [ BinsVal, CCF ] = AddCluster( BinsVal, MaxIdx, ClustSz )
    
    CCF = false;
    M = length(MaxIdx);
    for i = 1:M-1
        for j = i+1:M
            if abs(MaxIdx(i)-MaxIdx(j)) <= ClustSz
                if BinsVal(MaxIdx(i)) >= BinsVal(MaxIdx(j))
                    BinsVal(MaxIdx(i)) = BinsVal(MaxIdx(i))+BinsVal(MaxIdx(j));
                    BinsVal(MaxIdx(j)) = 0;
                else
                    BinsVal(MaxIdx(j)) = BinsVal(MaxIdx(j))+BinsVal(MaxIdx(i));
                    BinsVal(MaxIdx(i)) = 0;
                end
                CCF = true;
            end
        end
    end
    
end


% >> Function for adaptively estimating the demapping threshold as the mean
%    values between edges.
function [ Thr ] = GetThresholds( InVals )

    SortVals = sort(InVals);
    ThrLen = length(InVals)-1;
    Thr = zeros(1,ThrLen);
    for j = 1:ThrLen
        Thr(j) = (SortVals(j)+SortVals(j+1))/2;
    end
    
end


% >> Function for demapping the incoming symbols into bits.
function [ OutBits, OutSymbs ] = Demapper( InSymbs, Map, DemThr )

    M = size(Map,2);
    L = log2(M);
    InLen = length(InSymbs);
    OutBits = zeros(1,L*InLen);
    OutSymbs = zeros(1,InLen);
    
    InvMap = zeros(2,M);    
    for i = 1:M
        [~,MinIdx] = min(Map(2,:));
        InvMap(:,i) = Map(:,MinIdx);
        Map(:,MinIdx) = [];
    end
    
    for i = 1:InLen
        DetOk = false;
        for j = 1:M-1                                                           % M-1 = length(DemThr)
            if InSymbs(i) < DemThr(j)
                OutBits(1+(i-1)*L:i*L) = de2bi(InvMap(1,j),L,'left-msb');
                OutSymbs(i) = InvMap(1,j);
                DetOk = true;
                break;
            end
        end
        if DetOk == false
            OutBits(1+(i-1)*L:i*L) = de2bi(InvMap(1,M),L,'left-msb');
            OutSymbs(i) = InvMap(1,M);
        end
    end
    
end


% >> Function for converting an input hexadecimal string into the corresponding bit sequence.
function [ OutBits ] = Hex2Bin( InHexBytes )
    DecBytes = hex2dec(InHexBytes);
    OutBits = reshape(de2bi(DecBytes,8,'left-msb').',[1 8*length(DecBytes)]);
end


% >> Function for detecting the specified Sync Word (with an allowed number of errors ThrErr)
%    inside the incoming bit sequence. If detected, the index of the bit just after the SW end
%    is returned, otherwise -1.
function [ SwIdx ] = SyncWordDetector( InBits, SwHex, ThrErr )
    SwBin = Hex2Bin(SwHex);
    SwLen = length(SwBin);
    SwIdx = -1;
    for j = SwLen:length(InBits)
        if sum(InBits(1+j-SwLen:j)~=SwBin) <= ThrErr
            SwIdx = j+1;
        end
    end
end



%% NOTES

% NB#1: FreqDemod_v1 proves to be more performing than FreqDemod_v2 as Eb/N0 decreases.
% NB#2: [VERS.2] FreqDemod_v2 suffers from phase ambiguity, thus a phase resolver shifting with 360/M deg. steps
%     has been inserted.
% NB#3: As a hint, set always osf to a multiple of M (and osf up if M up).
% NB#4: [VERS.2] The parameter Wn in FreqDemod_v2 represents the FIR LPF normalized cut-off frequency and must
%     be between 0 and 1 (where 1 equals Fs/2). Thus, to select a cut-off frequency of Fco Hz, Wn = 2*Fco/Fs.
%     In particular, inside FreqDemod_v2 Fco is set to dev since after the correlators the indesired components
%     to be cut off are at 2*dev!
% NB#5: [VERS.2] In case of adaptive demapping, clustering is needed because due to noise, especially when symbols
%     are not equiprobable (e.g. for short     random packets), several maximum bins associated to the same symbol
%     can be misleadingly estimated.
% NB#6: [VERS.1] Experimentally, to have good performances increase k if osf up and/or M down (and viceversa).
%     However, it is advised to keep k between 1 and 4 in any case. [@to_be_further_verified]
% NB#7: [VERS.1] Successfull test cases (@tbc)
%     M = 4 -> osf = 8 | k = 2
%     M = 8 -> osf = 32 | k = 4
%     M = 16 -> osf = 64 | k = 4
% NB#8: If SW cannot be detected try increasing EbN0 and Nprb.
% NB#9: [VERS.1] Higher M and/or h typically requires higher osf (thus, in turn, higher k) and Nprb.
% NB#10: [VERS.1] To verify the demodulation performances and make a comparison with the literature curves, the
%     symbol synchronizer should be bypassed, since the latter works worse for higher M (whereas FSK BER is expected
%     to decrease/improve as M rises).
% NB#11: [VERS.2] Keep  in mind that the VERS.2 plot is referred to the last phase shift simulated, thus not necessarily
%     to the one which found the SW. To see the desired plot reduce the PhIdx range!


%% @todo 

% - is FreqDemod_v2 really coherent?
% - why can't FreqDemod_v1 work well for k higher than 4?
