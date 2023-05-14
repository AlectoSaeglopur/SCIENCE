
close all; clearvars; clc

%% PARAMETERS

Fc = 500e6;         % Working frequency [Hz]
Len = 2.82e-1;      % Dipole length [m]
Rad = 1e-2;         % Cylinder radius of the wire dipole [m]   
Tilt = 0;           % Inclination angle of the dipole [°]
R0 = 50;            % Feedline impedence (pure resistive) [ohm]
c = 299792458;      % Speed of light [m/s]


%% RESULTS

lambda = c/Fc;
fprintf("Ideal lambda/2 length = %1.3f\n",lambda/2);

Width = cylinder2strip(Rad);
Ant = dipole('Length',Len,'Width',Width,'Tilt',Tilt);
FreqRange = Fc-Fc/10:Fc/1e3:Fc+Fc/10;

figure
impedance(Ant,FreqRange);

figure
returnLoss(Ant,FreqRange,R0);       % S11 parameter, defined as 10*log10(PWRinc/PWRref)

figure
pattern(Ant,Fc);

figure
patternAzimuth(Ant,Fc);

figure
patternElevation(Ant,Fc);
