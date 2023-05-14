
%%% Title: REED-SOLOMON ENCODING/DECODING
%%% Author: Filippo Valmori
%%% Date: 20/10/2018
%%% References: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.8)
%%%             [2] Implementing Reed-Solomon - A.Brown
%%%             [3] Reed-Solomon Decoder: TMS320C64x Implementation - J.Sankaran

close all; clearvars; clc

global m n k t Table                                        % Global variables definitions


%% SIMULATION #1 - SINGLE RUN PERFORMANCE OVER AWGN CHANNEL

m = 8;                                                      % Extended Galois field degree (i.e. number of bits per symbol)
n = 204;                                                    % Codeword length (in symbols)
k = 188;                                                    % Message length (in symbols)
t = (n-k)/2;                                                % Maximum number of recoverable symbol errors (i.e. half the number of redundancy symbols)
EbN0 = 9.5;                                                 % [dB] Eb/N0 over channel

SrcBits = randi([0 1],1,m*k);                               % Source bit stream generation for a single message
CheckParam();                                               % Check the correctness of parameters
PrimPoly = GetPrimPoly();                                   % Get the primitive polynomial for the selected GF               
Table = MapGF(PrimPoly);                                    % Get the symbol/basis mapping table
GenPoly = GetGenPoly();                                     % Get the generator polynomial for the selected code
EncBits = EncoderRS(SrcBits,GenPoly);                       % Reed-Solomon encoding
TxSymbs = 2*EncBits-1;                                      % Bit to antipodal symbol conversion
RxSymbs = awgn(TxSymbs,EbN0,'measured');                    % AWGN channel
DetBits = (RxSymbs>0);                                      % Hard detection
DecBits = DecoderRS(DetBits);                               % Reed-Solomon decoding

[ChanBitErr,ChanSymbErr,DecBitErr] = ...                    % Check the bit and symbol errors before and after decoding
    CheckErr(SrcBits,EncBits,DetBits,DecBits);

fprintf(" PARAMETERS:\n");
fprintf(" - GF = 2^%d\n - (n,k,t) = (%d,%d,%d)\n - Eb/N0 = %1.1f dB\n\n",m,n,k,t,EbN0);
fprintf(" RESULTS:\n");
fprintf(" - Errors before decoding : %d out of %d bits",ChanBitErr,length(EncBits));
fprintf(" (%d out of %d symbols)\n",ChanSymbErr,length(EncBits)/m);
fprintf(" - Errors after decoding : %d out of %d bits\n",DecBitErr,length(SrcBits));



%% SIMULATION #2 - PERFORMANCE COMPARISON AS A FUNCTION OF THE CODE RATE

% m = 5;                                                    % Extended Galois field degree (i.e. number of bits per symbol)
% n = 2^m-1;                                                % Codeword length (in symbols)
% MinErr = 400;                                             % Base of the minimum number of errors for BER estimate
% Nmsg = 100;                                               % Number of messages per cycle to be simulated
% InitEbN0 = 0;                                             % [dB] Starting value of Eb/N0
% StepEbN0 = 0.5;                                           % [dB] Incremental step for Eb/N0
% 
% if m == 4
%     Vectk = [13 11 9 7 5 3];                              % Message length vector (in symbols)
%     FinEbN0 = [11 9.5 8.5 7.5 6.5 6 5];                   % [dB] Ending value of Eb/N0
%     AxLim = [-0.5 12.5 3e-5 1];                           % Plot axis limits 
% elseif m == 5
%     Vectk = [27 23 19 15 11 7];
%     FinEbN0 = [12 9.5 8.5 7.5 6.5 6 5];
%     AxLim = [-0.5 12.5 3e-6 1];
% end
% 
% Lenk = length(Vectk)+1;
% BER = cell(1,Lenk);
% 
% for i = 1:Lenk
%     
%     if i > 1
%         k = Vectk(i-1);
%         t = (n-k)/2;                                      % Maximum number of recoverable symbol errors (i.e. half the number of redundancy symbols)
%         CheckParam();                                     % Check the correctness of parameters
%         PrimPoly = GetPrimPoly();                         % Get the primitive polynomial for the selected GF
%         Table = MapGF(PrimPoly);                          % Get the symbol/basis mapping table
%         GenPoly = GetGenPoly();                           % Get the generator polynomial for the selected code
%         Nbits = Nmsg*k*m;
%     else
%         Nbits = Nmsg;
%     end
%     
%     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
%     LenEbN0 = length(EbN0);
%     BER{i} = zeros(1,LenEbN0);
%     
%     for j = 1:LenEbN0
%         
%         Nerr = 0;                                               % Error counter
%         Ncycles = 0;                                            % Cycle counter
% 
%         while Nerr < MinErr*(LenEbN0-j+1)                       % Lower Eb/N0 require greater number of errors to get a reliable statistic
%             
%             Ncycles = Ncycles+1;                                % Cycle update
%             InBits = randi([0 1],1,Nbits);                      % Random generation of uncoded bits
%             
%             if i > 1
%                 EncBits = EncoderRS(InBits,GenPoly);            % Reed-Solomon encoding
%                 TxSymbs = 2*EncBits-1;                          % Bit to antipodal symbol conversion
%                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');     % AWGN channel
%                 DetBits = (RxSymbs>0);                          % Hard detection
%                 DecBits = DecoderRS(DetBits);                   % Reed-Solomon decoding
%                 Nerr = Nerr+sum(InBits~=DecBits);               % Error check for the coded case
%             else
%                 TxSymbs = 2*InBits-1;
%                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');
%                 RxBits = RxSymbs>0;
%                 Nerr = Nerr+sum(InBits~=RxBits);                % Error check for the uncoded case
%             end
%             
%         end
%         
%         BER{i}(j) = Nerr/(Ncycles*Nbits);                       % BER estimate
%         
%     end
% 
% end
% 
% markers = {'-x','-*','-o','-^','-d','-p','-h'};
% labels = [{' Uncoded'};strcat({' RS ('},num2str(n),',',num2str(Vectk.'),')')];
% colors = {[.2 .2 1];[.2 .8 .2];[1 .7 .2];[.8 0 .8];[0 .8 .8];[1 .2 0];[.4 .2 0]};
% 
% figure
% for i = 1:Lenk
%     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
%     semilogy(EbN0,BER{i},markers{i},'Color',colors{i});
%     hold on
% end
% 
% xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
% title(sprintf('Performance comparison among different code rates in GF(2^{%d})',m))
% axis(AxLim); xticks(InitEbN0:max(FinEbN0)); grid on; hold off



%% SIMULATION #3 - PERFORMANCE COMPARISON AMONG SHORTENED VERSIONS

% m = 6;
% t = 8;                                                  % Maximum number of recoverable symbol errors
% Vectn = [63 54 45 36 27];                               % Codeword length vector (in symbols)
% Vectk = Vectn-2*t;                                      % Message length vector (in symbols)                     
% MinErr = 700;                                           % Base of the minimum number of errors for BER estimate
% Nmsg = 200;                                             % Number of messages per cycle to be simulated
% InitEbN0 = 4;                                           % [dB] Starting value of Eb/N0
% StepEbN0 = 0.25;                                        % [dB] Incremental step for Eb/N0
% FinEbN0 = [11 7.5 7.25 7 6.5 6];                        % [dB] Ending value of Eb/N0
% 
% Lenk = length(Vectk)+1;
% BER = cell(1,Lenk);
% 
% for i = 1:Lenk
%     
%     if i > 1
%         n = Vectn(i-1);
%         k = Vectk(i-1);
%         CheckParam();                                   % Check the correctness of parameters
%         PrimPoly = GetPrimPoly();                       % Get the primitive polynomial for the selected GF
%         Table = MapGF(PrimPoly);                        % Get the symbol/basis mapping table
%         GenPoly = GetGenPoly();                         % Get the generator polynomial for the selected code
%         Nbits = Nmsg*k*m;
%     else
%         Nbits = Nmsg;
%     end
%     
%     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
%     LenEbN0 = length(EbN0);
%     BER{i} = zeros(1,LenEbN0);
%     
%     for j = 1:LenEbN0
%         
%         Nerr = 0;                                               % Error counter
%         Ncycles = 0;                                            % Cycle counter
% 
%         while Nerr < MinErr*(LenEbN0-j+1)^2                     % Lower Eb/N0 require greater number of errors to get a reliable statistic
%             
%             Ncycles = Ncycles+1;                                % % Cycle update
%             InBits = randi([0 1],1,Nbits);                      % Random generation of uncoded bits
%             
%             if i > 1
%                 EncBits = EncoderRS(InBits,GenPoly);            % Reed-Solomon encoding
%                 TxSymbs = 2*EncBits-1;                          % Bit to antipodal symbol conversion
%                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');     % AWGN channel
%                 DetBits = (RxSymbs>0);                          % Hard detection
%                 DecBits = DecoderRS(DetBits);                   % Reed-Solomon decoding
%                 Nerr = Nerr+sum(InBits~=DecBits);               % Error check for the coded case
%             else
%                 TxSymbs = 2*InBits-1;
%                 RxSymbs = awgn(TxSymbs,EbN0(j),'measured');
%                 RxBits = RxSymbs>0;
%                 Nerr = Nerr+sum(InBits~=RxBits);                % Error check for the uncoded case
%             end
%             
%         end
%         
%         BER{i}(j) = Nerr/(Ncycles*Nbits);                       % BER estimate
%         
%     end
% 
% end
% 
% markers = {'-x','-*','-o','-^','-d','-p','-h'};
% labels = [{' Uncoded'};strcat(' RS (',num2str(Vectn.'),',',num2str(Vectk.'),{')'})];
% colors = {[.2 .2 1];[.2 .8 .2];[1 .7 .2];[.8 0 .8];[0 .8 .8];[1 .2 0];[.4 .2 0]};
% 
% figure
% for i = 1:Lenk
%     EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
%     semilogy(EbN0,BER{i},markers{i},'Color',colors{i});
%     hold on
% end
% 
% xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
% title(sprintf('Performance comparison among different extended GF for t = %d',t))
% axis([3.5 11.5 3e-5 1]); grid on; hold off



%% FUNCTIONS

% >> Function for checking the parameters correctness.
function [ ] = CheckParam( )

    global m n k
    
    if m < 3 || m > 8 || round(m) ~= m
    	error('Invalid GF degree m');
    elseif k <= 0 || n <= k || round(n) ~= n || round(k) ~= k || ...
        mod(n-k,2) ~= 0 || n > 2^m-1
        error('Invalid message/codeword values (n,k)');
    end
	
end


% >> Function for retrieving the primitive polynomial (maximum term is implied)
% as a function of the chosen m.
function [ PrimPoly ] = GetPrimPoly( )

    global m
    
    switch m
        case 3
            PrimPoly = [0 1];			% i.e. 1+x(+x^3)
        case 4
            PrimPoly = [0 1];			% i.e. 1+x(+x^4)
        case 5
            PrimPoly = [0 2];			% i.e. 1+x^2(+x^5)
        case 6
            PrimPoly = [0 1];			% i.e. 1+x(+x^6)
        case 7
            PrimPoly = [0 3];			% i.e. 1+x^3(+x^7)
        case 8
            PrimPoly = [0 2 3 4];		% i.e. 1+x^2+x^3+x^4(+x^8)
    end

end


% >> Function for creating the mapping table between GF symbols and bit basis.
function [ Table ] = MapGF( PrimPoly )
    global m
	DimGF = 2^m;                                    % Number of elements within the chosen extended GF
    Table = zeros(DimGF,m);                           % Symbol mapping with factors 1+x+x^2+...+x^(m-1)
    for j = 2:DimGF
        TmpPoly = zeros(1,DimGF);
        MaxDeg = j-2;
        TmpPoly(MaxDeg+1) = 1;
        QuotDeg = MaxDeg-m;                         % Quotient degree of polynomial division
        while QuotDeg >= 0
            TmpPoly(MaxDeg+1) = 0;
            for i = 1:length(PrimPoly)
                TmpPoly(QuotDeg+PrimPoly(i)+1) = mod(TmpPoly(QuotDeg+PrimPoly(i)+1)+1,2);
            end
            MaxDeg = find(TmpPoly==1,1,'last')-1;   % i.e. MaxDeg = max(find(tmp==1))-1;
            QuotDeg = MaxDeg-m;
        end
        Table(j,:) = TmpPoly(1:m);                    % Map's i-th row represents the bit basis mapping of the i-th GF symbol
    end
end


% >> Function for interatively computing the code generator polynomial as
%     GenPoly(x) = (x+a)*(x+a^2)*...*(x+a^2t)
function [ GenPoly ] = GetGenPoly( )

    global t
    GenPoly = [2 1 zeros(1,2*t-1)];                         % Initialize generator polynomial as (x+a)
    
    for i = 2:2*t
        
        for j = 2*t+1:-1:1
            
            Tmp = MultGF(GenPoly(j),PowGF(2,i));            % Compute coefficient GenPoly(j)*a^i
            
            if j > 1
                GenPoly(j) = AddGF(Tmp,GenPoly(j-1));       % Compute GenPoly(x)*(x+a^i)
            else
                GenPoly(j) = Tmp;
            end
            
        end
        
    end

end


% >> Function for performing Reed-Solomon encoding in systematic form at bit
% level (redundancy bits are appendend at the beginning of codewords).
% NB: The encoder can handle multiple input messages at a time!
function [ OutBits ] = EncoderRS( InBits, GenPoly )

    global m k n t
    
    nUnsh = 2^m-1;                                      % Unshortened value of n
    kUnsh = nUnsh-2*t;                                  % Unshortened value of k (i.e. 2^m-1-2t)
    Nblk = length(InBits)/(m*k);                        % Number of input messages to be encoded
    OutBits = zeros(1,m*n*Nblk);                        % Output encoded bits

    for i = 1:Nblk
        
        InSymbs = zeros(1,kUnsh);                       % Input message symbols at i-th iteration (or block)
        for j = 1:k
            InSymbs(j) = ConvB2S(InBits(1+(j-1)*m+(i-1)*k*m:j*m+(i-1)*k*m));
        end
    
        TmpPoly = [zeros(1,2*t) InSymbs];               % Temporary polynomial coefficients during redundancy computation
        MaxDeg = nUnsh-1;                               % Starting maximum degree of the upshifted message polynomial
        QuotDeg = MaxDeg-2*t;                           % Quotient degree of polynomial division
    
        while QuotDeg >= 0

            QuotCoef = TmpPoly(MaxDeg+1);               % Quotient coefficient
            
            DivQuotCoef = zeros(1,nUnsh);               % Divisor*Quotient coefficients
            for j = 1:2*t+1
                DivQuotCoef(j+QuotDeg) = MultGF(QuotCoef,GenPoly(j));
            end
        
            for j = 1:nUnsh           
                TmpPoly(j) = AddGF(TmpPoly(j),DivQuotCoef(j));      % Update remainder coefficients
            end

            MaxDeg = find(TmpPoly~=0,1,'last')-1;       % Check remainder new maximum degree [MaxDeg = max(find(tmp==1))-1]
            QuotDeg = MaxDeg-2*t;                       % Update the quotient degree

        end

        ParSymbs = TmpPoly(1:2*t);                      % Parity symbols of the i-th message (or block)
        
        for j = 1:2*t
            OutBits(1+(j-1)*m+(i-1)*n*m:j*m+(i-1)*n*m) = ConvS2B(ParSymbs(j));      % Retrieve and write redundancy bits to output stream
        end
        
        OutBits(1+m*(i*n-k):i*m*n) = InBits(1+(i-1)*k*m:i*k*m);     % Copy current block message bits into output stream
        
    end
    
end


% >> Function for performing Reed-Solomon decoding in systematic at bit level
%     (redundancy bits are expected at the beginning of codewords).
% 	NB: The decoder can handle multiple input codewords at a time!
function [ OutBits, Nerr ] = DecoderRS( InBits )

    global m t n k
    nUnsh = 2^m-1;                                                  % Unshortened value of n
    Nblk = length(InBits)/(m*n);                                    % Number of input codeword to be decoded
    OutBits = zeros(1,m*k*Nblk);                                    % Output encoded bits
    IoSymbs = zeros(1,nUnsh);                                       % Codeword symbols at i-th iteration (or block)
%    Nerr = 0;                                                       % Number of corrupted symbols detected

    for i = 1:Nblk

        for j = 1:n
            IoSymbs(j) = ConvB2S(InBits(1+(j-1)*m+(i-1)*n*m:j*m+(i-1)*n*m));    % Bit to GF symbol conversion
        end
        
        Syndr = GetSyndrome(IoSymbs);                               % Estimate the syndrome polynomial
        
        if ~isequal(Syndr,zeros(1,2*t))                             % If the presence of errors is detected
            
            Sigma = BerlekMasseyAlg(Syndr);                         % Calculate the Sigma(x) polynomial
            ErrLoc = ChienAlg(Sigma);                               % Estimate the errors location
            Omega = KeyAlg(Syndr,Sigma);                            % Calculate the Omega(x) polynomial
            ErrVal = ForneyAlg(Omega,ErrLoc);                       % Estimate the errors magnitude
            IoSymbs = CorrectErr(IoSymbs,ErrLoc,ErrVal);            % Perform the error correction
%            Nerr = sum(ErrLoc~=0);

        end
        
        for j = 1:k
            OutBits(1+(j-1)*m+(i-1)*k*m:j*m+(i-1)*k*m) = ConvS2B(IoSymbs(j+2*t));   % Remove redundancy and retrieve input bits from symbols
        end
        
    end
    
end



% >> Function for getting the bit basis corresponding to the input GF symbol.
function [ OutVect ] = ConvS2B( InSymb )

    global Table
    OutVect = Table(InSymb+1,:);
    
end


% >> Function for getting the GF symbol corresponding to the input bit basis.
function [ OutSymb ] = ConvB2S( InVect )

    global Table
    DimGF = size(Table,1);                                  % Galois field dimension (i.e. 2^m)
    
    for j = 1:DimGF
        if isequal(InVect,Table(j,:))
            OutSymb = j-1;
            break;
        end
    end
    
end


% >> Function for performing addition in GF(2^m).
function [ SymbRes ] = AddGF( SymbA, SymbB )

    global Table
    DimGF = size(Table,1);
    BasisRes = xor(Table(SymbA+1,:),Table(SymbB+1,:));      % Compute GF addition between the bit basis
    
    for j = 1:DimGF
        if isequal(BasisRes,Table(j,:))
            SymbRes = j-1;
            break;
        end    
    end

end


% >> Function for performing multiplication in GF(2^m).
function [ SymbRes ] = MultGF( SymbA, SymbB )

    global Table
    DimGF = size(Table,1);
    
    if SymbA == 0 || SymbB == 0
        SymbRes = 0;
    else
        SymbRes = mod(SymbA+SymbB-2,DimGF-1)+1;
    end

end


% >> Function for performing power operation in GF(2^m).
%     NB#1: to get "alpha^(w)" use "PowGF(2,w)"
%     NB#2: to get "alpha^(-w)" use "PowGF(2,-w)"
%     NB#3: to get "Symb^-1" use "PowGF(2,-Symb+1)" and keep in mind
%           the identity "MultGF(Symb,PowGF(2,-Symb+1))=1"
function [ SymbRes ] = PowGF( SymbBase, Exp )

    global Table
    DimGF = size(Table,1);
    
    if SymbBase == 0
        SymbRes = 0;
    else
        SymbRes = mod((SymbBase-1)*Exp,DimGF-1)+1;
    end
    
end


% >> Function for estimating the syndromes vector of the input codeword
%     (the 0-degree coefficient is omitted, since always 0).
function [ SyndrVect ] = GetSyndrome( CwSymbs )

    global m t
    nUnsh = 2^m-1;                          % Unshortened value of n
    SyndrVect = zeros(1,2*t);
    
    for i = 1:2*t                           % Compute syndrome polynomial Syndr(x) as Cw(x) for x = a, a^2, ..., a^2t
        
        SumValue = CwSymbs(1);      
        for j = 2:nUnsh
            SumValue = AddGF(SumValue,MultGF(CwSymbs(j),PowGF(i+1,j-1)));
        end 
        SyndrVect(i) = SumValue;
        
    end

end


% >> Function for executing the Berlekamp-Massey algorithm to iteratively
%     estimate the error locator polynomial Sigma(x) [3].
function [ SigmaC ] = BerlekMasseyAlg( Syndr )

    global t
    SigmaC = [1 zeros(1,t)];                % Sigma(x) polynomial at current iteration
    SigmaN = zeros(1,t+1);                  % Sigma(x) polynomial at next iteration
    Tau = [0 1 zeros(1,t-1)];               % Tau(x) polynomial
    Ec = 0;                                 % Current number of assumed errors
    h = -1;                                 % Error iteration counter

    for i = 0:2*t-1
        
        if Ec <= t
        
            Delta = GetDiscrepancy(Syndr,SigmaC,Ec,i);                      % Compute discrepancy at i-th iteration

            if (Delta ~= 0)

                for j = 1:t+1
                    SigmaN(j) = AddGF(SigmaC(j),MultGF(Delta,Tau(j)));      % Compute next value of Sigma(x) polynomial
                end

                if Ec < i-h

                    En = i-h;                   % Compute next value of E
                    h = i-Ec;

                    for j = 1:t+1
                        Tau(j) = MultGF(PowGF(2,-Delta+1),SigmaC(j));       % Update Tau(x) as Sigma(x)/Delta 
                    end

                    Ec = En;                    % Update E

                end

                SigmaC = SigmaN;                % Update Sigma(x)

            end

            Tau = circshift(Tau,1);             % Multiply Tau(x) by x
            Tau(1) = 0;                         % Reset the 0-degree coefficient of Tau(x)
            
        end
  
    end
    
end


% >> Function for calculating the discrepancy within the Berlekamp-Massey algorithm [3].
function [ Delta ] = GetDiscrepancy( Syndr, Sigma, Nerr, Iter )

    Delta = 0;
    
    for j = 0:Nerr
        Delta = AddGF(Delta,MultGF(Sigma(j+1),Syndr(Iter-j+1)));
    end
    
end


% >> Function for executing the Chien search algorithm to estimate the error
%     positions of the corrupted symbols by finding the roots of Sigma(x) [2].
function [ ErrLoc ] = ChienAlg( Sigma )

    global m t
    nUnsh = 2^m-1;                                      % Unshortened value of n
    ErrLoc = zeros(1,t);
    Idx = 1;
    
    for i = 1:nUnsh
        
        Root = Sigma(1);
        for j = 2:t+1
            Root = AddGF(Root,MultGF(Sigma(j),PowGF(i,j-1)));   % Evaluate Sigma(x) for x = a, a^2, ..., a^(DimGF-2)
        end
        
        if Root == 0 && Idx <= t
            ErrLoc(Idx) = PowGF(i,-1);
            Idx = Idx+1;
        end
        
    end
    
end


% >> Function for estimating the Omega polynomial from the Key equation [2]
%     Omega(x)=mod((1+Syndr(x))*Sigma(x),x^(2t+1)).
function [ Omega ] = KeyAlg( Syndr, Sigma )

    global t
    Omega = zeros(1,2*t+t+1);
    
    Syndr = [1 Syndr];              % Padding for getting the polynomial 1+Syndr(x)
    for i = 1:t+1
        for j = 1:2*t+1
            Omega(i+j-1) = AddGF(Omega(i+j-1),MultGF(Sigma(i),Syndr(j)));
        end
    end
    
    Omega = Omega(1:2*t+1);         % Compute the remainder of Omega(x)/x^(2t+1)
    
end


% >> Function for executing the Forney algorithm to estimate the error
%     magnitudes of the corrupted symbols [2].
function [ ErrVal ] = ForneyAlg( Omega, ErrLoc )

    global t
    ErrVal = zeros(1,t);
    
    for i = 1:t
        
        if ErrLoc(i) ~= 0

            Root =  PowGF(ErrLoc(i),-1);

            Num = Omega(1);
            for j = 2:2*t+1
                Num = AddGF(Num,MultGF(Omega(j),PowGF(Root,j-1)));
            end

            Den = 1;
            for j = 1:t
                if i ~= j
                    Den = MultGF(Den,AddGF(1,MultGF(Root,ErrLoc(j))));
                end
            end

            ErrVal(i) =  MultGF(Num,PowGF(2,-Den+1));
            
        end
        
    end
    
end


% >> Function for correcting the corrupted symbols with the estimated
%     error locations and magnitudes.
function [ IoSymbs ] = CorrectErr( IoSymbs, ErrLoc, ErrVal )

    global t
    
    for j = 1:t
        if ErrLoc(j) ~= 0
            IoSymbs(ErrLoc(j)) = AddGF(IoSymbs(ErrLoc(j)),ErrVal(j));
        end
    end
    
end



%%  EXTRA FUNCTIONS

% >> Function for calculating the number of wrong bits and symbols before and after the decoding
function [ ChanBitErr, ChanSymbErr, DecBitErr ] = CheckErr( SrcBits, EncBits, DetBits, DecBits)

    global m n

    ChanBitErr = sum(EncBits~=DetBits);
    DecBitErr = sum(SrcBits~=DecBits);
    
    ChanSymbErr = 0;
    for j = 1:n
        if ~isequal(EncBits(1+(j-1)*m:j*m),DetBits(1+(j-1)*m:j*m))
            ChanSymbErr = ChanSymbErr+1;
        end
    end

end



%% NOTES

% NB#1: Since in all these simulations, M = 1 (i.e. antipodal real symbols) and osf = 1 (i.e. Fs = Rs)
%     Eb/N0 and SNR coincide. Thus, in this case feeding the MATLAB built-in function awgn() with Eb/N0
%     (and not SNR) is correct anyway.
