
%%% Title: SCRIPT FOR GENERATING FM SIGNAL FOR GNU RADIO BLOCK "WBFM TRANSMIT"
%%% Author: Filippo Valmori
%%% Date: 10/03/2023
%%% Reference: Field expedient SDR - Vol.1/2 (David Clark, 2016)

close all
clearvars
clc


%% PARAMETERS

Fs = 40e3;                                                          % Sample rate [Sa/s]
Dev = 5e3;                                                          % Maximum frequency deviation [Hz]
Fd = 250;                                                           % Frequecy discritization step [Hz]



%% CONSTANTS

ScFct = 1e3;                                                        % Scale factor for time plots (e.g. 1e3 = 1ms)
Blue = [.2 .2 1];                                                   % Custom blue color
Red = [1 .2 0];                                                     % Custom red color
Black = [0 0 0];                                                    % Custom black color



%% PROCESSING

Seq = [];
Nstep = round(2*Dev/Fd+1);
Fc = -Dev;
LenBlk = round(Fs/Fd);
for j = 1:Nstep
  Seq = [Seq Fc/Dev*ones(1,LenBlk)];
  Fc = Fc+Fd;
end
Seq = [Seq -Seq(LenBlk+1:end-LenBlk)];
TimeAx = 1/Fs*(0:length(Seq)-1);
Sgn = sin(2*pi.*Seq*Dev.*TimeAx);



%% RESULTS

fid = fopen('wbfm_tx_data','w');                                    % Create binary file to be uploaded in GNUR
fwrite(fid,Seq,'float32');
fclose(fid);

figure
box on
hold on
plot(TimeAx*ScFct,Sgn,'*-','linewidth',1,'markersize',3,'Color',Black)
plot(TimeAx*ScFct,Seq,'*-','linewidth',2,'markersize',3,'Color',Red)
hold off
ylim(1.1*[-1 1])
xlabel('Time [ms]')
grid on
