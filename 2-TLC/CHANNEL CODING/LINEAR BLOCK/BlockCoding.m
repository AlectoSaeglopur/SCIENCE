
%%% Title: LINEAR BLOCK (NON-CYCLIC) CODE SIMULATION
%%% Author: Filippo Valmori
%%% Date: 10/08/2018
%%% Reference: Digital Communications - B.Sklar & P.K.Ray (Ch.6, p.328)

close all; clearvars; clc


%% SIMULATION #1 - SINGLE RUN PERFORMANCE OVER AWGN CHANNEL

k = 4;                            % Message length in bits
n = 9;                            % Codeword length in bits
Nmsg = 500;                       % Number of uncoded messages to be processed
DecMet = 'Normal';                % Decoding method ('Normal' or 'Erasure')
GFD = 1;                          % Galois field dimension
ErasPerc = 20;                    % Percentage of Eb below which an erasure is asserted
EbN0 = 9;                         % [dB] Eb/N0 over channel

[G,H] = GetMatrixGH(n,k,GFD);                       % Systematic generator and parity-check matrices
REPM = GetErrPatMtx(n,k);                           % Recoverable error pattern matrix
Nbits = k*Nmsg;                                     % Number of uncoded bits to be processed

if strcmp(DecMet,'Normal')
    
    SrcData = randi([0 1],Nmsg,k);                  % Info bits in Tx
    EncData = SrcData*G;                            % Channel coding
    SymbTx = 2*cast(EncData.x,'double')-1;          % Binary-to-antipodal conversion
    SymbRx = awgn(SymbTx,EbN0,'measured');          % AWGN channel
    HardData = SymbRx>0;                            % Received data after hard detection
    DecData = LinBlkDec(HardData,H, ...             % Info bits after linear block decoder without erasure
        REPM,GFD,'OFF');   
    Nerr = sum(sum(SrcData~=DecData));              % Update the number of errors
    
elseif strcmp(DecMet,'Erasure')
    
    SrcData = randi([0 1],Nmsg,k);                  % Info bits in Tx
    EncData = SrcData*G;                            % Channel coding
    SymbTx = 2*cast(EncData.x,'double')-1;          % Binary-to-antipodal conversion
    SymbRx = awgn(SymbTx,EbN0,'measured');          % AWGN channel
    EraThr = ErasPerc/100;                          % Absolute value of the erasure threshold
    HardData = ErasDetect(SymbRx,EraThr);           % Received data after erasure hard detection
    EraData = LinBlkDec(HardData,H, ...             % Info bits after linear block decoder with erasure
        REPM,GFD,'ON');
    Nerr = sum(sum(SrcData~=EraData));              % Update the number of errors
    
else
    
    error('Invalid decoding method!');
    
end

fprintf(" PARAMETERS:\n");
fprintf(" - (n,k) = (%d,%d)\n - Eb/N0 = %d dB\n - Decoding Method : %s\n\n",n,k,EbN0,DecMet);
fprintf(" RESULTS:\n");
if strcmp(DecMet,'Normal')
    fprintf(" - Errors before decoding : %d out of %d bits\n",sum(sum(EncData~=HardData)),n*Nmsg);
end
fprintf(" - Errors after decoding : %d out of %d bits\n",Nerr,Nbits);


%% SIMULATION #2 - PERFORMANCE COMPARISON BETWEEN UNCODED, CODED AND ERASURE CASES

% k = 4;                                      % Message length in bits
% n = 9;                                      % Codeword length in bits
% Nmsg = 1000;                                % Number of messages per cycle
% GFD = 1;                                    % Galois field dimension
% ErasPerc = 20;                              % Percentage of Eb below which an erasure is asserted
% InitEbN0 = 0;                              % [dB] Starting value of Eb/N0
% StepEbN0 = 0.5;                             % [dB] Incremental step for Eb/N0
% FinEbN0 = [12 9 9];                         % [dB] Ending value of Eb/N0
% MinErr = 300;                               % Base of the minimum number of errors for BER estimate
% 
% [G,H] = GetMatrixGH(n,k,GFD);               % Systematic generator and parity-check matrices
% REPM = GetErrPatMtx(n,k);                   % Recoverable error pattern matrix
% EraThr = ErasPerc/100;                      % Absolute value of the erasure threshold
% BER = cell(1,3);
% 
% for i = 1:3
%     
%     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);    % [dB] Energy-per-bit to Noise-spectral-density ratio array over AWGN channel
%     LenEbN0 = length(EbN0);
%     BER{i} = zeros(1,LenEbN0);
%     
%     for j = 1:LenEbN0
% 
%         Nerr = 0;                                                   % Number of errors
%         Ncycle = 0;                                                 % Number of cycles
%          
%         switch i
%             
%             case 1                                                  % 1) UNCODED CASE
%                 while Nerr < MinErr*(LenEbN0-j+1)
%                     SrcData = randi([0 1],Nmsg,k);                  % Info bits in Tx
%                     SymbTx = 2*cast(SrcData,'double')-1;            % Binary-to-antipodal conversion
%                     SymbRx = awgn(SymbTx,EbN0(j),'measured');       % AWGN channel
%                     UncData = SymbRx>0;                             % Info bits after hard detection    
%                     Nerr = Nerr+sum(sum(SrcData~=UncData));         % Update the number of errors
%                     Ncycle = Ncycle+1;
%                 end 
%                 BER{i}(j) = Nerr/(Nmsg*Ncycle);                     % Bit-error-rate estimate without coding
%                 
%             case 2                                                  % 2) CODED CASE
%                 while Nerr < MinErr*(LenEbN0-j+1)
%                     SrcData = randi([0 1],Nmsg,k);                  % Info bits in Tx
%                     EncData = SrcData*G;                            % Channel coding
%                     SymbTx = 2*cast(EncData.x,'double')-1;          % Binary-to-antipodal conversion
%                     SymbRx = awgn(SymbTx,EbN0(j),'measured');       % AWGN channel
%                     HardData = SymbRx>0;                            % Received data after hard detection
%                     DecData = LinBlkDec(HardData,H, ...             % Info bits after linear block decoder without erasure
%                         REPM,GFD,'OFF');   
%                     Nerr = Nerr+sum(sum(SrcData~=DecData));         % Update the number of errors
%                     Ncycle = Ncycle+1;
%                 end 
%                 BER{i}(j) = Nerr/(Nmsg*Ncycle);                     % Bit-error-rate estimate with coding
%                 
%             case 3                                                  %  3) ERASURE CASE
% 
%                 while Nerr < MinErr*(LenEbN0-j+1)
%                     SrcData = randi([0 1],Nmsg,k);                  % Info bits in Tx
%                     EncData = SrcData*G;                            % Channel coding
%                     SymbTx = 2*cast(EncData.x,'double')-1;          % Binary-to-antipodal conversion
%                     SymbRx = awgn(SymbTx,EbN0(j),'measured');       % AWGN channel       
%                     HardData = ErasDetect(SymbRx,EraThr);           % Received data after erasure hard detection
%                     EraData = LinBlkDec(HardData,H, ...             % Info bits after linear block decoder with erasure
%                         REPM,GFD,'ON');
%                     Nerr = Nerr+sum(sum(SrcData~=EraData));         % Update the number of errors
%                     Ncycle = Ncycle+1;
%                 end 
%                 BER{i}(j) = Nerr/(Nmsg*Ncycle);                     % Bit-error-rate estimate with erasure coding
% 
%         end
%         i
%         j
%     end
%     
% end
% 
% 
% markers = {'-x','-*','-o'};
% labels = {'Uncoded','Coded','Erasure'};
% colors = {[.2 .2 1],[.2 .8 .2],[1 0 0],[0 .8 .8]};
% 
% figure
% for i = 1:3
%     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
%     semilogy(EbN0,BER{i},markers{i},'Color',colors{i});
%     hold on
% end
% xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
% title(sprintf('Performances over AWGN channel for a (%d,%d) code',n,k))
% xticks(InitEbN0:max(FinEbN0)); axis([-0.5 12.5 7e-5 1]); grid on; hold off



%% EXTRA FUNCTIONS

%%% --> Function to calculate the generator (G) and parity-check (H) matrices of the
%%%     linear block code as a function of n, k and GFD
function [ GenMtx, ParChMtx ] = GetMatrixGH( CwLen, MsgLen, GFD )

    P = ones(MsgLen,CwLen-MsgLen);
    for j = 0:CwLen-MsgLen-1
        P(mod(j,MsgLen)+1,j+1) = 0;
    end

    GenMtx = gf([P eye(MsgLen)],GFD);                   % Generator matrix (in systematic form)
    ParChMtx = gf([eye(CwLen-MsgLen) P.'],GFD);         % Parity-check matrix

end


%%% --> Function to estimate the recoverable error pattern matrix of the linear block
%%%     code as a function of n and k
function [ REPM ] = GetErrPatMtx( CwLen, MsgLen )

    NREP = 2^(CwLen-MsgLen)-1;                          % Number of recoverable error patterns
    
    t = 1;                                              % Theoretical number of codeword recoverable errors
    Count = 0;
    while 1
        Count = Count+nchoosek(CwLen,t);
        if NREP > Count
            t = t+1;
        else
            break;
        end
    end
    
    ESP = zeros(1,t+1);                                 % Error subpatterns for each Nerr<=alpha
    for j = 1:t
        ESP(j+1) = nchoosek(CwLen,j);
    end

    IdtMtx = eye(CwLen);                                % Identity matrix of dimension n
    REPM = [IdtMtx;zeros(NREP-CwLen,CwLen)];            % Recoverable error pattern matrix [NREP x n]

    idx = CwLen+1;                                      % Index over the rows of REPM
    BreakLoop = false;                                  % Flag enabled after writing the last row of REPM
    j1 = 3;
    
    while ~BreakLoop
        j2 = 1;
        
        while j2 <= ESP(j1-1) && ~BreakLoop  
            SubRowA = REPM(j2+sum(ESP(1:j1-2)),:);
            LastOne = find(SubRowA,1,'last');
            j3 = LastOne+1;
            
            while j3 <= CwLen && ~BreakLoop
                SubRowB = IdtMtx(j3,:);
                REPM(idx,:) = SubRowA+SubRowB;
                idx = idx+1;
                if idx > NREP
                    BreakLoop = true;
                end 
                j3 = j3+1;          
            end
            
            j2 = j2+1;
        end
        
        j1 = j1+1;  
    end
    
    REPM = [zeros(1,CwLen);REPM];
    REPM = gf(REPM,1);
    
end


%%% --> Function to decode the linear block codewords (i.e. correct errors and extract
%%%     the info bits) with the possibility of erasure as a function of the input
%%%     codeword matrix, H, REPM, GFD and the Erasure enable flag
function [ MsgMtx ] = LinBlkDec( CwMtx, ParChMtx, REPM, GFD, ErasMode )

    CwLen = size(ParChMtx,2);
    MsgLen = CwLen-size(ParChMtx,1);
    Nmsg = size(CwMtx,1);
    NREP = size(REPM,1);
    ErrMtx = gf(zeros(Nmsg,CwLen),GFD);                 % Estimated error pattern matrix

    if strcmp(ErasMode,'OFF')
        
        S = CwMtx*ParChMtx.';                           % Syndromes of the the received codewords
        for i = 1:Nmsg
            for j = 1:NREP
                if S(i,:) == REPM(j,:)*ParChMtx.'
                    ErrMtx(i,:) = REPM(j,:);
                    break;
                end
            end
        end

    elseif strcmp(ErasMode,'ON')
        
        for i = 1:Nmsg           
            CwRow = CwMtx(i,:);
            EraIdx = find(CwRow==-1);
            
            if isempty(EraIdx)                          % No presence of erasure in the current row
                
                S = CwRow*ParChMtx.';                   % Syndromes of the the j-th codeword
                for j = 1:NREP
                    if S == REPM(j,:)*ParChMtx.'
                        ErrMtx(i,:) = REPM(j,:);
                        break;
                    end
                end
                
            else                                        % Presence of at least one erasure in the current row
                
                TryCw0 = CwRow; TryCw0(EraIdx) = 0;     % Replacement of the codeword erasure bits with 0s
                TryCw1 = CwRow; TryCw1(EraIdx) = 1;     % Replacement of the codeword erasure bits with 1s
                S0 = TryCw0*ParChMtx.';                 % Syndromes of the the 0-try codeword
                S1 = TryCw1*ParChMtx.';                 % Syndromes of the the 1-try codeword

                ERP0 = gf(zeros(1,CwLen),GFD);
                for j = 1:NREP
                    if S0 == REPM(j,:)*ParChMtx.'
                        ERP0 = REPM(j,:);
                        break;
                    end
                end

                ERP1 = gf(zeros(1,CwLen),GFD);
                for j = 1:NREP
                    if S1 == REPM(j,:)*ParChMtx.'
                        ERP1 = REPM(j,:);
                        break;
                    end
                end
                
                ExtErr0 = ERP0.x;                       % Errors outside the erasure positions for S0
                ExtErr0(EraIdx) = [];
                 
                ExtErr1 = ERP1.x;                       % Errors outside the erasure positions for S1
                ExtErr1(EraIdx) = [];
                
                if sum(ExtErr1) < sum(ExtErr0)
                    FixEra1 = zeros(1,CwLen); FixEra1(EraIdx) = 2;
                    ErrMtx(i,:) = ERP1;
                    CwMtx(i,:) = CwMtx(i,:)+FixEra1;    % Fixing of the erasure values from -1 to 1
                    
                else
                    FixEra0 = zeros(1,CwLen); FixEra0(EraIdx) = 1;
                    ErrMtx(i,:) = ERP0;
                    CwMtx(i,:) = CwMtx(i,:)+FixEra0;    % Fixing of the erasure values from -1 to 0
                end

            end
        end 
    else
        error('Value of input Erasure must be ON or OFF');
    end
    
    RecData = CwMtx+ErrMtx;                             % Data patching with the estimated error patterns
    MsgMtx = RecData(:,CwLen-MsgLen+1:end);             % Removal of parity bits

end


%%% --> Function to implement the erasure hard detection (i.e. a common hard detection but where
%%%     the symbols with amplitude lesser than EraThr are set as -1 for the following decoder)
%%%     as function of the input symbol matrix and the erasure threshold
function [ OutMtx ] = ErasDetect( InMtx, EraThr )

    Nmsg = size(InMtx,1);
    CwLen = size(InMtx,2);

    OutMtx = zeros(Nmsg,CwLen);
    for i = 1:Nmsg
        for j = 1:CwLen
            if abs(InMtx(i,j)) < EraThr
                OutMtx(i,j) = -1;
            elseif InMtx(i,j) >= EraThr
                OutMtx(i,j) = 1;
            end
        end
    end
    
end
 