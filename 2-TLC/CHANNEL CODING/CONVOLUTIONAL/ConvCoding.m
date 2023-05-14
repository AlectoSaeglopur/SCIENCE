
%%% Title: CONVOLUTIONAL ENCODING AND VITERBI DECODING
%%% Author: Filippo Valmori
%%% Date: 04/10/2018
%%% Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.7)


close all; clearvars; clc


%% SIMULATION #1 - SINGLE RUN PERFORMANCE OVER AWGN CHANNEL

Nbits = 2000;                                                           % Number of uncoded bits to be processed
K = 5;                                                                  % Constrain length
MemFct = 5;                                                             % Memory factor (the higher, the larger the memory allocated for storing survivor paths history)
Rc = '1/2';                                                             % Rate code
EbN0 = 8;                                                               % [dB] Eb/N0 over channel
DecMet = 'Soft';                                                        % Decoding method ('Hard' or 'Soft')
Nqlev = 5;                                                              % Number of levels for soft-decoding quantization (use "Inf" for no quantization)

[Trellis,ConVect,PunctVect] = GetCodeInfo(K,Rc);                        % Retrieve code information
InBits = randi([0 1],1,Nbits);                                          % Random bit stream generation
EncBits = ConvEncoder(InBits,ConVect,PunctVect);                        % Convolutional encoding
TxSymbs = 2*EncBits-1;                                                  % Bit to antipodal symbol conversion
RxSymbs = awgn(TxSymbs,EbN0,'measured');                                % AWGN channel

if strcmp(DecMet,'Hard')
    DetBits = RxSymbs>0;
    OutBits = ConvDecoder(DetBits,Trellis,MemFct,PunctVect,DecMet);
elseif strcmp(DecMet,'Soft')
    RxSymbs = Quantizer(RxSymbs,Nqlev);
    OutBits = ConvDecoder(RxSymbs,Trellis,MemFct,PunctVect,DecMet);
else
    error('Invalid decoding method!');
end

fprintf(" PARAMETERS:\n");
fprintf(" - K = %d\n - Rc = %s\n - Eb/N0 = %d dB\n - Decoding Method : %s\n\n",K,Rc,EbN0,DecMet);
fprintf(" RESULTS:\n");
if strcmp(DecMet,'Hard')
    fprintf(" - Errors before decoding : %d out of %d bits\n",sum(EncBits~=DetBits),length(EncBits));
end
fprintf(" - Errors after decoding : %d out of %d bits\n",sum(InBits~=OutBits),Nbits);



%% SIMULATION #2 - PERFORMANCE COMPARISON AS A FUNCTION OF THE CONSTRAIN LENGTH

% % Nbits = 5000;                                                           % Number of processed bits per cycle
% % MinErr = 250;                                                           % Base of the minimum number of errors for BER estimate
% % MemFct = 5;                                                             % Memory factor (the higher, the larger the memory allocated for storing survivor paths history)
% % Rc = '1/2';                                                             % Code rate
% % K = [3 4 5 6 7 8];                                                      % Values of the constrain lengths
% % InitEbN0 = 2;                                                           % [dB] Starting value of Eb/N0
% % StepEbN0 = 0.5;                                                         % [dB] Incremental step for Eb/N0
% % FinEbN0 = [12 8 7.5 7 6.5 6 5.5];                                       % [dB] Ending value of Eb/N0
% % 
% % LenK = length(K)+1;
% % BER = cell(1,LenK);
% % 
% % for i = 1:LenK
% %     
% %     if i > 1
% %         [Trellis,ConVect,PunctVect] = GetCodeInfo(K(i-1),Rc);
% %     end
% %     
% %     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
% %     LenEbN0 = length(EbN0);
% %     BER{i} = zeros(1,LenEbN0);
% %     
% %     for j = 1:LenEbN0
% %         
% %         Nerr = 0;                                                       % Error counter
% %         Ncycles = 0;                                                    % Cycle counter
% %         
% %         while Nerr < MinErr*(LenEbN0-j+1)                               % Lower Eb/N0 require greater number of errors to get a reliable statistic
% %             
% %             Ncycles = Ncycles+1;
% %             InBits = randi([0 1],1,Nbits);                              % Random generation of uncoded bits
% %             
% %             if i > 1
% %                 EncBits = ConvEncoder(InBits,ConVect,PunctVect);                    % Convolutional encoding
% %                 TxSymbs = 2*EncBits-1;                                              % Antipodal mapping
% %                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');                         % AWGN addition
% %                 RxBits = RxSymbs>0;                                                 % Hard detection
% %                 DecBits = ConvDecoder(RxBits,Trellis,MemFct,PunctVect,'Hard');      % Viterbi hard-decoding
% %                 Nerr = Nerr+sum(InBits~=DecBits);                                   % Error check
% %             else
% %                 TxSymbs = 2*InBits-1;
% %                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');
% %                 RxBits = RxSymbs>0;
% %                 Nerr = Nerr+sum(InBits~=RxBits);                        % Error check for the uncoded case
% %             end
% %             
% %         end
% %         
% %         BER{i}(j) = Nerr/(Ncycles*Nbits);
% %         
% %     end
% %     
% % end
% % 
% % markers = {'-x','-*','-o','-^','-d','-p','-h'};
% % labels = [{' Uncoded'};strcat(' K =',{' '},num2str(K.'))];
% % colors = {[.2 .2 1];[.2 .8 .2];[1 .7 .2];[.8 0 .8];[0 .8 .8];[1 .2 0];[.4 .2 0]};
% % 
% % figure
% % for i = 1:LenK
% %     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
% %     semilogy(EbN0,BER{i},markers{i},'Color',colors{i});
% %     hold on
% % end
% % 
% % xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
% % title(sprintf('Performance comparison among different constrain lengths (Rc = %s)',Rc))
% % axis([1.5 12.5 3e-6 1]); grid on; hold off



%% SIMULATION #3 - PERFORMANCE COMPARISON AS A FUNCTION OF THE CODE RATE

% % Nbits = 6000;                                                           % Number of processed bits per cycle
% % MinErr = 400;                                                           % Base of the minimum number of errors for BER estimate
% % MemFct = 5;                                                             % Memory factor (the higher, the larger the memory allocated for storing survivor paths history)
% % Rc = {'5/6','3/4','2/3','1/2'};                                         % Code rate
% % K = 5;                                                                  % Values of the constrain lengths
% % InitEbN0 = 2;                                                           % [dB] Starting value of Eb/N0
% % StepEbN0 = 0.5;                                                         % [dB] Incremental step for Eb/N0
% % FinEbN0 = [11.5 10 9 8.5 6.5];                                          % [dB] Ending value of Eb/N0
% % 
% % LenRc = length(Rc)+1;
% % BER = cell(1,LenRc);
% % 
% % for i = 1:LenRc
% %     
% %     if i > 1
% %         [Trellis,ConVect,PunctVect] = GetCodeInfo(K,Rc{i-1});           % Retrieve coding information
% %     end
% %     
% %     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);                                % [dB] Energy-per-bit to Noise-spectral-density ratios array
% %     LenEbN0 = length(EbN0);
% %     BER{i} = zeros(1,LenEbN0);
% %     
% %     for j = 1:LenEbN0
% %         
% %         tic
% %         
% %         Nerr = 0;                                                       % Error counter
% %         Ncycles = 0;                                                    % Cycle counter
% %         
% %         while Nerr < MinErr*(LenEbN0-j+1)                               % Lower Eb/N0 require greater number of errors to get a reliable statistic
% %             
% %             Ncycles = Ncycles+1;
% %             InBits = randi([0 1],1,Nbits);                              % Random generation of uncoded bits
% %             
% %             if i > 1
% %                 EncBits = ConvEncoder(InBits,ConVect,PunctVect);                    % Convolutional encoding
% %                 TxSymbs = 2*EncBits-1;                                              % Antipodal mapping
% %                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');                         % AWGN addition
% %                 RxBits = RxSymbs>0;                                                 % Hard detection
% %                 DecBits = ConvDecoder(RxBits,Trellis,MemFct,PunctVect,'Hard');      % Viterbi hard-decoding
% %                 Nerr = Nerr+sum(InBits~=DecBits);                                   % Error check
% %             else                                
% %                 TxSymbs = 2*InBits-1;
% %                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');
% %                 RxBits = RxSymbs>0;
% %                 Nerr = Nerr+sum(InBits~=RxBits);                        % Error check for the uncoded case
% %             end
% %             
% %         end
% %         
% %         BER{i}(j) = Nerr/(Ncycles*Nbits);
% %         
% %     end
% %     
% % end
% % 
% % markers = {'-x','-*','-o','-^','-p'};
% % labels = [{'Uncoded'};strcat('Rc =',{' '},Rc.')];
% % colors = {[.2 .2 1],[1 .6 .2],[.2 .8 .2],[1 0 0],[0 .8 .8]};
% % 
% % figure
% % for i = 1:LenRc
% %     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
% %     semilogy(EbN0,BER{i},markers{i},'Color',colors{i});
% %     hold on
% % end
% % 
% % xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
% % title(sprintf('Performance comparison among different code rates (K = %s)',num2str(K)))
% % axis([1.5 12.5 1e-5 1]); grid on; hold off



%% SIMULATION #4 - PERFORMANCE COMPARISON BETWEEN HARD AND SOFT DECODING

% % Nbits = 6000;                                                           % Number of processed bits per cycle
% % MinErr = 250;                                                           % Base of the minimum number of errors for BER estimate
% % MemFct = 5;                                                             % Memory factor (the higher, the larger the memory allocated for storing survivor paths history)
% % Rc = '1/2';                                                             % Code rate
% % K = 5;                                                                  % Values of the constrain lengths
% % InitEbN0 = 1;                                                           % [dB] Starting value of Eb/N0
% % StepEbN0 = 0.5;                                                         % [dB] Incremental step for Eb/N0
% % FinEbN0 = [11.5 6.5 6.5 5 4.5];                                         % [dB] Ending value of Eb/N0 [H 8.6, S 6.5 per 2/3]
% % 
% % DecMet = {'Unc','Hard','Soft','Soft','Soft'};
% % Nqlev = [2 4 Inf];
% % 
% % LenDM = length(DecMet);
% % BER = cell(1,LenDM);
% % [Trellis,ConVect,PunctVect] = GetCodeInfo(K,Rc);                        % Retrieve coding information
% % 
% % for i = 1:LenDM
% %     
% %     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
% %     LenEbN0 = length(EbN0);
% %     BER{i} = zeros(1,LenEbN0);
% %     
% %     for j = 1:LenEbN0
% % 
% %         Nerr = 0;                                                       % Error counter
% %         Ncycles = 0;                                                    % Cycle counter
% % 
% %         while Nerr < MinErr*(LenEbN0-j+1)                               % Lower Eb/N0 require greater number of errors to get a reliable statistic
% % 
% %             Ncycles = Ncycles+1;
% %             InBits = randi([0 1],1,Nbits);                              % Random generation of uncoded bits
% % 
% %             if strcmp(DecMet{i},'Unc')
% %                 
% %                 TxSymbs = 2*InBits-1;
% %                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');
% %                 RxBits = RxSymbs>0;
% %                 Nerr = Nerr+sum(InBits~=RxBits);                        % Error check for the uncoded case
% % 
% %             else                                
% % 
% %                 EncBits = ConvEncoder(InBits,ConVect,PunctVect);                        % Convolutional encoding
% %                 TxSymbs = 2*EncBits-1;                                                  % Antipodal mapping
% %                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');                             % AWGN addition
% %                 if strcmp(DecMet{i},'Hard')
% %                     RxBits = RxSymbs>0;                                                 % Hard detection
% %                     DecBits = ConvDecoder(RxBits,Trellis,MemFct,PunctVect,'Hard');      % Viterbi hard-decoding
% %                 else
% %                     RxSymbs = Quantizer(RxSymbs,Nqlev(i-2));                            % Soft-quantization
% %                     DecBits = ConvDecoder(RxSymbs,Trellis,MemFct,PunctVect,'Soft');     % Viterbi soft-decoding
% %                 end
% %                 Nerr = Nerr+sum(InBits~=DecBits);                                       % Error check
% %             end
% % 
% %         end
% % 
% %         BER{i}(j) = Nerr/(Ncycles*Nbits);
% %     end
% % 
% % end
% % 
% % markers = {'-x','-*','-o','-p','-^'};
% % labels = {' Uncoded',' Hard',' Soft (QL = 2)',' Soft (QL = 4)',' Soft (QL = \infty)'};
% % colors = {[.2 .2 1],[.2 .8 .2],[1 .6 .2],[1 0 0],[0 .8 .8]};
% % 
% % figure
% % for i = 1:LenDM
% %     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
% %     semilogy(EbN0,BER{i},markers{i},'Color',colors{i});
% %     hold on
% % end
% % 
% % xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
% % title(sprintf('Performance comparison between hard and soft decoding (K = %s, Rc = %s)',num2str(K),Rc))
% % axis([0.5 12.5 .99e-5 1]); xticks(floor(InitEbN0):ceil(max(FinEbN0))); grid on; hold off



%% FUNCTIONS

% >> Function for getting connector vectors, trellis diagram and puncturing
%     vector of the code as a function of K and Rc
function [ Trellis, ConVect, PunctVect ] = GetCodeInfo( ConstLen, CodeRate )

    switch ConstLen                                                     % Association between selected K and connector vectors
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
        
    Nst = 2^(ConstLen-1);                                               % Number of trellis diagram states
    StBin = fliplr(de2bi(0:Nst-1,ConstLen-1));                          % States ID in binary (equal to its value in decimal -1)

    Trellis = cell(Nst,2);                                              % i-th row: i-th state | 1st and 2nd cell : output bits and new state(if input is 0 or 1)
    for j = 1:Nst

        CurSt = StBin(j,:);                                             % Current trellis state

        State0 = [0 CurSt];                                             % Case where new input bit is 0
        Out0 = mod(sum((State0.*ConVect).'),2);                         % Output bits (for 0-bit input)
        NewSt0 = State0(1:ConstLen-1);                                  % New state (for 0-bit input)

        State1 = [1 CurSt];                                             % Case where new input bit is 1
        Out1 = mod(sum((State1.*ConVect).'),2);                         % Output bits (for 1-bit input)
        NewSt1 = State1(1:ConstLen-1);                                  % New state (for 1-bit input)

        Trellis{j,1} = [Out0;Out1];                                     % Save output bits for both input cases
        Trellis{j,2} = bi2de([NewSt0;NewSt1], ...
            'left-msb')+1;

    end
    
    switch CodeRate                                                     % Puncturing vectors (from NASA standard)
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


% >> Function to encode the incoming bit stream using the defined connections
function [ OutBits ] = ConvEncoder( InBits, ConVect, PunctVect )

    InLen = length(InBits);
    k = length(PunctVect)/2;                                            % Expected "k" (from selected Rc = k/n) after puncturing
    if mod(InLen,k) ~= 0
        error('Input bit stream length must be multiple of k (from Rc = k/n)')
    end

    [n,K] = size(ConVect);                                              % Retrieve unpunctured "n" (always 2 here) and "K" values
    EncState = zeros(1,K);                                              % State of the encoder
    OutLen = n*InLen;                                                   % Output bit stream length
    OutBits = zeros(1,OutLen);
    
    for j = 1:InLen                                                     % Compute convolutional encoding without puncturing (Rc = 1/2)
        EncState(2:K) = EncState(1:K-1);
        EncState(1) = InBits(j);
        OutBits(1+(j-1)*n:j*n) = mod(sum((EncState.*ConVect).'),2);
    end
    
    PunctIdx = find(PunctVect==0);
    if ~isempty(PunctIdx)                                               % Compute puncturing if desired Rc ~= 1/2
        Ncols = k*n;
        Nrows = OutLen/Ncols;
        OutMtx = reshape(OutBits,[Ncols,Nrows]).';
        OutMtx(:,PunctIdx) = [];
        OutBits = reshape(OutMtx.',[1,OutLen-Nrows*length(PunctIdx)]);
    end
    
end


% >> Function for hard/soft-decoding (Viterbi algorithm) the incoming stream employing the trellis
%     diagram and the memory factor specified as input arguments [NB: InStream must be made up of
%     bits for hard-decoding and of symbols for soft-decoding]
function [ OutBits ] = ConvDecoder( InStream, Trellis, MemFct, PunctVect, Mode )
    
    n = sum(PunctVect);                                                 % Retrieve value of punctured "n" (from Rc = k/n)
    if mod(length(InStream),n) ~= 0
        error('Length of the bit stream to be decoded must be multiple of n (from Rc = k/n)')
    elseif ~(strcmp(Mode,'Hard') || strcmp(Mode,'Soft'))
        error('Invalid decoding method');
    end
    
    if ~isempty(find(PunctVect==0,1))                                   % Check if puncturing is present [~isempty(find(PunctMtx==0))]
        InStream = PunctDec(InStream,PunctVect);                        % Restore removed bits as erasure symbols (-1)
    end
    
    Nst = size(Trellis,1);                                              % Number of trellis diagram states 
    n = size(Trellis{1,1},2);                                           % Unpunctured value of n (i.e. 2, since original Rc is always 1/2)
    OutLen = length(InStream)/n;                                        % Decoded bit stream length
    OutBits = zeros(1,OutLen);
    MemDim = MemFct*Nst;                                                % Memory dimension (maximum number of previous states for survivor paths representation)
    
    CurPaths = {-ones(Nst,1),zeros(Nst,1), ...                          % i-th row: i-th state info | 1st cell: iteration step | 2nd cell: distance | 3rd cell: path history 
        zeros(Nst,MemDim)};                                             % 2nd column : survivor path distance | 3rd column : previous states within survivor path
    CurPaths{1}(1) = 0;                                                 % Enable only the all-zero state for the beginning of decoding
    
    for i = 1:OutLen
        
        CycleBits = InStream(1+n*(i-1):n*i);                            % Input symbols at i-th iteration
        NotErasIdx = ~isnan(CycleBits);                                 % Consider only non-erasure bits for distance estimate
        PrevPaths = CurPaths;

        for j = 1:Nst                                                   % For-loop over the trellis states

            if PrevPaths{1}(j) == i-1                                   % Check if j-th state was active in the previous iteration

                for HypIdx = 1:2                                        % HypIdx = 1 means computing new path hypothesizing an incoming uncoded bit = 0 (and incoming uncoded bit = 1 for HypIdx = 2)

                    if strcmp(Mode,'Hard')
                        Dist = sum(CycleBits(NotErasIdx)~=Trellis{j,1}(HypIdx,NotErasIdx));         % Hamming distance at j-th departure state assuming HypIdx incoming bit
                    else
                        Dist = sum(abs(CycleBits(NotErasIdx)-Trellis{j,1}(HypIdx,NotErasIdx)));     % Euclidean distance at j-th departure state assuming HypIdx incoming bit
                    end
                    NextSt = Trellis{j,2}(HypIdx);                                                  % New state assuming incoming bit fixed by HypIdx

                    if CurPaths{1}(NextSt) < i                                                      % If first survivor path computed to NextSt, save its info
                        CurPaths{1}(NextSt) = i;                                                    % Update NextState iteration step
                        CurPaths{2}(NextSt) = PrevPaths{2}(j)+Dist;                                 % Update NextState distance
                        if i < MemDim
                            WrIdx = i;
                        else
                            WrIdx = MemDim;
                        end
                        CurPaths{3}(NextSt,1:WrIdx) = [PrevPaths{3}(j,1:WrIdx-1),j];                % Store new survivor path for NewState

                    else                                                                            % If there is already a survivor path for NextState
                        CandDistance = PrevPaths{2}(j)+Dist;                                        % Distance of the new candidate for NextStateo survivor path
                        if CandDistance < CurPaths{2}(NextSt)                                       % If new candidate distante is better, update the survivor path info
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
        
        if i == OutLen                                                  % Check whether input bit stream is over, if so retrieve the uncoded bit by flushing the memory
            
            [~,MinIdx] = min(CurPaths{2});                              % Final minimum distance survivor path (MDSP)
            
            if i >= MemDim                                              % Check if memory has been completely filled to set the final index for memory flushing
                IdxFin = MemDim;
            else                                                        % i.e. if input bit stream length is so short that doesn't even fill the memory
                IdxFin = i;
            end
            
            for j = 1:IdxFin
                StateDep = CurPaths{3}(MinIdx,j);                       % Departure state for the computation of output bit
                if j == IdxFin
                    StateArr = MinIdx;
                else
                    StateArr = CurPaths{3}(MinIdx,j+1);                 % Arrival state for the computation of output bit
                end
                if Trellis{StateDep,2}(2) == StateArr                   % else if ~=, then FinalBits(j) = 0;
                    OutBits(end-IdxFin+j) = 1;
                end
            end
            
        elseif i >= MemDim                                              % If input bit stream is not over yet, check if memory is full
            
            [~,MinIdx] = min(CurPaths{2});                              % MDSP so far
            StateDep = CurPaths{3}(MinIdx,1);                           % Departure state for the computation of output bit (the oldest state of the MDSP)
            StateArr = CurPaths{3}(MinIdx,2);                           % Arrival state for the computation of output bit
            
            if Trellis{StateDep,2}(2) == StateArr                       % else if ~=, then OutBit = 0;
                OutBits(1+i-MemDim) = 1;
            end
            
            CurPaths{3}(:,1:MemDim-1) = CurPaths{3}(:,2:MemDim);        % Remove the oldest state of each survivor path from memory
            
        end

    end
    
end


% >> Function for reconstructing the original coded stream without puncturing (Rc = 1/2), where
%     the erasure bits/symbols are inserted as NaN in the location specified by PunctVect
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


% >> Function for quantizing the input symbol stream into a number of levels specified
%     by the corresponding input argument
function [OutSymbs] = Quantizer( InSymbs, Nlevels )

    if Nlevels ~= round(Nlevels) || Nlevels < 2
        error('Number of levels must be integer and greater than 1');
    end
    
    OutSymbs = (InSymbs+1)/2;                                           % To turn from antipodal symbols into bits

    if Nlevels ~= Inf
 
        Step = 1/Nlevels;                                               % Quantization step
        Limits = Step:Step:1-Step;                                      % Quantization limits
        CenterVals = zeros(1,Nlevels);                                  % Quantization values

        for j = 2:Nlevels
            if j == Nlevels
                CenterVals(j) = 1;
            else
                CenterVals(j) = (Limits(j-1)+Limits(j))/2;
            end
        end
        
        Len = length(InSymbs);
        for j = 1:Len
            for i = 1:Nlevels-1
                if OutSymbs(j) < Limits(i)
                    OutSymbs(j) = CenterVals(i);
                    break;
                elseif i == Nlevels-1
                    OutSymbs(j) = CenterVals(end);
                end
            end
        end
        
    end

end



%% NOTES

% NB#1: Since in all these simulations, M = 1 (i.e. antipodal real symbols) and osf = 1 (i.e. Fs = Rs)
%     Eb/N0 and SNR coincide. Thus, in this case feeding the MATLAB built-in function awgn() with Eb/N0
%     (and not SNR) is correct anyway.
