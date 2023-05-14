
close all; clearvars; clc

Len = 200;
Fs = 1e5;
Fc = 5e1;
Slope = 200;
SNR = -12;

N = 10;
R = 1;
Wn = [0.001 0.999];

Time = 1/Fs*(0:Len-1);
InfoSgn = Slope*Time;
NoiseSgn = awgn(sin(2*pi*Fc*Time),SNR,'measured');
[b,a] = cheby1(N,R,Wn);
ChSgn = InfoSgn+NoiseSgn;
FiltSgn = filter(b,a,ChSgn);

Delay = (length(b)-1)/2;

figure; hold on
plot(Time,InfoSgn,'g-')
plot(Time,ChSgn,'r-')
plot(Time,FiltSgn,'b-')
plot(Time,[FiltSgn(Delay+1:end) zeros(1,Delay)],'c-')
hold off
legend('Info','Info+Noise','Filtered','FiltShift')

TapsGauss = gaussdesign(2,8,8);
GaussSgn = filter(TapsGauss,1,ChSgn);
figure; hold on
plot(Time,ChSgn,'r-')
plot(Time,GaussSgn,'b-')
hold off








