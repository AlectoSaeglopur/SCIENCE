
close all; clearvars; clc


%% CHECK CSV WAVEFORM

% % Data = xlsread('FskSamps.csv');
% % Samps = Data(1:2:end-2)+1i*Data(2:2:end-1);
% % FsBB = Data(end);
% % Nsamps = length(Samps);
% % Time = 1/FsBB*(0:Nsamps-1);
% % figure; box on; hold on
% % plot(Time*1e3,real(Samps),'b.-')
% % plot(Time*1e3,imag(Samps),'r.--')
% % xlabel('Time [ms]'); ylabel('Amplitude [V]');
% % legend('Real','Imag'); title('FSK')
% % axis([Time(end)*1e3*[-1/15 16/15] 1.1*[-1 1]])
% % grid on; hold off
% % 
% % Data = xlsread('CpfskSamps.csv');
% % Samps = Data(1:2:end-2)+1i*Data(2:2:end-1);
% % FsBB = Data(end);
% % Nsamps = length(Samps);
% % Time = 1/FsBB*(0:Nsamps-1);
% % figure; box on; hold on
% % plot(Time*1e3,real(Samps),'b.-')
% % plot(Time*1e3,imag(Samps),'r.--')
% % xlabel('Time [ms]'); ylabel('Amplitude [V]');
% % legend('Real','Imag'); title('CPFSK')
% % axis([Time(end)*1e3*[-1/15 16/15] 1.1*[-1 1]])
% % grid on; hold off
% % 
% % Data = xlsread('GfskSamps.csv');
% % Samps = Data(1:2:end-2)+1i*Data(2:2:end-1);
% % FsBB = Data(end);
% % Nsamps = length(Samps);
% % Time = 1/FsBB*(0:Nsamps-1);
% % figure; box on; hold on
% % plot(Time*1e3,real(Samps),'b.-')
% % plot(Time*1e3,imag(Samps),'r.--')
% % xlabel('Time [ms]'); ylabel('Amplitude [V]');
% % legend('Real','Imag'); title('GFSK')
% % axis([Time(end)*1e3*[-1/15 16/15] 1.1*[-1 1]])
% % grid on; hold off


%% CHECK RESAMPLING

% % Data1 = xlsread('TxFskSamps.csv');
% % Samps1 = Data1(1:2:end-2)+1i*Data1(2:2:end-1);
% % FsBB1 = Data1(end);
% % Nsamps1 = length(Samps1);
% % Time1 = 1/FsBB1*(0:Nsamps1-1);
% % 
% % Data2 = xlsread('TxFskSamps2.csv');
% % Samps2 = Data2(1:2:end-2)+1i*Data2(2:2:end-1);
% % FsBB2 = Data2(end);
% % Nsamps2 = length(Samps2);
% % Time2 = 1/FsBB2*(0:Nsamps2-1);
% % 
% % figure; box on; hold on
% % plot(Time1*1e3,real(Samps1),'b.-',Time2*1e3,real(Samps2),'b*--')
% % plot(Time1*1e3,imag(Samps1),'r.-',Time2*1e3,imag(Samps2),'r*--')
% % xlabel('Time [ms]'); ylabel('Amplitude [V]');
% % legend('Real','Imag')
% % axis([Time1(end)*1e3*[-1/15 16/15] 1.1*[-1 1]])
% % grid on; hold off
% % 
% % Time1(end)*1e3-Time2(end)*1e3


%% CHECK BIN WAVEFORM

fid_M = fopen('GFSK_BB_Matlab','rb');
Data = fread(fid_M,[2,inf],'float32');
SampsM = Data(1,:)+Data(2,:)*1i;
fclose(fid_M);

fid_C = fopen('Gfsk_BB_Cpp','rb');
Data = fread(fid_C,[2,inf],'float32');
SampsC = Data(1,:)+Data(2,:)*1i;
fclose(fid_C);

LenM = length(SampsM)
LenC = length(SampsC)

figure; hold on
plot(0:LenM-1,real(SampsM),'b-')
plot(0:LenC-1,real(SampsC),'r--')
ylim([-1.5 1.5]); title('REAL')
legend('Matlab','C++'); hold off

figure; hold on
plot(0:LenM-1,imag(SampsM),'b-')
plot(0:LenC-1,imag(SampsC),'r--')
ylim([-1.5 1.5]); title('IMAG')
legend('Matlab','C++'); hold off
