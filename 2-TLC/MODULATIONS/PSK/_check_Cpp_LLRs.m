
%%% Title: M-PSK MAPPER AND HARD/SOFT DEMAPPER + GRAY AND CONVOLUTIONAL CODING
%%% Author: Filippo Valmori
%%% Date: 20/11/2018
%%% Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Phase-shift_keying
%%%            [2] MathWorks - https://it.mathworks.com/help/comm/ug/phase-modulation.html#responsive_offcanvas


close all; clearvars; clc

global M


%% SIMULATION #1 - SINGLE RUN PERFORMANCE OVER AWGN CHANNEL

M = 16;                                                              % Modulation order
PhOfst = pi/M;                                                      % Constellation phase offset

Data = csvread('CpxSymbs.csv');
CppSymbs = Data(1:2:end-1)+1i*Data(2:2:end);
PskTable = GetPskTable(PhOfst);
DemBits = Demapper(CppSymbs,PskTable,'Soft')

% [Trellis,ConVect,PunctVect] = GetCodeInfo(K,Rc,DecMode);
% InfoBits = randi([0 1],1,Nbits);
% EncBits = ConvEncoder(InfoBits,ConVect,PunctVect);
% MapSymbs = Mapper(EncBits,PskTable);
% ChanSymbs = awgn(MapSymbs,SNR,'measured');
% DemBits = Demapper(ChanSymbs,PskTable,DecMode);
% DecBits = ConvDecoder(DemBits,Trellis,MemFct,PunctVect,DecMode);
% Nerr = sum(InfoBits~=DecBits);
% 
% fprintf(" Number of errors = %d out of %d\n",Nerr,Nbits);
% blue = [0 .5 1];
% figure; box on; hold on
% plot(real(ChanSymbs),imag(ChanSymbs),'*','Color',blue)
% plot(real(MapSymbs),imag(MapSymbs),'r.','MarkerSize',20)
% title(sprintf('%d-PSK CONSTELLATION',M)); axis(1.5*[-1 1 -1 1])
% xlabel('In-phase'); ylabel('Quadrature'); legend('Noisy','Ideal')
% hold off



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
    
    L = log2(M);                                                    % Number of bits per symbol
    GrayMtx = zeros(M,L);                                           % Gray mapping matrix
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
    
    L = log2(M);                                                    % Number of bits per symbol
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
    
    L = log2(M);                                                    % Number of bits per symbol
    InLen = length(InSymbs);
    OutBits = zeros(1,InLen*L);                                     % Output bits (in antipodal form in case of soft-decoding)
    
    if strcmp(DecMode,'Hard')
        
        for k = 1:InLen
            Dist = abs(real(InSymbs(k))-real(Table.Symbs))+ ...
                abs(imag(InSymbs(k))-imag(Table.Symbs));
            [~,MinIdx] = min(Dist);
            OutBits(1+(k-1)*L:k*L) = de2bi(Table.Bits(MinIdx),L,'left-msb');
        end
        
    elseif strcmp(DecMode,'Soft')                       % Soft using log-likeliood alg (LLR)
        
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
                        OutBits(L-i+1+(k-1)*L) = N0/2*log(Num/Den);
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

    switch ConstLen                                     % Association between selected K and connector vectors
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
        
    Nst = 2^(ConstLen-1);                               % Number of trellis diagram states
    StBin = fliplr(de2bi(0:Nst-1,ConstLen-1));          % States ID in binary (equal to its value in decimal -1)

    Trellis = cell(Nst,2);                              % i-th row: i-th state | 1st and 2nd cell : output bits and new state(if input is 0 or 1)
    for j = 1:Nst

        CurSt = StBin(j,:);                             % Current trellis state

        State0 = [0 CurSt];                             % Case where new input bit is 0
        NewSt0 = State0(1:ConstLen-1);                  % New state (for 0-bit input)
        Out0 = mod(sum((State0.*ConVect).'),2);         % Output bits (for 0-bit input)
        if strcmp(DecMode,'Soft')
            Out0 = 2*Out0-1;
        end

        State1 = [1 CurSt];                             % Case where new input bit is 1
        NewSt1 = State1(1:ConstLen-1);                  % New state (for 1-bit input)
        Out1 = mod(sum((State1.*ConVect).'),2);         % Output bits (for 1-bit input)
        if strcmp(DecMode,'Soft')
            Out1 = 2*Out1-1;
        end

        Trellis{j,1} = [Out0;Out1];                     % Save output bits for both input cases
        Trellis{j,2} = bi2de([NewSt0;NewSt1], ...
            'left-msb')+1;

    end
    
    switch CodeRate                                     % Puncturing vectors (from NASA standard)
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
    k = length(PunctVect)/2;                            % Expected "k" (from selected Rc = k/n) after puncturing
    if mod(InLen,k) ~= 0
        error('Input bit stream length must be multiple of k (from Rc = k/n)')
    end

    [n,K] = size(ConVect);                              % Retrieve unpunctured "n" (always 2 here) and "K" values
    EncState = zeros(1,K);                              % State of the encoder
    OutLen = n*InLen;                                   % Output bit stream length
    OutBits = zeros(1,OutLen);
    
    for j = 1:InLen                                     % Compute convolutional encoding without puncturing (Rc = 1/2)
        EncState(2:K) = EncState(1:K-1);
        EncState(1) = InBits(j);
        OutBits(1+(j-1)*n:j*n) = mod(sum((EncState.*ConVect).'),2);
    end
    
    PunctIdx = find(PunctVect==0);
    if ~isempty(PunctIdx)                               % Compute puncturing if desired Rc ~= 1/2
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
    
    n = sum(PunctVect);                                 % Retrieve value of punctured "n" (from Rc = k/n)
    if mod(length(InStream),n) ~= 0
        error('Length of the bit stream to be decoded must be multiple of n (from Rc = k/n)')
    elseif ~(strcmp(Mode,'Hard') || strcmp(Mode,'Soft'))
        error('Invalid decoding method');
    end
    
    if ~isempty(find(PunctVect==0,1))                   % Check if puncturing is present [~isempty(find(PunctMtx==0))]
        InStream = PunctDec(InStream,PunctVect);        % Restore removed bits as erasure symbols (-1)
    end
    
    Nst = size(Trellis,1);                              % Number of trellis diagram states 
    n = size(Trellis{1,1},2);                           % Unpunctured value of n (i.e. 2, since original Rc is always 1/2)
    OutLen = length(InStream)/n;                        % Decoded bit stream length
    OutBits = zeros(1,OutLen);
    MemDim = MemFct*Nst;                                % Memory dimension (maximum number of previous states for survivor paths representation)
    
    CurPaths = {-ones(Nst,1),zeros(Nst,1), ...          % i-th row: i-th state info | 1st cell: iteration step | 2nd cell: distance | 3rd cell: path history 
        zeros(Nst,MemDim)};                             % 2nd column : survivor path distance | 3rd column : previous states within survivor path
    CurPaths{1}(1) = 0;                                 % Enable only the all-zero state for the beginning of decoding
    
    for i = 1:OutLen
        
        CycleBits = InStream(1+n*(i-1):n*i);            % Input symbols at i-th iteration
        NotErasIdx = ~isnan(CycleBits);                 % Consider only non-erasure bits for distance estimate
        PrevPaths = CurPaths;

        for j = 1:Nst                                   % For-loop over the trellis states

            if PrevPaths{1}(j) == i-1                   % Check if j-th state was active in the previous iteration

                for HypIdx = 1:2                        % HypIdx = 1 means computing new path hypothesizing an incoming uncoded bit = 0 (and incoming uncoded bit = 1 for HypIdx = 2)

                    if strcmp(Mode,'Hard')
                        Dist = sum(CycleBits(NotErasIdx)~=Trellis{j,1}(HypIdx,NotErasIdx));        % Hamming distance at j-th departure state assuming HypIdx incoming bit
                    else
                        Dist = sum(abs(CycleBits(NotErasIdx)-Trellis{j,1}(HypIdx,NotErasIdx)));    % Euclidean distance at j-th departure state assuming HypIdx incoming bit
                    end
                    NextSt = Trellis{j,2}(HypIdx);                                          % New state assuming incoming bit fixed by HypIdx

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
        
        if i == OutLen                                      % Check whether input bit stream is over, if so retrieve the uncoded bit by flushing the memory
            
            [~,MinIdx] = min(CurPaths{2});                  % Final minimum distance survivor path (MDSP)
            
            if i >= MemDim                                  % Check if memory has been completely filled to set the final index for memory flushing
                IdxFin = MemDim;
            else                                            % i.e. if input bit stream length is so short that doesn't even fill the memory
                IdxFin = i;
            end
            
            for j = 1:IdxFin
                StateDep = CurPaths{3}(MinIdx,j);           % Departure state for the computation of output bit
                if j == IdxFin
                    StateArr = MinIdx;
                else
                    StateArr = CurPaths{3}(MinIdx,j+1);     % Arrival state for the computation of output bit
                end
                if Trellis{StateDep,2}(2) == StateArr       % else if ~=, then FinalBits(j) = 0;
                    OutBits(end-IdxFin+j) = 1;
                end
            end
            
        elseif i >= MemDim                                  % If input bit stream is not over yet, check if memory is full
            
            [~,MinIdx] = min(CurPaths{2});                  % MDSP so far
            StateDep = CurPaths{3}(MinIdx,1);               % Departure state for the computation of output bit (the oldest state of the MDSP)
            StateArr = CurPaths{3}(MinIdx,2);               % Arrival state for the computation of output bit
            
            if Trellis{StateDep,2}(2) == StateArr           % else if ~=, then OutBit = 0;
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

