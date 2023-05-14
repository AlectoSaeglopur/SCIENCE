
%%% Title: FSK PERFORMANCES OVER AWGN CHANNEL
%%% Author: Filippo Valmori
%%% Date: 12/08/2022
%%% Description: Comparison between experimetal/simulated BER and thoretical
%%%              probability of error for non-coherent M-FSK modulations.


close all; clearvars; clc


%% PARAMETERS

Nbits = 1200;                                                   % Number of bits simulated per cycle [b]
Rb = 6e3;                                                       % Bit rate [b/s]
dev = 3e3;                                                      % Inner frequency deviation [Hz]
osf = 64;                                                       % Baseband oversampling factor

InitEbN0 = 0;                                                   % Starting value of Eb/N0 [dB]
StepEbN0 = 0.5;                                                 % Eb/N0 incremental step [dB]
FinEbN0 = [13 10.5 9 8];                                        % Ending value of Eb/N0 [dB]
M = [2 4 8 16];                                                 % Modulation orders
MinErr = 100;                                                   % Minimum number of errors per Eb/N0

Blue = [.2 .2 1];                                               % Custom blue color
Green = [.2 .8 .2];                                             % Custom green color
Orange = [1 .7 .2];                                             % Custom orange color
Violet = [.8 0 .8];                                             % Custom violet color
Red = [1 .2 0];                                                 % Custom red color
ColorMtx = [Blue; Red; Green; Orange; Violet];



%% PROCESSING

LenM = length(M);

% BER = zeros(1,LenEbN0);
BER = cell(1,LenM);

for i = 1:LenM
    
    EbN0 = InitEbN0:StepEbN0:FinEbN0(i);
    LenEbN0 = length(EbN0);
    BER{i} = zeros(1,LenEbN0);
    
    Rs = Rb/log2(M(i));                                         % Symbol rate [S/s]
    h = 2*(M(i)-1)*dev/Rs;                                      % Modulation index
    Fs = osf*Rs;                                                % Baseband sample rate [Sa/s]
    Ts = 1/Fs;                                                  % Baseband sample period [s]
    
    fprintf('* M = %d | h = %1.1f\n',M(i),h);
    tic
    
    [Map,GrayMtx] = GetMap(M(i));
    DemThr = -2^log2(M(i))+2*(1:M(i)-1);

    for j = 1:LenEbN0

        Nberr = 0;                                           	% Bit error counter
        Ncycles = 0;                                            % Cycle counter
        ThErr = MinErr*(LenEbN0-j+1);

        while Nberr < ThErr
            Ncycles = Ncycles+1;
            [TxBits,TxSymbs,Nsymbs] = GetSymbs(Map,Nbits);
            FskSamps = dev*repelem(TxSymbs,osf);
            Time = Ts*(0:Nsymbs*osf-1);                                         % Time axis for BB waveform
            FskWaveI = cos(2*pi*FskSamps.*Time);                                % In-phase part of the FSK baseband waveform
            FskWaveQ = sin(2*pi*FskSamps.*Time);                                % Quadrature part of the FSK baseband waveform
            FskSgnBB = FskWaveI+1i*FskWaveQ;                                    % FSK complex baseband signal
            SNR = 10*log10(10^(EbN0(j)/10)*log2(M(i))/osf);                     % Signal-to-noise ratio (S/N) [dB]
            ChanSamps = awgn(FskSgnBB,SNR,'measured');                          % AWGN channel
            RxBits = FreqDemod2(ChanSamps,M(i),dev,osf,GrayMtx,Fs);
            Nberr = Nberr+sum(TxBits~=RxBits);                                  % Error check
        end

        BER{i}(j) = Nberr/(Ncycles*Nbits);
        
    end
    
    toc
    
end
   


%% THEORETICAL PROBABILITY OF ERROR

PeTheory = cell(1,LenM);
for j = 1:LenM
    EbN0 = InitEbN0:StepEbN0:FinEbN0(j);
    LenEbN0 = length(EbN0);
    PeTheory{j} = zeros(1,LenEbN0);
%     PeTheory(j,:) = M(j)/2*erfc(sqrt(10.^(EbN0/10)*log2(M(j))));                % Coherent FSK from Sklar's formulas 4.107 and 4.112
%     PeTheory(j,:) = 1/2*(M(j)/2)*erfc(sqrt(10.^(EbN0/10)*log2(M(j))/2));        % Coherent FSK modified (since "erfc" definition is different between Sklar and Matlab! (see NOTE#2)
    PeTheory{j} = M(j)/4*exp(-10.^(EbN0/10)*log2(M(j))/2);                    % Non-coherent FSK nfrom Sklar's formulas 4.96 and 4.111
end



%% PLOTS

figure; box on
for j = 1:LenM
    EbN0 = InitEbN0:StepEbN0:FinEbN0(j);
    ThLeg = [' ',num2str(M(j)),'-FSK | Theoretical'];
    ExpLeg = [' ',num2str(M(j)),'-FSK | Experimental'];
    semilogy(EbN0,PeTheory{j},'.--','Color',ColorMtx(j,:),'DisplayName',ThLeg)
    hold on
    semilogy(EbN0,BER{j},'*','Color',ColorMtx(j,:),'DisplayName',ExpLeg)
    hold on
end
xlim([InitEbN0-.2 FinEbN0(1)+.2])
xlabel('Eb/N0 [dB]'); ylabel('BER')
legend('Location','SW')
title('Non-coherent FSK performances over AWGN channel')
grid on; hold off



%% FUNCTIONS

% >> Function for retrieving the Gray mapping between bits and symbols
%    as a function of M.
function [ Map, GrayMtx ] = GetMap( M )
    
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


% >> Function for generating random bits and mapping them into FSK symbols
% 	 according to the specified Graymapping table. building the packet by
%    specifying the mapping table.
function [ OutBits, OutSymbs, SymbLen ] = GetSymbs( GrayMap, Nbits )

    M = size(GrayMap,2);
    L = log2(M);                                                            % Number of bits per symbo
    OutBits = randi([0 1],1,Nbits);
    SymbLen = Nbits/L;
    OutSymbs = zeros(1,SymbLen);
    for i = 1:SymbLen                                                       % Bit-to-symbol mapping
        OutSymbs(i) = GrayMap(2,bi2de(OutBits(1+(i-1)*L:i*L), ...
            'left-msb')+1);
    end

end


% >> Function for implementing baseband non-coherent frequency demodulation.
%    The algorithm correlates the input signal with all M possible sinusoids,
%    then it integrate-and-dumps all vias choosing the most likely after.
%    NB: To work properly, the algorithm assumes no delay is present in the
%    input signal.
function [ OutBits ] = FreqDemod2( InSamps, M, dev, osf, GrayMtx, Fs )
    
    L = log2(M);
    FreqDev = dev*(2*(1:M)-M-1);                                            % Possible deviation values (in Hz) 
    Time = 1/Fs*(0:length(InSamps)-1);                                      % Time axis for correlators
    CorVias = zeros(M,length(InSamps));                                     % Matrix of the integrators output for all vias
    Nsymbs = length(InSamps)/osf;
    IntVias = zeros(M,Nsymbs);

    for j = 1:M
        CorSgn = exp(-1i*2*pi*FreqDev(j)*Time);                             % Generate correlating signals
        CorVias(j,:) = InSamps.*CorSgn;                                     % Correlate input signal with the j-th tone
        IntVias(j,:) = sum(reshape(CorVias(j,:), ...                        % Integrate and dump (i.e. integrate within each symbol time and sample)
            osf,Nsymbs));
    end
    [~,IdxMax] = max(abs(IntVias));                                         % Choose the via (and so the symbol) with maximum energy during each symbol time

    OutBits = zeros(1,Nsymbs*L);                                            % Symbol-to-bits demapping using the Gray matrix
    for j = 1:Nsymbs
        OutBits(1+(j-1)*L:j*L) = GrayMtx(IdxMax(j),:);
    end

end



%% NOTE:

% 1. To simulate high M, use increase osf (since higher M means higher dev_o). For example, for M = 16 osf = 64 is needed
%    (for lower order osf = 16 or 32 is enough instead).

% 2. The "erfc" function definition is different between Sklar (4.77) and Matlab :
%    � S: Q(x) = 1/sqrt(2*pi)integral[x:inf](exp(-(t^2)/2)dt)
%    � M: Q(x) = 2/sqrt(pi)integral[x:inf](exp(-t^2)dt)
%    Therefore, when passing an erfc formula from Sklar to Matlab the ercf argument (inside sqrt) shall be divided by 2, and then
%    the overall result divided by 2 as well (see above or Eq. 4.79).
%    Note Matlab provides a built-in formula, named "berawgn" to calculate the theorical BER of the standard modulations over AWGN
%    channel. In this case, for instance, BER = berawgn(EbN0dB,'fsk',M,'coherent').

% 3. In general, the theoretical formula matches exactly the actual BER only for M=2. For higher modulations orders, this yields
%      just an upper bound for Pb. However, also in these cases, it can be seen that the higher Eb/N0 the more accurate the theoretical
%      estimation becomes.
