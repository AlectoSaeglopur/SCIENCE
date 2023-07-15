
close all; clearvars; clc


Fc = 440;                                                                           % Tone main frequency [Hz]
Pw = -10;                                                                           % Volume [dBW]
Tsim = 3;                                                                           % Duration [s]
type = 'square';                                                                    % Type of waveform
osf = 8;                                                                            % Oversampling factor [Sa/Sy]

A = 10^(Pw/20);
Fs = Fc*osf;
t = 0:1/Fs:Tsim;
switch type
    case 'sine'
        wave = A*sin(2*pi*Fc*t);
    case 'square'
        wave = A*square(2*pi*Fc*t);
    case 'triangle'
        wave = A*sawtooth(2*pi*Fc*t);
end

sound(wave,Fs);
audiowrite(strcat('ex4_',type,'.wav'),wave,Fs)