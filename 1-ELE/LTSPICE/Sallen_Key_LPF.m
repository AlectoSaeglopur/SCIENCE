
close all; clearvars; clc

Fc = 2e3;                                       % LPF cut-off frequency [Hz]
C2 = 500e-9;                                    % Feedback capacitor (C2) value [F]

R = sqrt(2)/(2*pi*C2*Fc);                       % Resistors (R1 ad R2) value [Ohm]
C1 = 1/(C2*(2*pi*R*Fc)^2);                      % Shunt capacitor (C1) value [F]

fprintf("\n§ Fc = %1.1f kHz\n",Fc/1e3)
fprintf("§ R = %1.1f Ohm\n",R)
fprintf("§ C1 = %1.1f nF\n",C1*1e9)
fprintf("§ C2 = %1.1f nF\n\n",C2*1e9)

