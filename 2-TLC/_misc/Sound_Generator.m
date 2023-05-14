
close all; clearvars; clc

Fc = 440;               % [Hz] Tone main frequency
Pw = -10;               % [dBW] Volume
Tsim = 3;               % [s] Duration
type = 'sine';          % Type of waveform
osf = 8;                % Oversampling factor

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