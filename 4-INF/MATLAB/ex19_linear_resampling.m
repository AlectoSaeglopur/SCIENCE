
close all; clearvars; clc

Fs = 250e3;
Fc = 1e3;
A = 1;
T = 0.005;

ResUp = 2;
ResDown = 7;

Time1 = 0:1/Fs:T;
Sgn1 = A*sin(2*pi*Fc*Time1);

Time2 = 0:ResDown/(ResUp*Fs):T;
Sgn2 = interp1(Time1,Sgn1,Time2);

figure; hold on
plot(Time1,Sgn1,'b.-')
plot(Time2,Sgn2,'r.-.')
legend('original','resampled')
axis([-T/10 11/10*T 1.1*[-A A]])
hold off
grid on