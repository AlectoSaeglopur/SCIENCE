
%%% Title: CARRIER AND SYMBOL SYNCHRONIZATION (CS+SS)
%%% Author: Filippo Valmori
%%% Date: 02/03/2020
%%% Reference: [1] Digital Communications: A Discrete-Time Approach - M.Rice
%%%            [2] MATLAB CS - https://it.mathworks.com/help/comm/ref/comm.carriersynchronizer-system-object.html#buluz8p
%%%            [3] MATLAB SS - SymbSync algorithm -> https://www.mathworks.com/help/comm/ref/symbolsynchronizer.html#mw_6bde2b5f-277f-4c26-8800-80dddc6f6a16

close all; clearvars; clc


%% PARAMETERS AND CONSTANTS

Nbits = 13504;                                                          % Number of info bits to be simulated
Rb = 10e3;                                                              % Bit rate [b/s]
Mod = "QPSK";                                                           % Phase modulation
osf = 18;                                                               % BB oversampling factor (and also sps factor for RCC filter design)
span = 8;                                                               % Span for RRC filter representation [S]
sps = 12;                                                               % Number of samples-per-symbol for RRC filtering [Sa/S]
beta = 0.5;                                                             % Roll-off factor for RRC filter representation
ChFrSh = 10;                                                            % Channel frequency shift [Hz]
ChPhSh = -56;                                                           % Channel phase shift [°]
CsNLB = 0.01;                                                           % Carrier synchronizer normalized loop bandwidth (typ. 0.01)
CsDF = 0.707;                                                           % Carrier synchronizer damping factor (typ. 0.707)
SsMet = 'ZCR';                                                          % Symbol synchronizer (ZCR, M&M, ELT or GRD)
SsDF = 1;                                                               % Symbol synchronizer damping factor (typ. 1)
SsNLB =  0.02;                                                          % Symbol synchronizer normalized loop bandwidth (typ. 0.01)
SsDG = 2.7;                                                             % Symbol synchronizer detector gain (typ. 2.7)
SsCutTry = false;
SW = ['D3';'91';'D3';'92'];                                             % Sync Word hexadecimal value
SwThrErr = 0;                                                           % Number of bit errors accepted during Sync Word detection
Nprb = 400;                                                             % Number of preamble symbols
SNR = 20;                                                               % Channel Signal-to-Noise Ratio [dB]
ChDelay = 22;                                                           % Channel delay [Sa]

M = GetModOrder(Mod);                                                   % Modulation order
Rs = Rb/log2(M);                                                        % Symbol rate [S/s]
ModOfs = (1-M)*pi/M;                                                    % Constellation phase offset [rad] (NB: A non-zero value is important for SS)
Fs = osf*Rs;                                                            % Baseband sample rate [Sa/s]
Ts = 1/Fs;                                                              % Baseband sample period [s]
Tobs = 496;                                                             % Observation window starting point [ms]
Blue = [.2 .2 1];                                                       % Custom blue color
Green = [.2 .8 .2];                                                     % Custom green color
Orange = [1 .5 0];                                                      % Custom orange color
Violet = [.8 0 .8];                                                     % Custom violet color
Azure = [0 .8 .8];                                                      % Custom azure color
Red = [1 .2 0];                                                         % Custom red color
Dark1 = [0 0 .8];                                                       % Custom dark color #1
Dark2 = [.4 0 .6];                                                      % Custom dark color #2



%% PROCESSING

[TxBits,TxSymbs,Map] = GetSymbs(Nbits,M,ModOfs,Nprb,SW);                % Generation of random Tx symbols and mapping constellation
TxSgn = upsample(TxSymbs,osf);                                          % Symbol-to-samples upsampling
TxSgn = RccFilter(TxSgn,beta,span,sps);                                 % Baseband complex signal after root-raised-cosine filtering
                                                  
ChSgn = PhFrOfst(TxSgn,Fs,ChPhSh,ChFrSh);                               % Perform frequency and phase offsets over channel
RxSgn = awgn([zeros(1,ChDelay) ChSgn],SNR,'measured');                  % Add delay and AWGN over channel

RxSgn = RccFilter(RxSgn,beta,span,sps);                                 % RCC matched filtering
[SyncSgn,PhCor] = CarSynchr(RxSgn,Mod,CsNLB,CsDF,osf,ModOfs);           % Carrier synchronization in Rx                                 

SsInit = true;
PsIdx = 1;                                                              % Phase slip index
while PsIdx <= M/2                                                      % Check half the overall number of ambiguity angles to compensate for potential phase slip
    [SyncSymbs,SsTE] = SymbSynchr(SyncSgn,osf,SsMet,SsNLB, ...
    	SsDF,SsDG,SsCutTry,SsInit);
    SsInit = false;
    [RxBits,RxSymbs] = Demapper(SyncSymbs,Map);                         % PSK demodulator
    [SwIdx,InvFlag] = SyncWordDetector(RxBits,SW,SwThrErr);             % Sync Word detector
    if ( SwIdx ~= -1 ) 
        if InvFlag == true
            RxBits = ~RxBits(SwIdx+1-8*length(SW):end);
            PsIdx = PsIdx+M/2;
        else
            RxBits = RxBits(SwIdx+1-8*length(SW):end);
        end
        break;                                                          % Exit if Sync Word found
    else
        SyncSgn = SyncSgn*exp(1i*2*pi/M);                               % Try with following offset angle if Sync Word not found
        PsIdx = PsIdx+1;
    end
end



%% RESULTS

NbitsTx = length(TxBits);
NbitsRx = length(RxBits);
if SwIdx == -1
    fprintf(" * SyncWord not found\n");
    PS = 0;                                                             % Set a null value for the phase slip by default [°]
else
    UPE = rem(-mean(PhCor(end-100:end)),360);                           % Uncompensated phase error estimated [°]
    PS = (PsIdx-1)*360/M;                                               % Detected phase slip [°]
    CPE = UPE-PS;                                                       % Compensated phase error estimated (should equal ChPhOfst) [°]
    if NbitsRx >= NbitsTx
        NbErr = sum(RxBits(1:NbitsTx)~=TxBits);                         % Check the number of corrupted bits
    else
        NbErr = sum(RxBits~=TxBits(1:NbitsRx))+NbitsTx-NbitsRx;
    end
    
    fprintf(" * Sync Word found (SaIdx=#%d)\n",SwIdx);
    fprintf(" * Theoretical expected phase error = %1.1f°\n",mod(2*pi*ChFrSh*length(TxSgn)/Fs*360/(2*pi)+ChPhSh,360));
    fprintf(" * Estimated phase error = %1.1f° (U) & %1.1f° (S) = %1.1f° (C)\n",UPE,PS,mod(CPE,360));
    fprintf(" * Number of corrupted bits : %d out of %d\n\n",NbErr,length(TxBits));
end

TimeSa = Ts*(0:length(TxSgn)+ChDelay-1);                                % Time basis (in samples)
TimeSy = 1/Rs*(0:length(SyncSymbs)-1);                                  % Time basis (in symbols)
ErrCs = PhCor+ChPhSh+PS+ChFrSh*TimeSa*360;                              % Carrier synchronizer error in time [°]
ErrSs = osf/2-abs(SsTE/Rs*Fs-osf/2);                                    % Symbol synchronizer error in time [Sa]
TimeSs = Ts*(0:length(ErrSs)-1);

figure
subplot(2,3,1); box on; hold on
plot(TimeSa*1e3,[zeros(1,ChDelay) RccFilter(real(TxSgn), ...            % Tx signal is SRRC filtered in order to have a proper comparison with the Rx waveform
    beta,span,sps)],'.-','Color',Blue)    
plot(TimeSa*1e3,real(RxSgn),'.--','Color',Green)
plot(TimeSa*1e3,real(SyncSgn),'.-.','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude'); legend(' Tx',' RxChan',' RxCS')
title('In-phase Waveforms'); axis([Tobs Tobs+5 -1.2 1.2])
hold off; grid on

subplot(2,3,2); box on; hold on
plot(TimeSa*1e3,[zeros(1,ChDelay) RccFilter(imag(TxSgn), ...
    beta,span,sps)],'.-','Color',Blue) 
plot(TimeSa*1e3,imag(RxSgn),'.--','Color',Green)
plot(TimeSa*1e3,imag(SyncSgn),'.-.','Color',Red)
xlabel('Time [ms]'); ylabel('Amplitude'); legend(' Tx',' RxChan',' RxCS')
title('Quadrature Waveforms'); axis([Tobs Tobs+5 -1.2 1.2])
hold off; grid on

subplot(2,3,3); box on
plot(TimeSa,ErrCs,'-','Color',Dark1,'LineWidth',1.5)
xlabel('Time [s]'); ylabel('Degrees [°]'); xlim([-.005 1.5])
title('CS Phase Error'); grid on

subplot(2,3,4); box on; hold on
if mod(ChDelay,osf)> osf/2
    plot(TimeSa*1e3,[zeros(1,osf-mod(ChDelay,osf)) real(SyncSgn(1:end-osf+mod(ChDelay,osf)))],'.--','Color',Orange)
else
    plot(TimeSa*1e3,[real(SyncSgn(1+mod(ChDelay,osf):end)) zeros(1,mod(ChDelay,osf))],'.--','Color',Orange)
end
stem(TimeSy*1e3,real(SyncSymbs),'x-','Color',Violet)
stem(TimeSy*1e3,[zeros(1,length(RxSymbs)-length(TxSymbs)) real(TxSymbs)],'*-.','Color',Azure)
xlabel('Time [ms]'); ylabel('Amplitude'); legend('RxCS','RxSS','Tx')
title('In-phase Symbols'); axis([Tobs Tobs+5 -1.2 1.2])
hold off; grid on

subplot(2,3,5); box on; hold on
if mod(ChDelay,osf)> osf/2
    plot(TimeSa*1e3,[zeros(1,osf-mod(ChDelay,osf)) imag(SyncSgn(1:end-osf+mod(ChDelay,osf)))],'.--','Color',Orange)
else
    plot(TimeSa*1e3,[imag(SyncSgn(1+mod(ChDelay,osf):end)) zeros(1,mod(ChDelay,osf))],'.--','Color',Orange)
end
stem(TimeSy*1e3,imag(SyncSymbs),'x-','Color',Violet)
stem(TimeSy*1e3,[zeros(1,length(RxSymbs)-length(TxSymbs)) imag(TxSymbs)],'*-.','Color',Azure)
xlabel('Time [ms]'); ylabel('Amplitude'); legend('RxCS','RxSS','Tx')
title('Quadrature Symbols'); axis([Tobs Tobs+5 -1.2 1.2])
hold off; grid on

subplot(2,3,6); box on
plot(TimeSs,ErrSs,'-','Color',Dark2,'LineWidth',1)
xlabel('Time [s]'); ylabel('Samples [#]'); axis([-.005 1.5 -.1  max(ErrSs)+.1])
title('SS Timing Error'); grid on



%% EXTRA FUNCTIONS

% >> Function for retrieving the modulation order from the input modulation type.
function [M] = GetModOrder( Mod )
    if strcmp(Mod,'BPSK')
        M = 2;
    elseif strcmp(Mod,'QPSK') || strcmp(Mod,'OQPSK')
        M = 4;
    elseif strcmp(Mod,'8PSK')
        M = 8;
    else
        error('Invalid modulation');
    end
end

% >> Function for randomly generating the Tx bits and the corresponding symbols according to the selected PSK modulation. 
%    As input it can be specified the number of preamble symbols (Nprb) and Sync Word value (SW) to be padded at the
%    beginning of the packet, along with a potential constellation phase offset (PhOfs). Moreover, the constellation
%    mapping between bits and symbols (Map) is provided in output.
function [ TxBits, OutSymbs, Map ] = GetSymbs( Nbits, M, PhOfs, Nprb, SW )       
    L = log2(M);                                                        % Number of bits per symbol
    GrayMtx = zeros(M,L);                                               % Gray binary mapping matrix
    LastCell = [0;1];
    GrayMtx(1:2,end) = LastCell;
    for i = 2:L
        GrayMtx(1+2^(i-1):2^i,end-i+2:end) = flipud(LastCell);
        GrayMtx (1+2^(i-1):2^i,end-i+1) = 1;
        LastCell = GrayMtx(1:2^i,end-i+1:end);
    end
    GrayMtx = bi2de(GrayMtx,'left-msb');                                % Gray decimal mapping matrix
    GrayMap = zeros(1,M);                                               % Map between bits and constellation points
    for j = 0:M-1
        GrayMap(j+1) = find(GrayMtx==j);
    end
    TxBits = randi([0 1],1,Nbits);                                      % Bits random generation (info field)
    TxBits = [Hex2Bin(SW) TxBits];                                      % Add the SyncWord at the beginning of packet  
    Nsymb = length(TxBits)/L;                                           % Number of output symbols
    AngStep = 2*pi/M;                                                   % Angle distance between two consecutive points in constellation
    OutSymbs = zeros(1,Nsymb);
    Angles = PhOfs+AngStep*(0:M-1);
    Const = cos(Angles)+1i*sin(Angles);                                 % Complex PSK constellation
    Map = struct('Const',Const,'Gray',GrayMtx);
    for i = 1:Nsymb
        OutSymbs(i) = Const(GrayMap(bi2de(TxBits(1+(i-1)*L:i*L), ...    % Bits-to-symbol mapping
            'left-msb')+1));
    end
    PrbSymbs = Const(1)*square(pi/2+pi*(0:Nprb-1));                     % Preamble symbols
    OutSymbs = [PrbSymbs OutSymbs];                                     % Preamble paddign at the beginning of frame
end


% >> Function for executing Square Root Raised Cosine (SRRC) filtering on the input signal.
function [ OutSamps ] = RccFilter( InSamps, beta, span, sps )
    RccTaps = rcosdesign(beta,span,sps,'sqrt');                         % Retrieve SRCC filter taps
    RccDelay = span*sps/2;
    OutSamps = filter(RccTaps,1,[InSamps zeros(1,RccDelay)]);
    OutSamps = OutSamps(1+RccDelay:end);
end


% >> Function for introducing phase and frequency shifts on the incoming signal (sampled at Fs). The phase and frequrncy
%    shift values can be constants or arrays of the same length of the input signal.
function [ OutSgn ] = PhFrOfst( InSgn, Fs, PhShDeg, FrSh )
    PhShRad = 2*pi*PhShDeg/360;
    InLen = length(InSgn);
    OutSgn = zeros(1,InLen); 
    if length(PhShRad) == 1 && length(FrSh) == 1
        for j = 1:InLen
            OutSgn(j) = InSgn(j)*(cos(2*pi*FrSh*(j-1)/Fs+PhShRad)+ ...
                1i*sin(2*pi*FrSh*(j-1)/Fs+PhShRad));
        end
    elseif length(PhShRad) == InLen && length(FrSh) == InLen
        OutSgn(1) = InSgn(1)*(cos(PhShRad(1))+1i*sin(PhShRad(1)));
        for j = 2:InLen
            OutSgn(j) = InSgn(j)*(cos(2*pi*sum(FrSh(1:j-1))/Fs+PhShRad(j))+ ...
                1i*sin(2*pi*sum(FrSh(1:j-1))/Fs+PhShRad(j)));
        end
    else
        error('Invalid phase/frequency shift parameter!');
    end
end


% >> Phase and frequency synchronizer (for single carrier modulation schemes) based on maximum likelihood phase error
%    detection [1]. The block consists of a Phase Shifter, a Phase Error Detector, a Loop Filter (implemented as an
%    integrator) and a Direct Digital Synthesizer (aka DDS, i.e. the discrete time version of a VCO, again implemented
%    as an integrator). The function needs as input the modulation order (M), the normalized loop bandwidth (NLB),
%    the damping factor (DF) and the oversampling factor (sps) of the input signal to be synchronized. The PLL pull-in
%    range can be estimated as PIR = min(1,2*pi*sqrt(2)*DF*NLB)*360/(2*pi*NLB).
function [ OutSgn, PhCor ] = CarSynchr( InSgn, Mod, NLB, DF, sps, PhOfst )
    if strcmp(Mod,'BPSK')
        CstPh = -PhOfst;                                                % Algorithm for BPSK expects a constellation shift of 0° degree to work properly
    elseif strcmp(Mod,'8PSK')
        CstPh = pi/8-PhOfst;                                            % Algorithm for 8PSK expects a constellation shift of 22.5° degree to work properly
    else                                                                % i.e. QPSK or OQPSK
        CstPh = pi/4-PhOfst;                                            % Algorithm for QPSK/OQPSK expects a constellation shift of 45° degree to work properly
    end
    InSgn = InSgn*exp(1i*CstPh);                                        % Compensate custom constellation phase shift
    Len = length(InSgn);                                                % Length of the input signal [Sa]
    yP = 0;                                                             % Synchronizer output sample at (k-1)th iteration
    psiP = 0;                                                           % Loop Filter output sample at (k-1)th iteration
    tauP = 0;                                                           % DDS output sample at (k-1)th iteration
    tauC = 0;                                                           % DDS output sample at k-th iteration
    OutSgn = zeros(1,Len);                                              % Synchronized final signal
    PhCor = zeros(1,Len);                                               % Phase correction array
    K0 = sps;                                                           % Phase recovery gain
    if strcmp(Mod,"BPSK") || strcmp(Mod,"PAM") || strcmp(Mod,"QAM") ...
            || strcmp(Mod,"QPSK") || strcmp(Mod,"OQPSK")
        Kp = 2;                                                         % Phase Error detector gain
    elseif strcmp(Mod,"8PSK")
        Kp = 1;
    else
        error('Invalid modulation');
    end
    theta = NLB/(DF+1/(4*DF));
    d = 1+2*DF*theta+theta^2;
    GL = (4/sps*theta*theta/d)/(K0*Kp);                                 % Loop Filter gain
    GD = (4*DF*theta/d)/(K0*Kp);                                        % DDS gain 
    for k = 1:Len
        if strcmp(Mod,"BPSK") || strcmp(Mod,"PAM")
            e = sign(real(yP))*imag(yP);                                % Phase Error Detector output
        elseif strcmp(Mod,"QAM") || strcmp(Mod,"QPSK")
            e = sign(real(yP))*imag(yP)-sign(imag(yP))*real(yP);
        elseif strcmp(Mod,"OQPSK")    
            e = sign(real(OutSgn(k-1-floor(sps/2))))*imag( ...          % Floor operation in case of odd sps value (NOT TESTED YET)
                OutSgn(k-1-floor(sps/2)))-sign(imag(yP))*real(yP);
        else                                                            % i.e. 8-PSK
            if abs(real(yP)) < abs(imag(yP))
                e = (sqrt(2)-1)*sign(real(yP))*imag(yP)-sign(imag(yP))*real(yP);
            else
                e = sign(real(yP))*imag(yP)-(sqrt(2)-1)*sign(imag(yP))*real(yP);
            end
        end
        OutSgn(k) = InSgn(k)*exp(-1i*tauC);                             % Phase Shifter output
        psiC = GL*e+psiP;                                               % Loop Filter output at k-th iteration
        tauC = tauP+e*GD+psiC;                                          % DDS output at k-th iteration
        PhCor(k) = -tauC;                                               % Save the estimated phase corrections
        yP = OutSgn(k);                                                 % Update the Synchronizer previous output (for next cycle)
        psiP = psiC;                                                    % Update the Loop Filter previous output (for next cycle)
        tauP = tauC;                                                    % Update the DDS previous output (for next cycle)
    end
    OutSgn = OutSgn*exp(-1i*CstPh);                                     % Re-phase the output signal according to the custom phase offset
    PhCor = 360*PhCor/(2*pi);                                           % Convert PhCor from radiants to degrees
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
    K0 = -1;                                                            % DDS gain (p.476)
    Alpha = 0.5;                                                        % Free parameter for piecewise polynomial interpolation (p.468)
    CoefIP = [0,0,1,0; ...                                              % Farrow coefficients for the piecewise parabolic interpolator (Tab. 8.4.1, p.470)
        -Alpha,1+Alpha,-1+Alpha,-Alpha;
        Alpha,-Alpha,-Alpha,Alpha];
    theta = NLB/(sps*(DF+0.25/DF));                                     % Temporary parameters for estimating K1 and K2                           
    d  = (1+2*DF*theta+theta^2)*K0*Kp;
    K1 = (4*DF*theta)/d;                                                % Proportional gain of the loop filter (see Fig. 8.4.21, p.479)
    K2 = (4*theta*theta)/d;                                             % Integrator gain of the loop filter (see Fig. 8.4.21, p.479)
    NumSrb = 0.0;                                                       % Strobes counter
    SrbFlag = false;                                                    % Strobe flag (p.475)
    HisSrb = false(1,sps);                                              % Strobes history  
    persistent Mu;                                                      % Fractional interpolation interval
    persistent StLF;                                                    % Loop filter state
    persistent PrInLF;                                                  % Loop filter previous input
    persistent NCO;                                                     % Output of the Numerically-Controlled Oscillator (see Fig. 8.4.21, p.479)
    persistent StIP;                                                    % Interpolator state
    persistent TED;                                                     % Timing error detector buffer
    if Init == true
        Mu = 0.0;
        StLF = 0.0;
        PrInLF = 0.0;
        NCO = 0.0;                                                          
        StIP = complex(zeros(3,1),zeros(3,1));
        TED = complex(zeros(1,sps),zeros(1,sps));
    end
    if CutTry == true                                                   % Try cutting the input sample stream to recover the negative case in which ChDelay = osf/2
        if strcmp(Mth,'M&M') || strcmp(Mth,'GRD')
            InSamps = InSamps(1+round(sps/2):end);
        elseif strcmp(Mth,'ELT')
            InSamps = InSamps(1+round(sps/4):end);
        end
    end
    InLen = length(InSamps);                                            % Length of the input stream [Sa]
    MaxOutLen = ceil(InLen*11/(10*sps));                                % Maximum length of the output stream (+10% skew) [S] 
    TEA = zeros(1,InLen);                                               % Timing error array
    OutSymbs = complex(zeros(MaxOutLen,1),zeros(MaxOutLen,1));          % Output symbols
    %%% [1] MUELLER-MULLER ALGORITHM %%%
    if strcmp(Mth,'M&M')
        for i = 1:InLen
            % INTERPOLATOR %
           TEA(i) = Mu;
            NumSrb = NumSrb+SrbFlag;                                    % Update the number of strobes
            x = [InSamps(i); StIP];                                     % Refer to Fig. 8.4.2 (p.449), Eq. 8.72-8.73 (p.468) and Fig. 8.4.16 (p.471)
            OutIP = sum((CoefIP*x).*[1;Mu;Mu^2]);                       % Interpolator output
            StIP = x(1:3); 
            if SrbFlag
                OutSymbs(NumSrb) = OutIP;
            end
            % TIMING ERROR DETECTOR %
            if SrbFlag && all(~HisSrb(2:end))                           % TED calculation occurs on a strobe (this condition allows TED to be updated after a skip, if TED update is desired only at regular strobings then check "HisSrb(1) == true" in addition to the previous condition (p.493)
              e = sign(real(TED(1)))*real(OutIP)-sign(real(OutIP))*real(TED(1)) + ...
                sign(imag(TED(1)))*imag(OutIP)-sign(imag(OutIP))*imag(TED(1));
            else
              e = 0.0;
            end
            switch sum([HisSrb(2:end),SrbFlag])                         % Check stuffing and skipping (p.490-494)                  
                case 0
                    % DO NOTHING                                        % Skip current sample if NO strobe across N samples, i.e. HisSrb(2:end) = [0,0,...,0] & SrbFlag = 0
                case 1
                    TED = [TED(2:end),OutIP];                           % Shift TED buffer regularly if ONE strobe across N samples
                otherwise % > 1
                    TED = [TED(3:end),0,OutIP];                         % Stuff a missing sample if TWO (OR MORE) strobes across N samples, i.e. HisSrb(2:end) = [1,0,...,0] & SrbFlag = 1
            end
            % LOOP FILTER %
            ItgLF = PrInLF+StLF;                                        % Output of the loop filter integrator branch (see Fig. 8.4.21, p.479)                                                                    
            v = e*K1+ItgLF;                                             % Output of the loop filter (see Fig. 8.4.21, p.479)
            StLF = ItgLF;                                               % Update loop filter state
            PrInLF = e*K2;                                              % Update loop filter previous input
            % INTERPOLATION CONTROLLER %                                % Modulo-1 counter IC which generates/updates strobe signal "SrbFlag" and fractional interpolation interval "Mu" (see Sec. 8.4.3 and Fig. 8.4.19)
            W = v+1/sps;                                                % Counter input (NB: W should be small when locked)    
            HisSrb = [HisSrb(2:end),SrbFlag];                           % Update strobes history
            SrbFlag = (NCO<W);                                          % Check if a strobe occurred (and if so, update Mu)
            if SrbFlag                                                      
              Mu = NCO/W;
            end
            NCO = mod(NCO-W,1);                                         % Update counter
        end
    %%% [2] ZERO-CROSSING ALGORITHM %%%
    elseif strcmp(Mth,'ZCR')
        for i = 1:InLen
            % INTERPOLATOR %
            TEA(i) = Mu;
            NumSrb = NumSrb+SrbFlag;                                    % Update the number of strobes
            x = [InSamps(i); StIP];                                     % Refer to Fig. 8.4.2 (p.449), Eq. 8.72-8.73 (p.468) and Fig. 8.4.16 (p.471)
            OutIP = sum((CoefIP*x).*[1;Mu;Mu^2]);                       % Interpolator output
            StIP = x(1:3);
            if SrbFlag
                OutSymbs(NumSrb) = OutIP;
            end
            % TIMING ERROR DETECTOR %
            if SrbFlag && all(~HisSrb(2:end))                           % TED calculation occurs on a strobe (this condition allows TED to be updated after a skip, if TED update is desired only at regular strobings then check "HisSrb(1) == true" in addition to the previous condition (p.493)
                t1 = TED(end/2+1-rem(sps,2));                           % Calculate the midsample point for odd or even samples per symbol
                t2 = TED(end/2+1);
                MidSamp = (t1+t2)/2;
                e = real(MidSamp)*(sign(real(TED(1)))-sign(real(OutIP)))+ ...
                    imag(MidSamp)*(sign(imag(TED(1)))-sign(imag(OutIP)));
            else
                e = 0.0;
            end
            switch sum([HisSrb(2:end),SrbFlag])                         % Check stuffing and skipping (p.490-494)
                case 0
                    % DO NOTHING                                        % Skip current sample if NO strobe across N samples, i.e. HisSrb(2:end) = [0,0,...,0] & SrbFlag = 0
                case 1
                    TED = [TED(2:end),OutIP];                           % Shift TED buffer regularly if ONE strobe across N samples
                otherwise
                    TED = [TED(3:end),0,OutIP];                         % Stuff a missing sample if TWO (OR MORE) strobes across N samples, i.e. HisSrb(2:end) = [1,0,...,0] & SrbFlag = 1
            end
            % LOOP FILTER %
            ItgLF = PrInLF+StLF;                                        % Output of the loop filter integrator branch (see Fig. 8.4.21, p.479)                                                                    
            v = e*K1+ItgLF;                                             % Output of the loop filter (see Fig. 8.4.21, p.479)
            StLF = ItgLF;                                               % Update loop filter state
            PrInLF = e*K2;                                              % Update loop filter previous input
           % INTERPOLATION CONTROLLER %                                 % Modulo-1 counter IC which generates/updates strobe signal "SrbFlag" and fractional interpolation interval "Mu" (see Sec. 8.4.3 and Fig. 8.4.19)
            W = v+1/sps;                                                % Counter input (NB: W should be small when locked)    
            HisSrb = [HisSrb(2:end),SrbFlag];                           % Update strobes history
            SrbFlag = (NCO<W);                                          % Check if a strobe occurred (and if so, update Mu)
            if SrbFlag                                                      
              Mu = NCO/W;
            end
            NCO = mod(NCO-W,1);                                         % Update counter
        end  
    %%% [3] GARDNER ALGORITHM %%%
    elseif strcmp(Mth,'GRD')
        for i = 1:InLen
            % INTERPOLATOR %
        	TEA(i) = Mu;
            NumSrb = NumSrb+SrbFlag;                                    % Update the number of strobes
            x = [InSamps(i); StIP];                                     % Refer to Fig. 8.4.2 (p.449), Eq. 8.72-8.73 (p.468) and Fig. 8.4.16 (p.471)
            OutIP = sum((CoefIP*x).*[1;Mu;Mu^2]);                       % Interpolator output
            StIP = x(1:3);
            if SrbFlag
                OutSymbs(NumSrb) = OutIP;
            end
            % TIMING ERROR DETECTOR %
            if SrbFlag && all(~HisSrb(2:end))                           % TED calculation occurs on a strobe (this condition allows TED to be updated after a skip, if TED update is desired only at regular strobings then check "HisSrb(1) == true" in addition to the previous condition (p.493)
                t1 = TED(end/2+1-rem(sps,2));                           % Calculate the midsample point for odd or even samples per symbol
                t2 = TED(end/2+1);
                MidSamp = (t1+t2)/2;
                e = real(MidSamp)*(real(TED(1))-real(OutIP))+ ...
                    imag(MidSamp)*(imag(TED(1))-imag(OutIP));
            else
                e = 0.0;
            end
            switch sum([HisSrb(2:end),SrbFlag])                         % Check stuffing and skipping (p.490-494)
                case 0
                    % DO NOTHING                                        % Skip current sample if NO strobe across N samples, i.e. HisSrb(2:end) = [0,0,...,0] & SrbFlag = 0
                case 1
                    TED = [TED(2:end),OutIP];                           % Shift TED buffer regularly if ONE strobe across N samples
                otherwise
                    TED = [TED(3:end),0,OutIP];                         % Stuff a missing sample if TWO (OR MORE) strobes across N samples, i.e. HisSrb(2:end) = [1,0,...,0] & SrbFlag = 1
            end
            % LOOP FILTER %
            ItgLF = PrInLF+StLF;                                        % Output of the loop filter integrator branch (see Fig. 8.4.21, p.479)                                                                    
            v = e*K1+ItgLF;                                             % Output of the loop filter (see Fig. 8.4.21, p.479)
            StLF = ItgLF;                                               % Update loop filter state
            PrInLF = e*K2;                                              % Update loop filter previous input
            % INTERPOLATION CONTROLLER %                                % Modulo-1 counter IC which generates/updates strobe signal "SrbFlag" and fractional interpolation interval "Mu" (see Sec. 8.4.3 and Fig. 8.4.19)
            W = v+1/sps;                                                % Counter input (NB: W should be small when locked)    
            HisSrb = [HisSrb(2:end),SrbFlag];                           % Update strobes history
            SrbFlag = (NCO<W);                                          % Check if a strobe occurred (and if so, update Mu)
            if SrbFlag                                                      
              Mu = NCO/W;
            end
            NCO = mod(NCO-W,1);                                         % Update counter
        end
    %%% [4] EARLY-LATE ALGORITHM %%%
    elseif strcmp(Mth,'ELT')
        for i = 1:InLen
            % INTERPOLATOR %
            TEA(i) = Mu;
            NumSrb = NumSrb+SrbFlag;                                    % Update the number of strobes
            x = [InSamps(i); StIP];                                     % Refer to Fig. 8.4.2 (p.449), Eq. 8.72-8.73 (p.468) and Fig. 8.4.16 (p.471)
            OutIP = sum((CoefIP*x).*[1;Mu;Mu^2]);                       % Interpolator output
            StIP = x(1:3);           
            if SrbFlag
                OutSymbs(NumSrb) = OutIP;
            end
            % TIMING ERROR DETECTOR %            
            if (~SrbFlag) && HisSrb(end) && all(~HisSrb(1:end-1))       % TED calculation occurs one sample after a strobe
                e = real(TED(end))*(real(OutIP)-real(TED(end-1)))+ ...
                    imag(TED(end))*(imag(OutIP)-imag(TED(end-1)));
            else
                e = 0.0;
            end
            switch sum([HisSrb(2:end),SrbFlag])                         % Check stuffing and skipping (p.490-494)
                case 0
                    % DO NOTHING                                        % Skip current sample if NO strobe across N samples, i.e. HisSrb(2:end) = [0,0,...,0] & SrbFlag = 0
                case 1
                    TED = [TED(2:end),OutIP];                           % Shift TED buffer regularly if ONE strobe across N samples
                otherwise
                    TED = [TED(3:end),0,OutIP];                         % Stuff a missing sample if TWO (OR MORE) strobes across N samples, i.e. HisSrb(2:end) = [1,0,...,0] & SrbFlag = 1
            end
            % LOOP FILTER %
            ItgLF = PrInLF+StLF;                                        % Output of the loop filter integrator branch (see Fig. 8.4.21, p.479)                                                                    
            v = e*K1+ItgLF;                                             % Output of the loop filter (see Fig. 8.4.21, p.479)
            StLF = ItgLF;                                               % Update loop filter state
            PrInLF = e*K2;                                              % Update loop filter previous input
            % INTERPOLATION CONTROLLER %                                % Modulo-1 counter IC which generates/updates strobe signal "SrbFlag" and fractional interpolation interval "Mu" (see Sec. 8.4.3 and Fig. 8.4.19)
            W = v+1/sps;                                                % Counter input (NB: W should be small when locked)    
            HisSrb = [HisSrb(2:end),SrbFlag];                           % Update strobes history
            SrbFlag = (NCO<W);                                          % Check if a strobe occurred (and if so, update Mu)
            if SrbFlag                                                      
              Mu = NCO/W;
            end
            NCO = mod(NCO-W,1);                                         % Update counter
        end      
    else
        error('Invalid SS method!');
    end
    if NumSrb > MaxOutLen                                               % Truncate output symbol stream if longer than 10% skew
        warning('SS dropping | %d -> %d',NumSrb,MaxOutLen);
        NumSrb = MaxOutLen;
    end
    OutSymbs = OutSymbs(1:NumSrb,1);                                    % Cut the final output symbol stream
end


% >> Function for converting an input hexadecimal string into the corresponding bit sequence.
function [ OutBits ] = Hex2Bin( InHexBytes )
    DecBytes = hex2dec(InHexBytes);
    OutBits = reshape(de2bi(DecBytes,8,'left-msb').',[1 8*length(DecBytes)]);
end


% >> Function for IQ demapping the input symbols into bits according to the specified Map.
function [ OutBits, OutSymbs ] = Demapper( InSymbs, Map )
    L = log2(length(Map.Gray));
    Ns = length(InSymbs);
    Nb = Ns*L;
    OutSymbs = zeros(1,Ns);
    OutBits = zeros(1,Nb);
    for j = 1:Ns
        Diff = abs(InSymbs(j)-Map.Const);
        [~,MinIdx] = min(Diff);
        OutSymbs(j) = Map.Const(MinIdx);
        OutBits(1+(j-1)*L:j*L) = de2bi(Map.Gray(MinIdx),L,'left-msb');
    end
end


% >> Function for detecting the specified Sync Word (with an allowed number of errors ThrErr) inside the input bit
%    sequence. If detected, the index of the bit just after the SW end is given as output, otherwise the latter is
%    set as -1. The algorithm also looks for the inverted (not bit-a-bit) version of the SW and, in this case, the
%    InvFlag is asserted.
function [ SwIdx, InvFlag ] = SyncWordDetector( InBits, SwHex, ThrErr )
    SwBin = Hex2Bin(SwHex);
    SwBinInv = ~SwBin;
    SwLen = length(SwBin);
    SwIdx = -1;
    InvFlag = false;
    for j = SwLen:length(InBits)
        if sum(InBits(1+j-SwLen:j)~=SwBin) <= ThrErr
            SwIdx = j;
        elseif sum(InBits(1+j-SwLen:j)~=SwBinInv) <= ThrErr
            SwIdx = j;
            InvFlag = true;
        end
    end
end



%% NOTES

% NB#1: Phase ambiguity after CS occurs if |ChPhSh| > pi/M.
% NB#2: An higher value of ChFrSh requires higher CS/SS NLB and Nprb.
% NB#3: System performaces (in terms of BER) remain good down to about SNR = 0 dB.
% NB#4: The 2nd ouput of the SS block (i.e. TEA) is the symbol error (normalized to Fs and 1/Rs), ranging between 0 and 1.
% NB#5: EL and GR algorithms work also for ModOfs = 0, but only if CS is skipped.
% NB#6: CS has worked properly during the simulation if its error (i.e. ErrCs reported in Fig.3) stabilizes in time at about 0°
%   (or multiples of 360°).
% NB#7: Keep in mind the SS maximum error (i.e. ErrSs reported in Fig.6) is always osf/2.
% NB#8: Incresing the beta factor of the RRC filtering (i.e. increasing the signal occupied bandwidth) allows to get a better
%   estimate of the symbol in reception at the SS (see Fig.4 and Fig.5).
% NB#9: Non-data-aided TED uses received samples without any knowledge of the transmitted signal (e.g. modulation) or the results
%   of the channel estimation. Non-data-aided TED is used to estimate the timing error for signals with modulation schemes
%   that have constellation points aligned with the in-phase or quadrature axis. Examples of signals suitable for the Gardner
%   or early-late methods include QPSK-modulated signals with a zero phase offset that has points at {1+0i, 0+1i, -1+0i, 0-1i}
%   and BPSK-modulated signals with a zero phase offset. The Gardner method is a non-data-aided feedback method that is independent
%   of carrier phase recovery. It is used for baseband systems and modulated carrier systems. More specifically, this method is
%   used for systems that use a linear modulation type with Nyquist pulses that have an excess bandwidth between approximately 40%
%   and 100%. Examples include systems that use PAM, PSK, QAM, or OQPSK modulation and that shape the signal using raised cosine
%   filters whose rolloff factor is between 0.4 and 1. In the presence of noise, the performance of this timing recovery method
%   improves as the excess bandwidth increases (or rolloff factor increases in the case of a raised cosine filter).The Early-Late
%   method (similar to the Gardner one) is a non-data-aided feedback method. It is used for systems that use a linear modulation
%   type such as PAM, PSK, QAM, or OQPSK modulation. For example, systems using a raised cosine filter with Nyquist pulses. In the
%   presence of noise, the performance of this timing recovery method improves as the excess bandwidth of the pulse increases (or
%   rolloff factor increases in the case of a raised cosine filter). The Gardner method performs better in systems with high SNR
%   values because it has lower self noise than the early-late method.
%   Decision-directed TED uses the sign function to estimate the in-phase and quadrature components of received samples, which
%   result in lower computational complexity than non-data-aided TED. The Zero-Crossing method is a decision-directed technique
%   that requires two samples per symbol at the input to the synchronizer. It is used in low-SNR conditions for all values of
%   excess bandwidth and in moderate-SNR conditions for moderate excess bandwidth factors in the approximate range [0.4, 0.6].
%   The Mueller-Muller method is a decision-directed feedback method that requires prior recovery of the carrier phase. When the
%   input signal has Nyquist pulses (for example, when using a raised cosine filter), the Mueller-Muller method has no self noise.
%   For narrowband signaling in the presence of noise, the performance of the Mueller-Muller method improves as the excess bandwidth
%   factor of the pulse decreases. Because the decision-directed methods (Zero-Crossing and Mueller-Muller) estimate timing error
%   based on the sign of the in-phase and quadrature components of signals passed to the synchronizer, they are not recommended for
%   constellations that have points with either a zero in-phase or a quadrature component. x(kTs+phi) and y(kTs+phi) are the in-phase
%   and quadrature components of the input signals to the timing error detector, where phi is the estimated timing error. The Mueller
%   -Muller method coefficients a0(k) and a1(k) are the estimates of x(kTs+phi) and y(kTs+phi). The timing estimates are made by
%   applying the sign function to the in-phase and quadrature components and are used for only the decision-directed TED methods.



%% @todo

% Implement OQPSK mod/demod
% Study CS typical factors (e.g loop bandwidth, damping factor, pull-in range, hold-in range, lock-in ranegs) -> see Sklar book!
