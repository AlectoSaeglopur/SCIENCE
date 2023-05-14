
%%% Title: M-PSK MAPPER AND HARD/SOFT DEMAPPER WITH GRAY AND CONVOLUTIONAL CODING
%%% Author: Filippo Valmori
%%% Date: 20/11/2018
%%% Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Phase-shift_keying
%%%            [2] MathWorks - https://it.mathworks.com/help/comm/ug/phase-modulation.html#responsive_offcanvas

close all; clearvars; clc

global M


%% SIMULATION #1 - SINGLE RUN PERFORMANCE OVER AWGN CHANNEL

Nbits = 1000;                                                           % Number of info bits to be simulated
EbN0 = 20;                                                              % [dB] Energy-per-bit-to-noise-power-spectral-density ratio over AWGN channel
M = 4;                                                                  % Modulation order
PhOfst = pi/M;                                                          % Constellation phase offset
K = 5;                                                                  % Constrain length
Rc = '1/2';                                                             % Code rate
MemFct = 5;                                                             % Memory factor of Viterbi decoder
DecMet = 'Soft';                                                        % Decoding method in Rx

CheckParam(Nbits);                                                      % Check parameters correctness
ModTable = GetPskTable(PhOfst);                                         % Get PSK mapping table (with Gray coding)
[Trellis,ConVect,PunctVect] = GetCodeInfo(K,Rc,DecMet);                 % Retrieve convolutional coding info
TxInfoBits = randi([0 1],1,Nbits);                                      % Tx info bits egneration
EncBits = ConvEncoder(TxInfoBits,ConVect,PunctVect);                    % Convolutional encoding
TxSymbs = Mapper(EncBits,ModTable);                                     % PSK mapping
SNR = EbN0+10*log10(log2(M));                                           % [dB] Signal-to-noise ratio conversion
RxSymbs = awgn(TxSymbs,SNR,'measured');                                 % AWGN channel simulation
DemBits = Demapper(RxSymbs,ModTable,DecMet);                            % Demodulated bits (hard or soft according to DecMet)
RxInfoBits = ConvDecoder(DemBits,Trellis,MemFct,PunctVect,DecMet);      % Final info bits in Rx
Nerr = sum(TxInfoBits~=RxInfoBits);                                     % Check the number of corrupted bits

fprintf(" Number of errors = %d out of %d\n",Nerr,Nbits);
blue = [0 .5 1];
figure; box on; hold on
plot(real(RxSymbs),imag(RxSymbs),'*','Color',blue)
plot(real(TxSymbs),imag(TxSymbs),'r.','MarkerSize',20)
title(sprintf('%d-PSK CONSTELLATION',M)); axis(1.5*[-1 1 -1 1])
xlabel('In-phase'); ylabel('Quadrature'); legend('Noisy','Ideal')
hold off


%% SIMULATION #2 - PERFORMANCE COMPARISON AS A FUNCTION OF THE DECODING METHOD

M = 4;                                                                  % Modulation order
PhOfst = pi/M;                                                          % Constellation phase offset
Nbits = 3000;                                                           % Number of processed bits per cycle
MinErr = 350;                                                           % Base of the minimum number of errors for BER estimate
MemFct = 5;                                                             % Memory factor (the higher, the larger the memory allocated for storing survivor paths history)
Rc = '1/2';                                                             % Code rate
K = 5;                                                                  % Constrain length
InitEbN0 = -2;                                                          % [dB] Starting value of Eb/N0
StepEbN0 = 0.5;                                                         % [dB] Incremental step for Eb/N0
if M == 2 || M == 4 
    FinEbN0 = [8.5 3.5 1.5];                                            % [dB] Ending value of Eb/N0
elseif M == 8
    FinEbN0 = [12 6 4];
end
DecMode = {'Uncoded','Hard','Soft'};

CheckParam(Nbits);
ModTable = GetPskTable(PhOfst);
LenDM = length(DecMode);
BER = cell(1,LenDM);

for i = 1:LenDM
    
    if i > 1
        [Trellis,ConVect,PunctVect] = GetCodeInfo(K,Rc,DecMode{i});
    end
    
    EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
    LenEbN0 = length(EbN0);
    BER{i} = zeros(1,LenEbN0);
    
    for j = 1:LenEbN0
        
        Nerr = 0;                                                       % Error counter
        Ncycles = 0;                                                    % Cycle counter
        SNR = EbN0(j)+10*log10(log2(M));                                % Signal-to-noise ratio over AWGN channel
        
        while Nerr < MinErr*(LenEbN0-j+1)                               % Lower Eb/N0 require greater number of errors to get a reliable statistic
            
            Ncycles = Ncycles+1;
            TxInfoBits = randi([0 1],1,Nbits);                          % Random generation of uncoded bits
            
            if i > 1
                EncBits = ConvEncoder(TxInfoBits,ConVect,PunctVect);
                TxSymbs = Mapper(EncBits,ModTable);
                RxSymbs = awgn(TxSymbs,SNR,'measured');
                DemBits = Demapper(RxSymbs,ModTable,DecMode{i});
                RxInfoBits = ConvDecoder(DemBits,Trellis,MemFct,PunctVect,DecMode{i});
                Nerr = Nerr+sum(TxInfoBits~=RxInfoBits);
            else                                                        % i.e. the uncoded case
                TxSymbs = Mapper(TxInfoBits,ModTable);
                RxSymbs = awgn(TxSymbs,SNR,'measured');
                RxInfoBits = Demapper(RxSymbs,ModTable,'Hard');
                Nerr = Nerr+sum(TxInfoBits~=RxInfoBits);
            end
            
        end
        
        BER{i}(j) = Nerr/(Ncycles*Nbits);
        
    end   
    
end

markers = {'-x','-*','-o'};
labels = [{' Uncoded'};{' Hard Viterbi'};{' Soft Viterbi'}];
colors = {[.2 .2 1];[.2 .8 .2];[1 .2 0]};
figure
for i = 1:LenDM
    EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
    semilogy(EbN0,BER{i},markers{i},'Color',colors{i});
    hold on
end
xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
title(sprintf('Performance comparison for %d-PSK',M))
xticks(floor(InitEbN0):ceil(max(FinEbN0)))
axis([floor(InitEbN0)-0.5 ceil(max(FinEbN0))+0.5 0.99e-5 1])
grid on; hold off



%% SIMULATION #3 - PERFORMANCE COMPARISON AS A FUNCTION OF THE MODULATION ORDER

% % Nbits = 3000;                                                           % Number of processed bits per cycle
% % MinErr = 300;                                                           % Base of the minimum number of errors for BER estimate
% % InitEbN0 = -2;                                                          % [dB] Starting value of Eb/N0
% % StepEbN0 = 1;                                                           % [dB] Incremental step for Eb/N0
% % FinEbN0 = [9 9 12 17 22];                                               % [dB] Ending value of Eb/N0
% % VectM = [2 4 8 16 32];
% % LenM = length(VectM);
% % BER = cell(1,LenM);
% % 
% % for i = 1:LenM
% %     
% %     M = VectM(i);                                                       % Modulation order
% %     PhOfst = pi/M;                                                      % Constellation phase offset
% %     CheckParam(Nbits);
% %     PskTable = GetPskTable(PhOfst);
% %     
% %     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
% %     LenEbN0 = length(EbN0);
% %     BER{i} = zeros(1,LenEbN0);
% %     
% %     for j = 1:LenEbN0
% %         
% %         Nerr = 0;                                                       % Error counter
% %         Ncycles = 0;                                                    % Cycle counter
% %         SNR = EbN0(j)+10*log10(log2(M));                                % Signal-to-noise ratio over AWGN channel
% %         
% %         while Nerr < MinErr*(LenEbN0-j+1)                               % Lower Eb/N0 require greater number of errors to get a reliable statistic
% %             
% %             Ncycles = Ncycles+1;
% %             TxInfoBits = randi([0 1],1,Nbits);                          % Random generation of uncoded bits
% %             TxSymbs = Mapper(TxInfoBits,PskTable);
% %             RxSymbs = awgn(TxSymbs,SNR,'measured');
% %             RxInfoBits = Demapper(RxSymbs,PskTable,'Hard');
% %             Nerr = Nerr+sum(TxInfoBits~=RxInfoBits);
% %             
% %         end
% %         
% %         BER{i}(j) = Nerr/(Ncycles*Nbits);
% %         
% %     end   
% %     
% % end
% % 
% % markers = {'-o','-*','-x','-^','-p'};
% % labels = [{' 2-PSK'};{' 4-PSK'};{' 8-PSK'};{' 16-PSK'};{' 32-PSK'}];
% % colors = {[.2 .2 1],[.2 .8 .2],[1 .6 .2],[1 0 0],[0 .8 .8]};
% % 
% % figure
% % for i = 1:LenM
% %     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
% %     semilogy(EbN0,BER{i},markers{i},'Color',colors{i});
% %     hold on
% % end
% % 
% % xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
% % title('Performance comparison as a function of M')
% % xticks(floor(InitEbN0):2:ceil(max(FinEbN0)))
% % axis([floor(InitEbN0)-1 ceil(max(FinEbN0))+1 0.99e-5 1])
% % grid on; hold off



%% PSK MAPPING FUNCTIONS

%%% --> Function for checking the parameters correctness
function [ ] = CheckParam( Nbits )
    
    global M

    if log2(M) ~= round(log2(M)) || M < 2
        error('Invalid modulation order (M)');
    elseif Nbits/log2(M) ~= round(Nbits/log2(M))
        error('Invalid number of info bits (Nbits)');
    end
    
end


%%% --> Function for getting an M-sequence of Gray coded decimal numbers
function [ GrayMtx ] = GetGray( )

    global M
    
    L = log2(M);                                                        % Number of bits per symbol
    GrayMtx = zeros(M,L);                                               % Gray mapping matrix
    LastCell = [0;1];
    GrayMtx(1:2,end) = LastCell;
    for i = 2:L
        GrayMtx(1+2^(i-1):2^i,end-i+2:end) = flipud(LastCell);
        GrayMtx (1+2^(i-1):2^i,end-i+1) = 1;
        LastCell = GrayMtx(1:2^i,end-i+1:end);
    end

end


%%% --> Function for getting the mapping table between bit sets and
%%%     PSK symbols according to Gray Coding
function Table = GetPskTable( PhOfst )

    global M
    
    GrayMtx = GetGray();
    Table = struct('Bits',zeros(1,M),'Symbs',zeros(1,M));
    for j = 1:M
        Table.Bits(j) = bi2de(GrayMtx(j,:),'left-msb');
        Table.Symbs(j) = exp(1i*(PhOfst+2*pi*(j-1)/M));    
    end

end


%%% --> Function for mapping an input bit stream into the constellation
%%%     symbols specified by Table
function [ OutSymbs ] = Mapper( InBits, Table )

    global M
    
    L = log2(M);                                                        % Number of bits per symbol
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
    
end


%%% --> Function for demapping an input symbol stream into bits (hard or soft)
%%%     accordig to the specified mapping table
function [ OutBits ] = Demapper( InSymbs, Table, DecMode )

    global M
    
    L = log2(M);                                                        % Number of bits per symbol
    InLen = length(InSymbs);
    OutBits = zeros(1,InLen*L);                                         % Output bits (in antipodal form in case of soft-decoding)
    
    if strcmp(DecMode,'Hard')
        
        for k = 1:InLen
            Dist = abs(real(InSymbs(k))-real(Table.Symbs))+ ...
                abs(imag(InSymbs(k))-imag(Table.Symbs));
            [~,MinIdx] = min(Dist);
            OutBits(1+(k-1)*L:k*L) = de2bi(Table.Bits(MinIdx),L,'left-msb');
        end
        
    elseif strcmp(DecMode,'Soft')                                       % Soft using log-likeliood alg (LLR)
        
        if M == 2
            OutBits = InSymbs*1i;
        else
            N0 = 4;                                                     % Assumed noise variance in linear (i.e. 6 dB)
            for k = 1:InLen
                    Dist = exp(-((real(InSymbs(k))-real(Table.Symbs)).^2+ ...
                        (imag(InSymbs(k))-imag(Table.Symbs)).^2)/N0);
                    for i = 1:L
                        Num = 0;
                        Den = 0;
                        for j = 1:M
                            if bitget(Table.Bits(j),i) == 1
                                Num = Num+Dist(j);
                            else
                                Den = Den+Dist(j);
                            end
                        end
                        OutBits(L-i+1+(k-1)*L) = N0/2*log(Num/Den);     % LLR value, i.e. soft bit
                    end
            end
        end

    else
        error('Invalid decoding method (DecMode)');
        
    end
    
end



%% EXTRA FUNCTIONS

%%% --> Function for getting connector vectors, trellis diagram and puncturing
%%%     vector of the code as a function of K and Rc
function [ Trellis, ConVect, PunctVect ] = GetCodeInfo( ConstLen, CodeRate, DecMode )

    switch ConstLen                                                 % Association between selected K and connector vectors
        case 3
            ConVect = [1 1 1; 1 0 1];
        case 4
            ConVect = [1 1 1 1; 1 0 1 1];
        case 5
            ConVect = [1 0 1 1 1; 1 1 0 0 1];
        case 6
            ConVect = [1 0 1 1 1 1; 1 1 0 1 0 1];
        case 7
            ConVect = [1 0 0 1 1 1 1; 1 1 0 1 1 0 1];
        case 8
            ConVect = [1 0 0 1 1 1 1 1; 1 1 1 0 0 1 0 1];
        otherwise
            error('Invalid constrain length K');
    end
        
    Nst = 2^(ConstLen-1);                                           % Number of trellis diagram states
    StBin = fliplr(de2bi(0:Nst-1,ConstLen-1));                      % States ID in binary (equal to its value in decimal -1)

    Trellis = cell(Nst,2);                                          % i-th row: i-th state | 1st and 2nd cell : output bits and new state(if input is 0 or 1)
    for j = 1:Nst

        CurSt = StBin(j,:);                                         % Current trellis state

        State0 = [0 CurSt];                                         % Case where new input bit is 0
        NewSt0 = State0(1:ConstLen-1);                              % New state (for 0-bit input)
        Out0 = mod(sum((State0.*ConVect).'),2);                     % Output bits (for 0-bit input)
        if strcmp(DecMode,'Soft')
            Out0 = 2*Out0-1;
        end

        State1 = [1 CurSt];                                         % Case where new input bit is 1
        NewSt1 = State1(1:ConstLen-1);                              % New state (for 1-bit input)
        Out1 = mod(sum((State1.*ConVect).'),2);                     % Output bits (for 1-bit input)
        if strcmp(DecMode,'Soft')
            Out1 = 2*Out1-1;
        end

        Trellis{j,1} = [Out0;Out1];                                 % Save output bits for both input cases
        Trellis{j,2} = bi2de([NewSt0;NewSt1], ...
            'left-msb')+1;

    end
    
    switch CodeRate                                                 % Puncturing vectors (from NASA standard)
        case '1/2'
            PunctVect = [1 1];
        case '2/3'
            PunctVect = [1 1 0 1];
        case '3/4'
            PunctVect = [1 1 0 1 1 0];
        case '5/6'
            PunctVect = [1 1 0 1 1 0 0 1 1 0];
        otherwise
            error('Invalid code rate Rc');
    end

end


%%% --> Function to encode the incoming bit stream using the defined connections
function [ OutBits ] = ConvEncoder( InBits, ConVect, PunctVect )

    InLen = length(InBits);
    k = length(PunctVect)/2;                                        % Expected "k" (from selected Rc = k/n) after puncturing
    if mod(InLen,k) ~= 0
        error('Input bit stream length must be multiple of k (from Rc = k/n)')
    end

    [n,K] = size(ConVect);                                          % Retrieve unpunctured "n" (always 2 here) and "K" values
    EncState = zeros(1,K);                                          % State of the encoder
    OutLen = n*InLen;                                               % Output bit stream length
    OutBits = zeros(1,OutLen);
    
    for j = 1:InLen                                                 % Compute convolutional encoding without puncturing (Rc = 1/2)
        EncState(2:K) = EncState(1:K-1);
        EncState(1) = InBits(j);
        OutBits(1+(j-1)*n:j*n) = mod(sum((EncState.*ConVect).'),2);
    end
    
    PunctIdx = find(PunctVect==0);
    if ~isempty(PunctIdx)                                           % Compute puncturing if desired Rc ~= 1/2
        Ncols = k*n;
        Nrows = OutLen/Ncols;
        OutMtx = reshape(OutBits,[Ncols,Nrows]).';
        OutMtx(:,PunctIdx) = [];
        OutBits = reshape(OutMtx.',[1,OutLen-Nrows*length(PunctIdx)]);
    end
    
end


%%% --> Function for hard/soft-decoding (Viterbi algorithm) the incoming stream employing the trellis
%%%     diagram and the memory factor specified as input arguments [NB: InStream must be made up of
%%%     bits for hard-decoding and of symbols for soft-decoding]
function [ OutBits ] = ConvDecoder( InStream, Trellis, MemFct, PunctVect, Mode )
    
    n = sum(PunctVect);                                             % Retrieve value of punctured "n" (from Rc = k/n)
    if mod(length(InStream),n) ~= 0
        error('Length of the bit stream to be decoded must be multiple of n (from Rc = k/n)')
    elseif ~(strcmp(Mode,'Hard') || strcmp(Mode,'Soft'))
        error('Invalid decoding method');
    end
    
    if ~isempty(find(PunctVect==0,1))                               % Check if puncturing is present [~isempty(find(PunctMtx==0))]
        InStream = PunctDec(InStream,PunctVect);                    % Restore removed bits as erasure symbols (-1)
    end
    
    Nst = size(Trellis,1);                                          % Number of trellis diagram states 
    n = size(Trellis{1,1},2);                                       % Unpunctured value of n (i.e. 2, since original Rc is always 1/2)
    OutLen = length(InStream)/n;                                    % Decoded bit stream length
    OutBits = zeros(1,OutLen);
    MemDim = MemFct*Nst;                                            % Memory dimension (maximum number of previous states for survivor paths representation)
    
    CurPaths = {-ones(Nst,1),zeros(Nst,1), ...                      % i-th row: i-th state info | 1st cell: iteration step | 2nd cell: distance | 3rd cell: path history 
        zeros(Nst,MemDim)};                                         % 2nd column : survivor path distance | 3rd column : previous states within survivor path
    CurPaths{1}(1) = 0;                                             % Enable only the all-zero state for the beginning of decoding
    
    for i = 1:OutLen
        
        CycleBits = InStream(1+n*(i-1):n*i);                        % Input symbols at i-th iteration
        NotErasIdx = ~isnan(CycleBits);                             % Consider only non-erasure bits for distance estimate
        PrevPaths = CurPaths;

        for j = 1:Nst                                               % For-loop over the trellis states

            if PrevPaths{1}(j) == i-1                               % Check if j-th state was active in the previous iteration

                for HypIdx = 1:2                                    % HypIdx = 1 means computing new path hypothesizing an incoming uncoded bit = 0 (and incoming uncoded bit = 1 for HypIdx = 2)

                    if strcmp(Mode,'Hard')
                        Dist = sum(CycleBits(NotErasIdx)~=Trellis{j,1}(HypIdx,NotErasIdx));         % Hamming distance at j-th departure state assuming HypIdx incoming bit
                    else
                        Dist = sum(abs(CycleBits(NotErasIdx)-Trellis{j,1}(HypIdx,NotErasIdx)));     % Euclidean distance at j-th departure state assuming HypIdx incoming bit
                    end
                    NextSt = Trellis{j,2}(HypIdx);                                                  % New state assuming incoming bit fixed by HypIdx

                    if CurPaths{1}(NextSt) < i                                              % If first survivor path computed to NextSt, save its info
                        CurPaths{1}(NextSt) = i;                                            % Update NextState iteration step
                        CurPaths{2}(NextSt) = PrevPaths{2}(j)+Dist;                         % Update NextState distance
                        if i < MemDim
                            WrIdx = i;
                        else
                            WrIdx = MemDim;
                        end
                        CurPaths{3}(NextSt,1:WrIdx) = [PrevPaths{3}(j,1:WrIdx-1),j];        % Store new survivor path for NewState

                    else                                                                    % If there is already a survivor path for NextState
                        CandDistance = PrevPaths{2}(j)+Dist;                                % Distance of the new candidate for NextStateo survivor path
                        if CandDistance < CurPaths{2}(NextSt)                               % If new candidate distante is better, update the survivor path info
                            CurPaths{2}(NextSt) = CandDistance;
                            if i < MemDim
                                WrIdx = i;
                            else
                                WrIdx = MemDim;
                            end
                            CurPaths{3}(NextSt,1:WrIdx) = [PrevPaths{3}(j,1:WrIdx-1),j];          
                        end
                    end
                end
            end
        end
        
        if i == OutLen                                              % Check whether input bit stream is over, if so retrieve the uncoded bit by flushing the memory
            
            [~,MinIdx] = min(CurPaths{2});                          % Final minimum distance survivor path (MDSP)
            
            if i >= MemDim                                          % Check if memory has been completely filled to set the final index for memory flushing
                IdxFin = MemDim;
            else                                                    % i.e. if input bit stream length is so short that doesn't even fill the memory
                IdxFin = i;
            end
            
            for j = 1:IdxFin
                StateDep = CurPaths{3}(MinIdx,j);                   % Departure state for the computation of output bit
                if j == IdxFin
                    StateArr = MinIdx;
                else
                    StateArr = CurPaths{3}(MinIdx,j+1);             % Arrival state for the computation of output bit
                end
                if Trellis{StateDep,2}(2) == StateArr               % else if ~=, then FinalBits(j) = 0;
                    OutBits(end-IdxFin+j) = 1;
                end
            end
            
        elseif i >= MemDim                                          % If input bit stream is not over yet, check if memory is full
            
            [~,MinIdx] = min(CurPaths{2});                          % MDSP so far
            StateDep = CurPaths{3}(MinIdx,1);                       % Departure state for the computation of output bit (the oldest state of the MDSP)
            StateArr = CurPaths{3}(MinIdx,2);                       % Arrival state for the computation of output bit
            
            if Trellis{StateDep,2}(2) == StateArr                   % else if ~=, then OutBit = 0;
                OutBits(1+i-MemDim) = 1;
            end
            
            CurPaths{3}(:,1:MemDim-1) = CurPaths{3}(:,2:MemDim);    % Remove the oldest state of each survivor path from memory
            
        end

    end
    
end


%%% --> Function for reconstructing the original coded stream without puncturing (Rc = 1/2), where
%%%     the erasure bits/symbols are inserted as NaN in the location specified by PunctVect
function [OutBits] = PunctDec( InBits, PunctVect )

    NcolsIn = sum(PunctVect);
    Nrows = length(InBits)/NcolsIn;
    InMtx = reshape(InBits,[NcolsIn,Nrows]).';
    NcolsOut = length(PunctVect);
    
    OutMtx = NaN(Nrows,NcolsOut);
    IdxWr = 1;
    for j = 1:NcolsOut
        if PunctVect(j) == 1
            OutMtx(:,j) = InMtx(:,IdxWr);
            IdxWr = IdxWr+1;
        end
    end

    OutBits = reshape(OutMtx.',[1,Nrows*NcolsOut]);

end

