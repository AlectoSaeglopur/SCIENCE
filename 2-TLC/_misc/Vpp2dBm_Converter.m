
close all; clearvars; clc

%% Vpp to dBm conversion (50 ohm impedance)

Vpp = 1;                        % Input peak-to-peak voltage [V]
R = 50;                         % Matching impedance [Ohm]
Vrms = Vpp/(2*sqrt(2));         % RMS voltage
Pw = Vrms^2/R;                  % Power [W]
PdBW = 10*log10(Pw);            % Power [dBW]
PdBm = PdBW+30;
fprintf(" * Vpp = %1.1f mV -> P = %1.1f dBm\n",Vpp*1e3,PdBm);

%% dBm to Vpp conversion (50 ohm impedance)

% PdBm = 20;                     % Input power [dBm]
% R = 50;                         % Matching impedance [Ohm]
% PdBW =  PdBm-30;
% Pw = 10^(PdBW/10);
% Vrms = sqrt(Pw*R);
% Vpp = Vrms*2*sqrt(2);
% fprintf(" * P = %1.1f dBm -> Vpp = %1.1f mV\n",PdBm,Vpp*1e3);