
close all; clearvars; clc

%% EX1

Ncyc = 5;                                                                           % Number of sinusoid cycle to be simulated
Fc = 50;                                                                            % Sinusoid frequency [Hz]
A = 3;                                                                              % Sinusoid amplitude [V]
Fs = 2e3;                                                                           % Sample rate [Sa/s]

AdcRes = 8;                                                                         % ADC resolution (for 2nd y-axis conversion)
Nsp = Fs/Fc;                                                                        % Expected number of samples per sinusoidal period (to be checked on 1st x-axis)
xSamp = 0:Ncyc*Fs/Fc-1;
xTime = 1/Fs*xSamp;
ySgn = A*sin(2*pi*Fc*xTime);

figure
plot(xSamp,ySgn,'b.-')
xlabel('Sample #');
ylabel('Amplitude [V]')
grid on

Axis1 = gca;                                                                        % get current 1st (main) axis info
Axis2 = axes('Position',get(Axis1,'Position'),'Color','none');                      % create 2nd axis (blank)
linkaxes([Axis1 Axis2],'xy');                                                       % link 2nd axis to 1st axis on both X-Y

set(Axis2,'XAxisLocation','top');                                                   % set 2nd x-axis on the top
set(Axis2,'XLim',get(Axis1,'XLim'));                                                % set same xlim as main x-axis
set(Axis2,'XTick',get(Axis1,'XTick'));                                              % use same ticks number and position as main x-axis
set(Axis2,'XTickLabel',get(Axis1,'XTick')*1e3/Fs);                                  % set 2nd x-axis tick labels (by scaling 1st axis ones)
Axis2.XLabel.String = 'Time [ms]';                                                  % set 2nd x-axis label

set(Axis2,'YAxisLocation','right');                                                 % set 2nd y-axis on the right
set(Axis2,'YLim',get(Axis1,'YLim'));
set(Axis2,'YTick',get(Axis1,'YTick'));
set(Axis2,'YTickLabel',round((get(Axis1,'YTick')/(2*A)+0.5)*2^AdcRes));
Axis2.YLabel.String = 'ADC level [.]';



%% EX2

year = 2000:5:2020;
copper = [1813 3679 7535 5631 5786];
steel = [296 633 716 543 491];

figure
yyaxis left
plot(year,copper,'r-o');
ylim([0 8000])
xlabel('Year')
ylabel('Copper price [€/ton]')
hold on

yyaxis right
plot(year,steel,'b-o')
ylim([200 1000])
ylabel('Steel price [€/ton]')
hold off
grid on
