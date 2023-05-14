
close all; clearvars; clc


%% MAIN PARAMETERS

global Rs Fc dev M osf                      % Global variables definition
global Fs_RF SizeDim bpb

Ninfo = [47 102 66];                        % Number of info symbols to be simulated for each packet
Rb = 100e3;                                 % [b/s] Target bit rate
A = 1;                                      % [V] Carrier waveform amplitude
Fc = 100e6;                                 % [Hz] Carrier frequency
dev = 50e3;                                 % [Hz] Inner frequency deviation
M = 4;                                      % Modulation order
osf = 16;                                   % Oversampling factor at RF/BB (e.g. "8" means about four times the minumum Nyquist rate)
SNR = 20;                                   % [dB] Signal-to-noise ratio over channel
MaxDelay = 1e-5;                            % [s] Maximum time delay over channel

Npreamb = 16;                               % Length (in symbols) of the preamble
SyncWord = 'D391';                          % Hexadecimal value of the SyncWord
SizeDim = 2;                                % Number of bytes for Size field representation
Nfir = 20;                                  % Order of the FIR low-pass filter used for Rx downconvertion



%% CHECKS AND SECONDARY PARAMETERS

ResFctRF = osf*round(Fc*log2(M)/Rb);        % Upsampling factor at RF
Rs = Fc*osf/ResFctRF;                       % [S/s] Actual symbol rate (since at RF the ratio between Fc and Rs must be an integer!)
Rb = Rs*log2(M);                            % [b/s] Actual bit rate
Fs_RF = Rs*ResFctRF;                        % [Sa/s] Sample rate at RF for Tx and Rx
h = 2*dev/Rs;                               % Modulation index
bpb = 8;                                    % Number of bits per byte
SwLen = length(SyncWord)*bpb/2;             % Length (in symbols) of the SyncWord

CheckParam(h,Npreamb,SyncWord);             % Check validity of main paramenters and variables


%% FSK MODULATION

InBits = cell(length(Ninfo),1);
InSymbs = cell(length(Ninfo),1);
FskWaveRF = cell(length(Ninfo),1);

for j = 1:length(Ninfo)
    
    [InBits{j},InSymbs{j,:},GrayMtx] = BitSymbGen ...       % Generation of the Tx packet and Gray matrix
        (Ninfo(j),Npreamb,SyncWord);
    Time = 1/Fs_RF*(0:ResFctRF*length(InSymbs{j})-1);       % Time axis for FSK sample streams after RF upsampling
    FskSamps = repelem(InSymbs{j},ResFctRF);                % FSK symbols representing the instantaneous frequency shift in time
    FskWaveRF{j} = A*sin(2*pi*(Fc+FskSamps).*Time);         % FSK modulated waveform at RF
    
end


%% RX DEMODULATION AND RESULTS

ChanSymbs = [];
SampDelayMax = round(MaxDelay*Fs_RF);

for j = 1:length(Ninfo)
    ChanSymbs = awgn([ChanSymbs,zeros(1,randi([0 ...
        SampDelayMax])),FskWaveRF{j}],SNR,'measured');
end

RxSymbBB = DownConvertion(ChanSymbs,Nfir);                  % Downconvertion to baseband Fs of the received samples
RxSymbBB = [RxSymbBB,zeros(1,2*osf)];                       % Dummy samples padding at the end of sample stream

StateRx = 'WaitCS';                                         % Idle state of Rx state machine
DetPck = 0;                                                 % Overall number of packets correctly detected in Rx 
LenCS = SwLen+2;                                            % Length (in symbols) of the Carrier-Sense buffer
BufferCS = zeros(1,LenCS*osf);                              % Carries-sense buffer
ThrCS = A*LenCS*osf*0.9;                                    % BufferCS energy threshold to start packet decoding

while length(RxSymbBB) >= osf                               % Iterate until there are sample to be processed
    
    NewFetch = RxSymbBB(1:osf);                             % Latest fetch of samples received
    RxSymbBB(1:osf) = [];                                   % Remove the latest fetch from simulated Rx buffer
    
    BufferCS = [BufferCS(1+osf:end),NewFetch];
    EnergyCS = sum(abs(BufferCS));
    
    if EnergyCS < ThrCS/2                                   % If CS energy goes low, reset the SM
        
        StateRx = 'WaitCS';
        
    else
        
        switch StateRx
            
            case 'WaitCS'
                
                if EnergyCS > ThrCS
                    StateRx = 'SearchPreamble';             % If CS energy goes high, move to preamble handler
                end
                
            case 'SearchPreamble'
                
                SampShift = PrbSymbSync(BufferCS);          % Execute symbol synchronization by means of preamble
                StateRx = 'SearchSyncWord';
                
            case 'SearchSyncWord'                           % Search for the sync word to detect packet beginning

                SwTry = BufferCS(1+SampShift:SampShift+osf*SwLen);
                StateRx = SearchSyncWord(SwTry,SyncWord,'Non-Coherent');
                if strcmp(StateRx,'ReadSize')      
                    SizeField = struct('Buf',zeros(1,SizeDim*osf*bpb),'Len',0);
                    SizeField.Len = length(BufferCS)-(SampShift+osf*SwLen);
                    SizeField.Buf(1:SizeField.Len) = BufferCS(SampShift+osf*SwLen+1:end);
                end
                
            case 'ReadSize'
                
                if SizeField.Len+osf <= length(SizeField.Buf)
                    SizeField.Buf(1+SizeField.Len:SizeField.Len+osf) = NewFetch;
                    SizeField.Len = SizeField.Len+osf;
                    RemLastFetch = 0;
                else
                    RemLastFetch = length(SizeField.Buf)-SizeField.Len;
                    SizeField.Buf(1+SizeField.Len:end) = NewFetch(1:RemLastFetch);
                    SizeField.Len = SizeDim*bpb*osf;
                end

                if SizeField.Len == SizeDim*bpb*osf
                    PckLen = GetPckLen(SizeField.Buf,'Non-Coherent');
                    InfoField = struct('Buf',zeros(1,PckLen*osf),'Len',0);
                    SizeField.Len = 0;

                    if RemLastFetch > 0
                        InfoField.Len = length(NewFetch)-RemLastFetch;
                        InfoField.Buf(1:InfoField.Len) = NewFetch(RemLastFetch+1:end);
                    end

                    StateRx = 'GetPacketContent';
                end
                
                
            case 'GetPacketContent'
                
                if InfoField.Len+osf <= length(InfoField.Buf)
                    InfoField.Buf(1+InfoField.Len:InfoField.Len+osf) = NewFetch;
                    InfoField.Len = InfoField.Len+osf;
                else
                    RemLastFetch = length(InfoField.Buf)-InfoField.Len;
                    InfoField.Buf(1+InfoField.Len:end) = NewFetch(1:length(InfoField.Buf)-InfoField.Len);
                    InfoField.Len = PckLen*osf;
                end

                if InfoField.Len == PckLen*osf
                    OutBits = FreqDemodBB(InfoField.Buf,GrayMtx,'Non-Coherent');
                    DetPck = DetPck+1;
                    StateRx = 'WaitCS';
                    BufferCS = zeros(1,LenCS*osf);
                    fprintf(' Pck%d : Len = %d Symbols || Nerr = %d out of %d bits\n', ...
                    DetPck,PckLen,sum(InBits{DetPck,:}~=OutBits),Ninfo(DetPck)*log2(M));
                end
                
        end
        
    end
    
end



%% EXTRA FUNCTIONS

%%% --> Function to check the validity of initial parameters and variables.
function [ ] = CheckParam( ModIdx, PrbSymbs, SyncWord )

    global M
    
    if M < 2 || log2(M) ~= round(log2(M))
        error('Modulation order must be a power of 2 and greater than 1!')
    end
    
    if mod(PrbSymbs,2) ~= 0
        error('Number of preamble symbols must be even!')
    end
    
    if mod(length(SyncWord),2) ~= 0
        error('Number of sync word symbols must be multiple of 8!')
    end

    if 2*ModIdx ~= round(2*ModIdx)
        warning('Tone spacing does not provide orthogonality for either coherent or non-coherent detection!');
    elseif ModIdx ~= round(ModIdx)
        warning('Tone spacing does not provide orthogonality for non-coherent detection!');
    end

end


%%% --> Function to generate info symbol and bit sequences according to M-Gray coding and append
%%%     header (i.e. preamble, SyncWord and Size fields) to the packet. Header is always modulated
%%%     as a BFSK with deviation equal to the selected outer deviation (i.e. (M-1)*dev).
function [ SrcBits, SrcSymbs, GrayMtx ] = BitSymbGen( Ninfo, Nprb, SyncWord )

    global M dev SizeDim bpb;
    
    L = log2(M);                                        % Number of bits per symbol
    GrayMtx = zeros(M,L);                               % Gray mapping matrix
    LastCell = [0;1];
    GrayMtx(1:2,end) = LastCell;
    for i = 2:L
        GrayMtx(1+2^(i-1):2^i,end-i+2:end) = flipud(LastCell);
        GrayMtx (1+2^(i-1):2^i,end-i+1) = 1;
        LastCell = GrayMtx(1:2^i,end-i+1:end);
    end

    SrcSymbs = 2*randi([1 M],1,Ninfo)-M-1;              % Random generation of Tx symbol stream within the alphabet fixed by M
    SrcBits = zeros(1,L*length(SrcSymbs));              % Corresponding Tx bit stream
    for j = 1:length(SrcSymbs)
     SrcBits(1+(j-1)*L:j*L) = GrayMtx((SrcSymbs(j)+M+1)/2,:);
    end
    
    Preamble = reshape([(M-1)*ones(1,Nprb/2);(1-M)*ones(1,Nprb/2)],1,Nprb);
    SyncSymbs = (M-1)*(2*hexToBinaryVector(SyncWord)-1);
    LenSymbs = (M-1)*(2*de2bi(Ninfo,SizeDim*bpb,'left-msb')-1);
    SrcSymbs = [Preamble,SyncSymbs,LenSymbs,SrcSymbs];
    SrcSymbs = SrcSymbs*dev;                            % Multiply the integer symbols by the deviation value to get a value in Hz

end


%%% --> Function to downconvert the incoming RF waveform (I-Q mixing and low-pass
%%%     filtering) and downsample from RF to BB sample rate
function [ OutSamps ] = DownConvertion( InSamps, Nfir )

    global Fc Rs Fs_RF osf
    
    Fs_BB = Rs*osf;                                     % Baseband sample frequency in Rx
    Offset = 0;                                         % Offset (in samples) of the final downsampling step
    FirDelay = Nfir/2;                                  % Delay (in samples) introduced by the FIR LPF
    Wn = 1/Fs_BB;                                       % LPF cut-off frequency
    FirTaps = fir1(Nfir,Wn,'low');                      % Taps of the FIR LPF

    Time = 1/Fs_RF*(0:length(InSamps)-1);               % Time axis for mixing
    SampRF_I = 2*InSamps.*sin(2*pi*Fc.*Time);           % In-phase mixing
    SampRF_Q = 2*InSamps.*sin(2*pi*Fc.*Time-pi/2);      % Quadrature mixing
    SymbBB = filter(FirTaps,1,[SampRF_I+ ...            % Low-pass filtering
        1i*SampRF_Q zeros(1,FirDelay)]);
    OutSamps = downsample(SymbBB,round(Fc/Rs),Offset);  % Downsampling BB Fs (to ease computational complexity)

end


%%% --> Function to execute synchronization on the incoming sample stream
%%%     by means of the preamble knowledge
function SampShift = PrbSymbSync( InSamp )

    global M Rs dev osf
    
    LenPreamb = 8;                                      % Preamble length for synchronization research
    Fs_BB = Rs*osf;                                     % Baseband sample frequency in Rx
    Time = 1/Fs_BB*(0:LenPreamb*osf-1);
    FreqSeq = dev*reshape([(M-1)*ones(osf,LenPreamb/2);(1-M)*ones(osf,LenPreamb/2)],1,osf*LenPreamb);
    CorSgn = exp(-1i*2*pi*FreqSeq.*Time);

    MeanError = zeros(1,osf);
    for j = 0:2*osf-1  
        SampSeq = InSamp(1+j:LenPreamb*osf+j);
        MeanError(j+1) = sum(abs(SampSeq-CorSgn));
    end
    
    [~,IdxMax] = min(MeanError);
    SampShift = IdxMax-1;

end


%%% --> Function to search the SyncWord and detect the beginning of the packet
function NewRxState = SearchSyncWord( InSamps, SyncWord, Mode )

    global M dev Rs osf bpb

    if strcmp(Mode,'Non-Coherent')
        
        Fs_BB = Rs*osf;                                 % Baseband sample frequency in Rx
        Nsw = length(SyncWord)*bpb/2;                   % Length (in bits/symbols) of the SyncWord field
        FreqDev =  dev*[1-M,M-1];                       % Frequency deviation (in Hz) of SyncWord symbols
        Time = 1/Fs_BB*(0:length(InSamps)-1);           % Time axis for correlators
        IntVias = zeros(2,Nsw);                         % Matrix of the integrators output for all vias
    
        for j = 1:2
            CorSgn = exp(1i*2*pi*FreqDev(j)*Time);
            CorVias = InSamps.*CorSgn;          
            IntVias(j,:) = sum(reshape(CorVias,osf,Nsw));
        end
        [~,IdxMax] = max(abs(IntVias));                 % Choose the via with maximum energy during each symbol time
        
        DecBits = IdxMax-1;
        if DecBits == hexToBinaryVector(SyncWord)
           NewRxState = 'ReadSize';
        else
            NewRxState = 'SearchSyncWord';
        end
        
    else
        error('Invalid demodulation mode!')
    end
    
end


%%% --> Function to estamate the length of the deteted packet by reading
%%%     the corresponding Size field
function PckLen = GetPckLen( InSamps, Mode )

    global M dev Rs osf bpb SizeDim
    
    if strcmp(Mode,'Non-Coherent')
        
        Fs_BB = Rs*osf;                                 % Baseband sample frequency in Rx
        Nlen = SizeDim*bpb;                              % Length (in bits/symbols) of the Length field
        FreqDev = dev*[1-M,M-1];                        % Frequency deviation (in Hz) of Length symbols
        Time = 1/Fs_BB*(0:length(InSamps)-1);           % Time axis for correlators
        IntVias = zeros(2,Nlen);                        % Matrix of the integrators output for all vias
    
        for j = 1:2
            CorSgn = exp(1i*2*pi*FreqDev(j)*Time);
            CorVias = InSamps.*CorSgn;
            IntVias(j,:) = sum(reshape(CorVias,osf,Nlen));
        end
        
        [~,IdxMax] = max(abs(IntVias));                 % Choose the via with maximum energy during each symbol time
        DecBits = IdxMax-1;
        PckLen = bi2de(DecBits,'left-msb');
        
    else
        error('Invalid demodulation mode!')
    end

end


%%% --> Function to demodulate frequency modulated symbols at BB (using energy
%%%     detectors with correlators as matched filters and Gray demapping).
function [ OutBits ] = FreqDemodBB( InSamps, GrayMtx, Mode )

    global M dev Rs osf
    
    if strcmp(Mode,'Non-Coherent')

        Nsymbs = length(InSamps)/osf;                   % Number of symbols from the input sample stream
        Fs_BB = Rs*osf;                                 % Baseband sample frequency in Rx
        L = log2(M);                                    % Number of bits per symbol
        FreqDev =  dev*(2*(1:M)-M-1);                   % Possible deviation values (in Hz) 
        Time = 1/Fs_BB*(0:length(InSamps)-1);           % Time axis for correlators
        IntVias = zeros(M,Nsymbs);                      % Matrix of the integrators output for all vias

        for j = 1:M
            CorSgn = exp(1i*2*pi*FreqDev(j)*Time);
            CorVias = InSamps.*CorSgn;
            IntVias(j,:) = sum(reshape(CorVias,osf,Nsymbs));
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
