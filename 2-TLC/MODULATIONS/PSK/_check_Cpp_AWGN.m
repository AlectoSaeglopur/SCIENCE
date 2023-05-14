
close all; clearvars; clc

TxSymbs = csvread('TxCpxSymbs.csv');
RxSymbs = csvread('RxCpxSymbs.csv');

TxSymbs = TxSymbs(1:2:end-1)+1i*TxSymbs(2:2:end);
RxSymbs = RxSymbs(1:2:end-1)+1i*RxSymbs(2:2:end);

figure; box on; hold on
plot(real(RxSymbs),imag(RxSymbs),'b.')
plot(real(TxSymbs),imag(TxSymbs),'r*')
xlabel('In-phase'); ylabel('Quad')
legend('Rx | Noisy','Tx | Ideal')
axis(1.5*[-1 1 -1 1])
hold off
