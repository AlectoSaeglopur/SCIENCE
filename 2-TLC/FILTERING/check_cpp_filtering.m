
close all; clearvars; clc

Data1 = xlsread('SymbsC.csv');
Data2 = xlsread('SampsTxC.csv');
Data3 = xlsread('SampsRxC.csv');

Symbs = Data1(1:2:end-1)+1i*Data1(2:2:end);
SampsTx = Data2(1:2:end-1)+1i*Data2(2:2:end);
SampsRx = Data3(1:2:end-1)+1i*Data3(2:2:end);

Time1 = 0:length(Symbs)-1;
figure; box on; hold on
stem(Time1,real(Symbs),'bo-')
stem(Time1,imag(Symbs),'r.-')
axis([-.5 length(Symbs)-0.5 1.5*[-1 1]])
legend('Real','Imag');
title('1 - Tx Symbols'); hold off

% Time2 = 0:length(SampsTx)-1;
% figure; box on; hold on
% stem(Time2,real(SampsTx),'bo-')
% stem(Time2,imag(SampsTx),'r.-')
% axis([-.5 length(SampsTx)-0.5 1.5*max(abs(SampsTx))*[-1 1]])
% legend('Real','Imag');
% title('2 - Tx Samples'); hold off

Time3 = 0:length(SampsRx)-1;
figure; box on; hold on
plot(Time3,real(SampsRx),'b.-')
plot(Time3,imag(SampsRx),'r.-')
line([0 length(SampsRx)],[1 1],'Color','g')
line([0 length(SampsRx)],[-1 -1],'Color','g')
axis([-.5 length(SampsRx)-0.5 1.5*max(abs(SampsRx))*[-1 1]])
legend('Real','Imag');
title('3 - Rx Samples'); hold off
