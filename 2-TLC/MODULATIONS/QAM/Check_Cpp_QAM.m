
close all; clearvars; clc

Data = xlsread('TxCpxSymbs.csv');
Symbs = Data(1:2:end-1)+1i*Data(2:2:end);

figure
plot(real(Symbs),imag(Symbs),'r*')
axis(1.5*max(Data)*[-1 1 -1 1])