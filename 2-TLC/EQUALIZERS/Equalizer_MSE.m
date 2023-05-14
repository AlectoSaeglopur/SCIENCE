
%%% Title: MINIMUM MEAN SQUARE ERROR (MSE) EQUALIZER SIMULATION
%%% Author: Filippo Valmori
%%% Date: 15/07/2018
%%% Reference: Digital Communications - B.Sklar & P.K.Ray (p.156)

close all; clearvars; clc


%% PARAMETERS

Neq = 150;                  % Parameter N of the equalizer [NB: Number of taps is 2*Neq+1]
Ninfo = 1000;               % Number of symbols within the information sequence
Rs = 1e3;                   % [Hz] Symbol rate
SNR = 25;                   % [dB] Signal-to-noise ratio over channel
TSF = 1e3;                  % Time plot scale factor (e.g. "1e3" means "ms")

DistFact = 0.1;             % Standard deviation for further distortion noise
beta = 0.1;                 % Roll-off factor of the channel SRRC filter
span = 16;                  % Window span (in samples) for SRRC filter [NB: choose an even value]
sps = 16;                   % Number of samples per symbol for SRRC filter upsampling


%% PROCESSING (TRAINING + INFO)

Ts = 1/Rs;                                      % [s] Symbol time
ExDummy = span*Neq;                             % Number of extra dummy symbols to be padded 
PeakPos = 2*Neq+1+span/2+ExDummy;               % Position of the non-zero symbol within the distorted training stream

TrainLen = 4*Neq+1;                             % Training sequence length (in symbols)
z = zeros(TrainLen,1);                          % Original training sequence
z(2*Neq+1) = 1;                                 % Set the only non-zero symbol in the middle of the sequence

ChanTaps = DistFact*randn(1,sps*span+1) + ...   % Distorting channel impulse response (an RRC filter not matched in RX causes
    rcosdesign(beta,span,sps,'sqrt');           % distortion, but any kind of distorting taps could have been chosen)

DistTrain = upfirdn([zeros(ExDummy,1); ...      % Channel filtering
    z;zeros(ExDummy,1)],ChanTaps,sps,sps);
DistTrain = awgn(DistTrain,SNR,'measured');     % AWGN addition

x = zeros(4*Neq+1,2*Neq+1);                     % Distorted matrix
x(1,1) = DistTrain(PeakPos-Neq);
for i = 2:2*Neq+1
    x(i,2:end) = x(i-1,1:end-1);
    x(i,1) = DistTrain(PeakPos-Neq+i-1);
end
x(end,end) = DistTrain(PeakPos+Neq);
for i = 4*Neq:-1:2*Neq+2
    x(i,1:end-1) = x(i+1,2:end);
    x(i,end) = DistTrain(PeakPos+i-3*Neq-1);
end

Rxz = (x.')*z;                                  % Cross-correlation vector
Rxx = (x.')*x;                                  % Auto-correlation matrix
Ceq = Rxx\Rxz;                                  % Minimum MSE algorithm (i.e. Cn=inv(Rxx)*Rxz)
RecTrain = filter(Ceq,1,DistTrain);             % Recovered training sequence

InfoSymb = randi([-1 1],Ninfo,1);
DistInfo = upfirdn([zeros(ExDummy,1); ...
    InfoSymb;zeros(ExDummy,1)],ChanTaps,sps,sps);
DistInfo = awgn(DistInfo,SNR,'measured');
RecInfo = filter(Ceq,1,DistInfo);


%% PLOTS AND COMMENTS

Time1 = Ts*(0:4*Neq)+Ts*(span/2+ExDummy+Neq);
Time2 = Ts*(0:4*Neq+2*ExDummy+span)+Ts*Neq;
Time3 = Ts*(0:4*Neq+2*ExDummy+span);
Time4 = Ts*(0:Ninfo-1)+Ts*(span/2+ExDummy+Neq);
Time5 = Ts*(0:Ninfo+2*ExDummy+span-1)+Ts*Neq;
Time6 = Ts*(0:Ninfo+2*ExDummy+span-1);

figure('name','MSE'); box on; hold on
stem(Time1*TSF,z,'g*-')
stem(Time2*TSF,DistTrain,'r.-.')
stem(Time3*TSF,RecTrain,'bx--')
xlim([TSF*Ts*(PeakPos+Neq-span/2-1) TSF*Ts*(PeakPos+Neq+span/2)])
ylim([min(DistTrain)-0.3 max(1.2,max(DistTrain)+0.3)])
xlabel('Time [ms]'); ylabel('Amplitude [V]')
legend('Original symbols','Distorted symbols','Recovered symbols')
title('Training sequences before MSE equalizer'); hold off

figure('name','MSE'); box on; hold on
stem(Time4*TSF,InfoSymb,'g*-')
stem(Time5*TSF,DistInfo,'r.-.')
stem(Time6*TSF,RecInfo,'bx--')
xlim(TSF*Ts*[ExDummy+span Ninfo+2*span+ExDummy+Neq])
ylim([min(-1.3,min(DistInfo)-0.3) max(1.3,max(DistInfo)+0.3)])
xlabel('Time [ms]'); ylabel('Amplitude [V]')
title(sprintf('Info sequence after MSE equalizer (%d taps)',2*Neq+1))
legend('Original symbols','Distorted symbols','Recovered symbols'); hold off

% NB#1: In Figure#1 the three curves are overlapped providing time-matching around
% the equalizer output. In particular, the ChannelFilter introduces a delay of
% "span/2+ExDummy" samples and the Equalizer of further "Neq" samples.

% NB#2: As can be seen from the two figures, the MSE algorithm recovers both training
% and info sequences with a little less accuracy than ZF within the range 2*Neq+1, but
% keeps good equalization also ouside the range 2*Neq+1

% NB#3: More than one non-zero symbols cuold have been inserted into the original
% training sequence.

% NB#4: MSE performances quickly drops for SNRs lower than about 15 dB.

% NB#5: In real applications the training sequence is an alternate sequence of 0s and
% 1s. However, that would require too much bandwidth for this simulation since there's
% no filtering in transmission (e.g. RRC or Gaussian).

Ns = length(ChanTaps);
dF = Rs/Ns;
freq = -Rs/2:dF:Rs/2-dF;
spect_amp = abs(fftshift(fft(ChanTaps))/Ns);
spect_pwr = 20*log10(spect_amp);
figure('name','MSE')
subplot(2,2,1)
plot(freq/TSF,30+spect_pwr,'b')
title('a) Channel transfer function')
xlabel('Frequency [kHz]'); ylabel('Power [dBm]')

Ns = length(InfoSymb);
dF = Rs/Ns;
freq = -Rs/2:dF:Rs/2-dF;
spect_amp = abs(fftshift(fft(InfoSymb))/Ns);
spect_pwr = 20*log10(spect_amp);
subplot(2,2,2)
plot(freq/TSF,30+spect_pwr,'r')
title('b) Tx info spectrum')
xlabel('Frequency [kHz]'); ylabel('Power [dBm]')

Ns = length(DistInfo);
dF = Rs/Ns;
freq = -Rs/2:dF:Rs/2-dF;
spect_amp = abs(fftshift(fft(DistInfo))/Ns);
spect_pwr = 20*log10(spect_amp);
subplot(2,2,3)
plot(freq/TSF,30+spect_pwr,'g')
title('c) Rx distorted spectrum')
xlabel('Frequency [kHz]'); ylabel('Power [dBm]')

RecInfoCut = RecInfo(1+span/2+ExDummy+Neq:span/2+ExDummy+Neq+Ninfo);
Ns = length(RecInfoCut);
dF = Rs/Ns;
freq = -Rs/2:dF:Rs/2-dF;
spect_amp = abs(fftshift(fft(RecInfoCut))/Ns);
spect_pwr = 20*log10(spect_amp);
subplot(2,2,4)
plot(freq/TSF,30+spect_pwr,'c')
title('d) Rx equalized spectrum')
xlabel('Frequency [kHz]'); ylabel('Power [dBm]')
