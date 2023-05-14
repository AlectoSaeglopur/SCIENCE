
close all; clearvars; clc

Nsamps = 5000;
Fs = 2e4;
Fc = 1e2;


Time = 1/Fs*(0:Nsamps-1);
Samps = sin(2*pi*Fc*Time);

figure
plot(1:Nsamps,Samps)
xlabel('Sample #'); ylim([-1.2 1.2])

Ax1 = gca;
Ax2 = axes('Position',get(Ax1,'Position'),'Color','none');
set(Ax2,'XAxisLocation','top');
set(Ax2,'XLim',get(Ax1,'XLim'));
set(Ax2,'XTick',get(Ax1,'XTick'));
set(Ax2,'XTickLabel',Time*1000);
linkaxes([Ax1 Ax2],'xy');
Ax2.XLabel.String = 'Time [ms]';




