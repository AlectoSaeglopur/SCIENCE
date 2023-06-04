
%%% Title: ZERO-FORCING (ZF) EQUALIZER SIMULATION
%%% Author: Filippo Valmori
%%% Date: 14/07/2018
%%% Reference: Digital Communications - B.Sklar & P.K.Ray (p.154)

close all; clearvars; clc


%% PARAMETERS

Neq = 50;                   % N parameter for equalizer (number of taps is 2*Neq+1)
Ninfo = 40;                 % Number of symbols within the information sequence
Rs = 1e3;                   % [Hz] Symbol rate
SNR = 25;                   % [dB] Signal-to-noise ratio
TSF = 1e3;                  % Time plot scale factor (e.g. "1e3" means "ms")

beta = 0.1;                 % Roll-off factor of the channel SRRC filter
span = 16;                  % Window span (in samples) for SRRC filter [NB: choose an even value]
sps = 16;                   % Number of samples per symbol for SRRC filter upsampling
DwOfs = 0;                  % Downsampling offset (in samples)


%% PROCESSING (TRAINING + INFO)

Ts = 1/Rs;                                  % [s] Symbol time
ExDummy = span*Neq;                         % Number of extra dummy symbols to be padded
PeakPos = Neq+1+span/2+ExDummy;             % Position of the non-zero symbol within the distorted training stream

TrainLen = 2*Neq+1;                         % Training sequence length (in symbols)
z = zeros(TrainLen,1);                      % Original training sequence
z(Neq+1) = 1;                               % Set the only non-zero symbol in the middle of the sequence

ChanFilter = comm.RaisedCosineTransmitFilter( ...
    'Shape','Square root','RolloffFactor',beta, ...
    'FilterSpanInSymbols',span, ...
    'OutputSamplesPerSymbol',sps);

DistTrainOS = ChanFilter([zeros(ExDummy,1);z;zeros(ExDummy,1)]);
DistTrainOS = awgn(DistTrainOS,SNR,'measured');
DistTrainDS = downsample(DistTrainOS,sps,DwOfs);

x = zeros(2*Neq+1);                         % Distorted matrix
for i = 1:size(x,1)
    for j = 1:size(x,2)
        x(i,j) = DistTrainDS(PeakPos-j+i-2);
    end
end

Ceq = x\z;                                  % Zero-forcing algorithm (i.e. Cn=inv(x)*z)
RecTrain = filter(Ceq,1,DistTrainDS);       % Recovered training sequence


%% INFO PROCESSING

InfoSymb = randi([-1 1],Ninfo,1);
DistInfoOS = ChanFilter([zeros(ExDummy,1);InfoSymb;zeros(ExDummy,1)]);
DistInfoDS = downsample(DistInfoOS,sps,0);
RecInfo = filter(Ceq,1,DistInfoDS);


%% PLOTS

Time1 = Ts*(0:2*Neq)+Ts*(span/2+ExDummy);
Time2 = Ts/sps*(0:(2*Neq+1+2*ExDummy)*sps-1);
Time3 = Ts*(0:2*Neq+2*ExDummy);
Time4 = Ts*(0:2*Neq+2*ExDummy)-Ts*(Neq-2);
Time5 = Ts*(0:Ninfo-1)+Ts*(span/2+ExDummy+Neq-2);
Time6 = Ts*(0:Ninfo+2*ExDummy-1)+Ts*(Neq-2);
Time7 = Ts*(0:Ninfo+2*ExDummy-1);


figure('name','ZF'); box on; hold on
stem(Time1*TSF,z,'b*-')
stem(Time2*TSF,DistTrainOS,'g.-.')
stem(Time3*TSF,DistTrainDS,'r*-')
stem(Time4*TSF,RecTrain,'mo--')
axis([TSF*Ts*(PeakPos-span/2-1) TSF*Ts*(PeakPos+span/2) min(DistTrainOS)-0.2 1.2]);
xlabel('Time [ms]'); ylabel('Amplitude [V]')
legend('Original symbols','Distorted symbols (OS)','Distorted symbols (DS)','Equalized symbols (DS)')
title(sprintf('1 - Training sequences (%d taps)',2*Neq+1)); hold off

% NB#1: As can be seen from the first figure, the ZF algorithm recovers the training
% pulse to its original unitary value and forces the previous and following Neq to
% zero (even though, outside this range creates massive interference). Keep in mind
% that yet more than one zero could be inserted into the original training sequence
% (i.e. vector "OnesZ" can have more than one element).

figure('name','ZF'); box on; hold on
stem(Time5*TSF,InfoSymb,'b*-')
stem(Time6*TSF,DistInfoDS,'go-.')
stem(Time7*TSF,RecInfo,'r.--')
xlim(TSF*Ts*[ExDummy+2*span Ninfo+2*span+ExDummy+Neq])
xlabel('Time [ms]'); ylabel('Amplitude [V]'); ylim([-1.5 1.5]);
title(sprintf('2 - Info sequence (%d taps)',2*Neq+1))
legend('Original sequence','Distorted sequence','Recovered sequence'); hold off

% NB#2: As can be seen from Figure#2, an info sequence can be properly equalized only
% if its length does not exceed (Ntaps-1)/2, since outside this range the ZF
% algorithm does not garantee ISI suppression (or even introduce itself ISI).

% NB#3: ZF performances quickly drops for SNRs lower than about 15 dB.
