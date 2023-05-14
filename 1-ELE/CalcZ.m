
% Title: AC CIRCUIT IMPEDANCE CALCULATOR
% Author : Filippo Valmori
% Description : Script for computing the impedance of an AC circuit, composed of resistances (R),
%   inductors (L) and/or capacitors (C) in parallel (P) or series (S). First element is typically
%   the resistive load, then all component have to be inserted backwards (i.e. from right to left)

close all; clearvars; clc


%% PARAMETERS

F = 100e6;                      % Operating frequency [Hz]
Ncomp = 5;                      % Foreseen number of elements within circuit (just as check)

Circ(1).Comp = 'R';
Circ(1).Pos = 'S';              % First component must be always set in series
Circ(1).Val = 50;

Circ(2).Comp = 'C';
Circ(2).Pos = 'P';
Circ(2).Val = 46.4e-12;

Circ(3).Comp = 'L';
Circ(3).Pos = 'S';
Circ(3).Val = 53.04e-9;

Circ(4).Comp = 'C';
Circ(4).Pos = 'S';
Circ(4).Val = 159.155e-12;

Circ(5).Comp = 'R';
Circ(5).Pos = 'S';
Circ(5).Val = 16;



%% ESTIMATION AND RESULTS

Z = EstZ(F,Ncomp,Circ);
AmpZ = sqrt(real(Z)^2+imag(Z)^2);
AngZ = atan2(imag(Z),real(Z));
fprintf('* Re(Z) = %1.2f | Im(Z) = %1.2f\n',real(Z),imag(Z));
fprintf('* |Z| = %1.1f | arg(Z) = %1.1f° \n',AmpZ,AngZ*360/(2*pi));



%% FUNCTIONS

function [ Ztot ] = EstZ ( Freq, Ncomp, Circ )
    
    W = 2*pi*Freq;
    N = length(Circ);
    Ztot = 0;
    
    if N ~= Ncomp
        error('Invalid component number');
    end
    
    for i = 1:N
        
        if (Circ(i).Comp ~= 'R') && (Circ(i).Comp ~= 'C') && (Circ(i).Comp ~= 'L')
            error('Invalid element type');
       elseif (Circ(i).Pos ~= 'S') && (Circ(i).Pos ~= 'P')
            error('Invalid element position');
       end
        
        switch Circ(i).Comp
            case 'L'
                Z = 1j*W*Circ(i).Val;           % Inductor impedance
            case 'C'
                Z = 1/(1j*W*Circ(i).Val);       % Capacitor impedance
            otherwise
                Z = Circ(i).Val;                % Resistance impedance
        end
     
        if Circ(i).Pos == 'S'
            Ztot = Z+Ztot;                      % Series impedance estimation
        else
            Ztot = Z*Ztot/(Z+Ztot);             % Parallel impedance estimation
        end
   
    end
    
end
