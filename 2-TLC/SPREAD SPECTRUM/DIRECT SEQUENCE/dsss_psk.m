
%%% Title: DIRECT-SEQUENCE SPREAD SPECTRUM
%%% Author: Filippo Valmori
%%% Date: 17/06/2022
%%% Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.12)

close all; clearvars; clc


%% PARAMETERS AND CONSTANTS

Nbits = 3000;                                           % Number of bits to be simulated
Rb = 10e3;                                              % Bit rate [b/s]
Ncel = 9;                                               % Number of shift-register cells for pseudo-noise sequence generation (NB: PN-sequence length = 2^Ncel-1)
Xc = 9;                                                 % Chip factor (NB: shall be not lerger than 2^Ncel-1) [.]
M = 4;                                                  % Modulation order
EbJ0 = 5;                                               % Energy-per-bit-to-jamming-power-spectral-density ratio (Eb/J0) [dB] [see NOTE#4]
osf = 8;                                                % BB oversampling factor (and also sps factor for RCC filter design)
span = 8;                                               % Span for RRC filter representation [S]
beta = 0.5;                                             % Roll-off factor for RRC filter representation
Ndummy = 0;                                             % Number of dummy zero-symbols to be appended at the beginning and end of Tx stream [S]

Rs = Rb/log2(M);                                        % Symbol rate [S/s]
Rc = Xc*Rs;                                             % Chip rate [C/s]
ConstOfs = (1-M)*pi/M;                                  % Constellation phase offset [rad]
Fs1 = osf*Rs;                                           % Baseband sample rate [Sa/s]
Fs2 = osf*Rs*Xc;                                        % DSSS baseband sample rate [Sa/s]

WaveXlim = 2e-3;                                        % Limit on X-axis for BB and RF waveform plot [s]
SpectXlim = Fs1/1.5e3;                                  % Limit on X-axis for BB spectrum plot [kHz]
SpectYlim1 = -120;                                      % Lower limit on Y-axis for BB spectrum plot [dBW]
SpectYlim2 = -20;                                       % Upper limit on Y-axis for BB spectrum plot [dBW]

Blue = [.2 .2 1];                                       % Custom blue color
Green = [.2 .8 .2];                                     % Custom green color
Orange = [1 .8 .2];                                     % Custom orange color
Violet = [.8 0 .8];                                     % Custom violet color
Azure = [0 .8 .8];                                      % Custom azure color
Red = [1 .2 0];                                         % Custom red color
Brown = [.5 .2 0];                                      % Custom brown color
Grey = [.65 .65 .65];                                   % Custom grey color



%% 1. SINGLE RUN WITH/WITHOUT DSSS (JAMMER)

TxBits = randi([0 1],1,Nbits);                                          % Random source bits generation
PskTable = GetPskTable(M,ConstOfs);                                     % Retrieve PSK constellation table
[TxSy1,TimeRs1] = Mapper(TxBits,PskTable,Ndummy,Rs);                    % Bit-to-symbol mapping
[TxSgn1,Time1] = PulseShaper(TxSy1,beta,span,osf,Rs);                   % SRRC pulse shaping to get the Tx baseband waveform
[TxFreq1,TxSpect1,OvtTxPwr1] = GetSpect(TxSgn1,Fs1);                    % FFT for evaluating the Tx baseband power spectrum
SJR = 10*log10(10^(EbJ0/10)*log2(M)/osf);                               % Signal-to-jamming power ratio (S/J) [dB]
ChanSgn1 = awgn(TxSgn1,SJR,'measured');                                 % Apply jamming interference
RxSgn1 = RccFilter(ChanSgn1,beta,span,osf);                             % Rx baseband signal after matched SRRC filtering
[RxFreq1,RxSpect1,OvRxPwr1] = GetSpect(RxSgn1,Fs1);                     % FFT for evaluating the Tx baseband power spectrum
RxSy1 = downsample(RxSgn1,osf);                                         % Down-sampling from samples to symbols
RxBits1 = Demapper(RxSy1(1+Ndummy:end-Ndummy),PskTable);                % PSK hard demapping
NerrB1 = sum(TxBits~=RxBits1);                                          % Check number of errors [b]
fprintf(" >> PSK IN JAMMED CHANNEL <<\n")
fprintf(" * %1.2f dBW = Tx power\n",OvtTxPwr1);
fprintf(" * %1.2f dBW = Rx power\n",OvRxPwr1);
fprintf(" * %d out of %d bits = Number of errors\n",NerrB1,Nbits);
 
TxDsBits2 = SprDS_TX(TxBits,Xc,Ncel);                                   % Apply DSSS spreading
[TxSy2,TimeRs2] = Mapper(TxDsBits2,PskTable,Ndummy,Rc);                 % Bit-to-symbol mapping
[TxSgn2,Time2] = PulseShaper(TxSy2,beta,span,osf,Rc);                   % SRRC pulse shaping to get the Tx baseband waveform
[TxFreq2,TxSpect2,OvTxPwr2] = GetSpect(TxSgn2,Fs2);                     % FFT for evaluating the Tx baseband power spectrum (see NOTE#1)
ChanSgn2 = awgn(TxSgn2,SJR,'measured');                                 % Apply jamming interference (uniform in BW)
RxSgn2 = RccFilter(ChanSgn2,beta,span,osf);                             % Rx baseband signal after matched SRRC filtering
[RxFreq2,RxSpect2,OvRxPwr2] = GetSpect(RxSgn2,Fs2);                     % FFT for evaluating the Tx baseband power spectrum
RxSy2 = downsample(RxSgn2,osf);                                         % Down-sampling from samples to symbols
RxDsBits = Demapper(RxSy2(1+Ndummy:end-Ndummy),PskTable);               % PSK hard demapping
NerrC2 = sum(TxDsBits2~=RxDsBits);                                      %  Check number of errors [c]
RxBits2 = SprDS_RX(RxDsBits,Xc,Ncel);                                   % Apply DSSS de-spreading
NerrB2 = sum(TxBits~=RxBits2);                                          % Check number of errors [b]
fprintf("\n >> DSSS-PSK IN JAMMED CHANNEL <<\n")
fprintf(" * %1.2f dBW = Tx power\n",OvTxPwr2);
fprintf(" * %1.2f dBW = Rx power\n",OvRxPwr2);
fprintf(" * %d out of %d chips = Number of errors\n",NerrC2,length(TxDsBits2));
fprintf(" * %d out of %d bits = Number of errors\n",NerrB2,Nbits);
 
figure('Name','1. Direct-Sequence Spread-Spectrum | TX','NumberTitle','off')
subplot(2,2,1); hold on; box on
stem(TimeRs1*1e3,real(TxSy1),'b*:')
stem(TimeRs1*1e3,imag(TxSy1),'r*:')
plot(Time1*1e3,real(TxSgn1),'b.-')
plot(Time1*1e3,imag(TxSgn1),'r.-')
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
% legend(' Symb (I)',' Symb (Q)',' Wave (I)',' Wave (Q)')
axis([0 WaveXlim*1e3 1.2*[-1 1]]);
hold off
title('PSK WAVEFORMS');
subplot(2,2,2); hold on; box on
plot(TxFreq1/1e3,TxSpect1,'-','Color',Green)
xlabel('Frequency [kHz]'); ylabel('Power [dBW/Hz]')
axis([SpectXlim*[-1 1] SpectYlim1 SpectYlim2])
title('PSK SPECTRUM'); grid on
subplot(2,2,3); hold on; box on
stem(TimeRs2*1e3,real(TxSy2),'b*:')
stem(TimeRs2*1e3,imag(TxSy2),'r*:')
plot(Time2*1e3,real(TxSgn2),'b.-')
plot(Time2*1e3,imag(TxSgn2),'r.-')
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
% legend(' Symb (I)',' Symb (Q)',' Wave (I)',' Wave (Q)')
axis([0 WaveXlim*1e3 1.2*[-1 1]]);
hold off
title('DSSS-PSK WAVEFORMS');
subplot(2,2,4); hold on; box on
plot(TxFreq2/1e3,TxSpect2,'-','Color',Green)
xlabel('Frequency [kHz]'); ylabel('Power [dBW/Hz]')
axis([SpectXlim*[-1 1] SpectYlim1 SpectYlim2])
title('DSSS-PSK SPECTRUM'); grid on

figure('Name','2. Direct-Sequence Spread-Spectrum | RX','NumberTitle','off')
hold on; box on
stem(TimeRs2*1e3,real(TxSy2),'b*:')
stem(TimeRs2*1e3,imag(TxSy2),'r*:')
plot(Time2*1e3,real(RxSgn2),'b.-')
plot(Time2*1e3,imag(RxSgn2),'r.-')
xlabel('Time [ms]'); ylabel('Amplitude [V]'); grid on
axis([0 WaveXlim*1e3 1.5*[-1 1]]);
hold off



%% 2. BER COMPARISON WITH/WITHOUT DSSS (JAMMER)

%  EbJ0In = -9;                                                            % Initial Eb/J0 value (common) [dB]
%  EbJ0St = 0.5;                                                           % Eb/J0 step [dB]
%  EbJ0Fn = [8 4.5 2.5 1];                                                 % Final Eb/J0 values (for each Xc) [dB]
%  Xc = [0 3 5 7];                                                         % Chip factors (NB: "0" means no DSSS)
%  MinErr = 250;                                                           % Base of the minimum number of errors for BER estimate
%  LenXc = length(Xc);
%  BER = cell(1,LenXc);
%  Peb = cell(1,LenXc);
%  PskTable = GetPskTable(M,ConstOfs);                                     % Retrieve PSK constellation table
%  for i = 1:LenXc
%      EbJ0 = EbJ0In:EbJ0St:EbJ0Fn(i);                                     % Get Eb/N0 range for specific Xc [dB]
%      LenEbJ0 = length(EbJ0);
%      BER{i} = zeros(1,LenEbJ0);
%      if Xc(i) == 0                                                       % PSK case
%          EbJ0lin = 10.^(EbJ0/10);
%          Peb{i} = 1/log2(M)*erfc(sqrt(EbJ0lin*log2(M))*sin(pi/M));
%      else                                                                % DSSS-PSK cases
%          EbJ0lin = 10.^(EbJ0/10);
%          SF = 1;
% %          SF = 1+(Xc(i)+2)/100;                                           % Scaling factor to match theoretical and experimental results (?)
%          Peb{i} = 1/log2(M)*erfc(sqrt(ceil(Xc(i)/2)*EbJ0lin*log2(M))*sin(pi/M)*SF);
%      end
%      for j = 1:LenEbJ0
%          fprintf(" %d | %d\n",i,j);
%          Nerr = 0;                                                       % Error counter
%          Ncyc = 0;                                                       % Cycle counter
%          SJR = 10*log10(10^(EbJ0(j)/10)*log2(M)/osf);                    % Signal-to-jammer ratio (S/J) [dB] (BW increased by Xc and J0 reduced by Xc, since jammer has finite power)
%          while Nerr < MinErr*(LenEbJ0-j+1)                               % NB: Lower Eb/N0 require greater number of errors to get a reliable statistic
%              Ncyc = Ncyc+1;
%              TxBits = randi([0 1],1,Nbits);
%              if Xc(i) == 0                                               % PSK case                          
%                  [TxSy,~] = Mapper(TxBits,PskTable,Ndummy,Rs);
%                  [TxSgn,~] = PulseShaper(TxSy,beta,span,osf,Rs);
%                  ChanSgn = awgn(TxSgn,SJR,'measured');
%                  RxSgn = RccFilter(ChanSgn,beta,span,osf);
%                  RxSy = downsample(RxSgn,osf);
%                  RxBits = Demapper(RxSy(1+Ndummy:end-Ndummy),PskTable);
%              else                                                        % DSSS-PSK cases
%                  TxDsBits = SprDS_TX(TxBits,Xc(i),Ncel);
%                  [TxSy,~] = Mapper(TxDsBits,PskTable,Ndummy,Rs*Xc(i));
%                  [TxSgn,~] = PulseShaper(TxSy,beta,span,osf,Rs*Xc(i));
%                  ChanSgn = awgn(TxSgn,SJR,'measured');
%                  RxSgn = RccFilter(ChanSgn,beta,span,osf);
%                  RxSy = downsample(RxSgn,osf);
%                  RxDsBits = Demapper(RxSy(1+Ndummy:end-Ndummy),PskTable);
%                  RxBits = SprDS_RX(RxDsBits,Xc(i),Ncel);
%              end
%              Nerr = Nerr+sum(TxBits~=RxBits); 
%          end
%          BER{i}(j) = Nerr/(Ncyc*Nbits);
%  
%      end
%  end
%  
%  markers = {'-x','-*','-o','-d'};
%  labels = [{' Exp-PSK'};{' The-PSK'}; ...
%      {sprintf(' Exp-DSSS-PSK (Xc=%d)',Xc(2))};{sprintf(' The-DSSS-PSK (Xc=%d)',Xc(2))}; ...
%      {sprintf(' Exp-DSSS-PSK (Xc=%d)',Xc(3))};{sprintf(' The-DSSS-PSK (Xc=%d)',Xc(3))}; ...
%      {sprintf(' Exp-DSSS-PSK (Xc=%d)',Xc(4))};{sprintf(' The-DSSS-PSK (Xc=%d)',Xc(4))};];
%  colors = {Blue;Red;Green;Orange};
%  figure
%  for i = 1:LenXc
%      EbJ0 = EbJ0In:EbJ0St:EbJ0Fn(i);
%      semilogy(EbJ0,BER{i},markers{i},'Color',colors{i});
%      hold on
%      semilogy(EbJ0,Peb{i},'-.','Color',colors{i});
%      hold on
%  end
%  xlabel('Eb/J0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
%  title(sprintf('JAMMED CHANNEL PERFORMANCE COMPARISON (M=%d)',M))
%  xticks(floor(EbJ0In):ceil(max(EbJ0Fn)))
%  axis([floor(EbJ0In)-0.5 ceil(max(EbJ0Fn))+0.5 0.99e-4 1])
%  grid on; hold off



%% 3. BER COMPARISON WITH/WITHOUT DSSS (AWGN)

% EbN0In = -9;                                                            % Initial Eb/N0 value (common) [dB]
% EbN0St = 0.5;                                                           % Eb/N0 step [dB]
% EbN0Fn = 8;                                                             % Final Eb/N0 values [dB]
% Xc = [1 3 5 7];                                                         % Chip factors (NB: "1" means no DSSS)
% MinErr = 250;                                                           % Base of the minimum number of errors for BER estimate
% LenXc = length(Xc);
% BER = cell(1,LenXc);
% PskTable = GetPskTable(M,ConstOfs);                                     % Retrieve PSK constellation table
% EbN0 = (EbN0In:EbN0St:EbN0Fn);                                          % Get Eb/N0 range for specific Xc [dB]
% LenEbN0 = length(EbN0);
% Peb = 1/log2(M)*erfc(sqrt(10.^(EbN0/10)*log2(M))*sin(pi/M));
% for i = 1:LenXc
%     BER{i} = zeros(1,LenEbN0);
%     for j = 1:LenEbN0
%         fprintf(" %d | %d\n",i,j);
%         Nerr = 0;                                                       % Error counter
%         Ncyc = 0;                                                       % Cycle counter
%         SNR = 10*log10(10^(EbN0(j)/10)*log2(M)/(osf*Xc(i)));            % Signal-to-noise ratio (S/N) over AWGN channel [dB] (NB: divided by Xc because BW extends by Xc but N0 remains constant, since thermal noise has infinite power!)
%         while Nerr < MinErr*(LenEbN0-j+1)                               % NB: Lower Eb/N0 require greater number of errors to get a reliable statistic
%             Ncyc = Ncyc+1;
%             TxBits = randi([0 1],1,Nbits);
%             if Xc(i) == 1                                               % PSK case                          
%                 [TxSy,~] = Mapper(TxBits,PskTable,Ndummy,Rs);
%                 [TxSgn,~] = PulseShaper(TxSy,beta,span,osf,Rs);
%                 ChanSgn = awgn(TxSgn,SNR,'measured');
%                 RxSgn = RccFilter(ChanSgn,beta,span,osf);
%                 RxSy = downsample(RxSgn,osf);
%                 RxBits = Demapper(RxSy(1+Ndummy:end-Ndummy),PskTable);
%             else                                                        % DSSS-PSK cases
%                 TxDsBits = SprDS_TX(TxBits,Xc(i),Ncel);
%                 [TxSy,~] = Mapper(TxDsBits,PskTable,Ndummy,Rs*Xc(i));
%                 [TxSgn,~] = PulseShaper(TxSy,beta,span,osf,Rs*Xc(i));
%                 ChanSgn = awgn(TxSgn,SNR,'measured');
%                 RxSgn = RccFilter(ChanSgn,beta,span,osf);
%                 RxSy = downsample(RxSgn,osf);
%                 RxDsBits = Demapper(RxSy(1+Ndummy:end-Ndummy),PskTable);
%                 RxBits = SprDS_RX(RxDsBits,Xc(i),Ncel);
%             end
%             Nerr = Nerr+sum(TxBits~=RxBits); 
%         end
%         BER{i}(j) = Nerr/(Ncyc*Nbits);
% 
%     end
% end
% 
% markers = {'-x','-*','-o','-d'};
% labels = [{' The-PSK'}; {' Exp-PSK'}; ...
%     {sprintf(' Exp-DSSS-PSK (Xc=%d)',Xc(2))}; ...
%     {sprintf(' Exp-DSSS-PSK (Xc=%d)',Xc(3))}; ...
%     {sprintf(' Exp-DSSS-PSK (Xc=%d)',Xc(4))};];
% 
% colors = {Blue;Red;Green;Orange};
% figure
% semilogy(EbN0,Peb,'-.','Color','k');
% hold on
% for i = 1:LenXc
%     semilogy(EbN0,BER{i},markers{i},'Color',colors{i});
%     hold on
% end
% xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
% title(sprintf('AWGN CHANNEL PERFORMANCE COMPARISON (M=%d)',M))
% xticks(floor(EbN0In):ceil(max(EbN0Fn)))
% axis([floor(EbN0In)-0.5 ceil(max(EbN0Fn))+0.5 0.99e-4 1])
% grid on; hold off



%% FUNCTIONS

% Function for generating a pseudo-random sequence from a shift-register.
function [ OutSq ] = GetChipSeq( Ncel )
    InSt = [1 zeros(1,Ncel-1)];
    Cel = InSt;
    LenSq = 2^Ncel-1;
    OutSq = zeros(1,LenSq);
    for j = 1:LenSq
        %Tmp = mod(Cel(Ncel)+Cel(Ncel-1)+Cel(Ncel-3),2);
        Tmp = mod(Cel(1)+Cel(3)+Cel(6)+Cel(9),2);
        OutSq(j) = Cel(Ncel);
        for i = Ncel:-1:2
            Cel(i) = Cel(i-1);
        end
        Cel(1) = Tmp;
    end
end

% Function for applying Direct-Sequence Spread Spectrum on the input bitstream on TX side.
function [ OutBits ] = SprDS_TX( InBits, Xc, Ncel )
    PrSeq = GetChipSeq(Ncel);                                                   % Retrieve pseudo-random sequence
    InLen = length(InBits);
    OutLen = Xc*InLen;
    OutBits = zeros(1,OutLen);
    for j = 0:OutLen-1
        InIdx = floor(j/Xc)+1;
        ChIdx = mod(j,length(PrSeq))+1;
        OutBits(j+1) = mod(InBits(InIdx)+PrSeq(ChIdx),2);                       % apply XOR operation
    end
end

% Function for de-applying Direct-Sequence Spread Spectrum on the input bitstream on RX side.
function [ OutBits ] = SprDS_RX( InBits, Xc, Ncel )
    PrSeq = GetChipSeq(Ncel);                                                   % Retrieve pseudo-random sequence
    InLen = length(InBits);
    OutLen = InLen/Xc;
    OutBits = zeros(1,OutLen);
    Sum = 0;
    for j = 0:InLen-1
        ChIdx = mod(j,length(PrSeq))+1;
        Sum = Sum+mod(InBits(j+1)+PrSeq(ChIdx),2);
        if mod(j,Xc) == Xc-1
            if Sum > Xc-Sum                                                     % Apply maximum likelihood criteria
                OutBits((j+1)/Xc) = 1;
            else
                OutBits((j+1)/Xc) = 0;
            end
            Sum = 0;
        end
    end
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
    for j=1:length(RccTaps)
        fprintf("%d | %1.7f\n",j,RccTaps(j));
    end
    input()
    
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
function [ TxSgnBB, TimeBB ] = PulseShaper( TxSymbs, beta, span, osf, Rs)
    FsBB = Rs*osf;
    Nsymbs = length(TxSymbs);
    TimeBB = 1/FsBB*(0:Nsymbs*osf-1);                                           % Time axis for baseband waveform
    TxSgnBB = upsample(TxSymbs,osf);                                            % Symbol-to-samples upsampling 
    TxSgnBB = RccFilter(TxSgnBB,beta,span,osf);                                 % Root-raised-cosine filteringal
end


%% NOTES

% 1. Note that the DSSS-PSK signal shall NOT be scaled (e.g. by a factor Xc), since as can be seen from the "fprintf" results the
%    PSK and DSSS-PSK signals already have the same overall power (in dBW). That's because the power spectrum reduction (in terms
%    of amplitude) is caused only by the spreading operation (see "SprDS_TX" function). As can be seen, the spreading operation
%    widens the power spectrum (in frquency) and reduces, but the overall signal power (calculated as the integral of the power
%    spectrum along athe entire frequency axis) remains unchanged. Thus, the higher Xc (and in turn Rc) the lower the power spectrum
%    amplitude gets!
%    As a confirmation think about the formula for estimating power through RMS, i.e. P = Vrms^2/R (where Vrms = sqrt(1/N*sum(Vi^2)).
%    Even if Rc becomes much higher than the original Rs, the modulated wave generated must have the same amplitde in time also for
%    DSSS-PSK case, otherwise P would not remain unchanged.

% 2. The Eb/J0 parameter refers to the PSK case without DSSS, thus assuming the jammer has a fixed total power J [W] and decides to
%    spread it all over the signal bandwidth (osf), resulting in the uniform jamming spectral density J0 [W/Hz]. Then, when DSSS is
%    applied it is assumed that the jammer reconfigures itself in order to spread its power (again J) over the new bandwidth (Xc*osf),
%    causing J0 to drop by a factor of Xc (thus, SJR = Eb/(J0/Xc)*log2(M)/(osf*Xc) remains the same as in the pure PSK case. As a
%    consequence, DSSS-PSK performace in terms of BER is clearly better than that of normal PSK, since the jammer power is finite (and
%    fixed), the noise in the extra-DSSS bandwidth is calceled by the RX despreading operation, and also more signal bandwidth is used
%    to create redundancy for the symbol decision. Note this improvement is possible ONLY because the jammer power is finite. In fact,
%    for the AWGN case (where the noise power is infinite and N0 [W/Hz] constant regardless of the signal bandwidth) there is no
%    advantage in using spread spectrum technique. In fact, as can be seen from the simulation of scenario #3 the risults with and without
%    DSSS are more or less the same (just 1.5 dB difference in terms of performance).

% 3. Note that the power of the TX waveform changes by modifying the "osf" parameter. This is because the SRRC filter shape depends
%    on the "sps" factor (the higher sps the lower the SRRC filter impulse response amplitude). However, note that the RX power (i.e.
%    after applying the SRRC filtering for the 2nd time) is constant and independent of "osf".
% 3. Note that the power of the TX waveform changes by modifying the "osf" parameter. This is because the SRRC filter shape depends
%    on the "sps" factor (the higher sps the lower the SRRC filter impulse response amplitude). However, note that the RX power (i.e.
%    after applying the SRRC filtering for the 2nd time) is constant and independent of "osf".
