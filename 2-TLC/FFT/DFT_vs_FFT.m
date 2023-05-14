
%%% COMPARISON BETWEEN MATLAB BUILT-IN FFT AND CUSTOM DFT

close all; clearvars; clc


%% MAIN

Fc = 5e3;                                   % Sample rate [Sa/s]
Fs = 100e3;                                 % Signal frequency [Hz]
Time = 0:1/Fs:150/Fc+1/Fs;                  % Time axis [s]
Sgn = sin(2*pi*Fc*Time);                    % Signal in time [V]

tic
[FrAx1,Spt1] = GetSpect1(Sgn,Fs);
fprintf(" * Elapsed time - Mine : %1.1f ms\n",toc*1e3);
tic
[FrAx2,Spt2] = GetSpect2(Sgn,Fs);
fprintf(" * Elapsed time - MaBI : %1.1f ms\n",toc*1e3);

figure
subplot(1,2,1)
plot(Time*1e3,Sgn,'k')
axis([0 4 -1.2 1.2])
xlabel('Time [ms]')
grid on
title('SIGNAL IN TIME')
subplot(1,2,2)
box on; hold on
plot(FrAx1/1e3,Spt1,'b.-')
plot(FrAx2/1e3,Spt2,'r.-.')
xlabel('Frequency [kHz]')
legend('Mine','Built-in')
title('SPECTRA')
grid on
hold off



%% EXTRA FUNCTIONS
% >> Function for randomly generating the Tx bits and the corresponding symbols according to the selected PSK modulation. 
%    As input it c
function [ y ] = dft( x )
    N = length(x);
    y = zeros(1,N);
    for i = 1:N
        for j = 1:N
            y(i) = y(i)+x(j)*exp(-2i*pi*(i-1)*(j-1)/N);
        end
    end
end

function [ y ] = idft( x )
    N = length(x);
    y = zeros(1,N);
    for i = 1:N
        for j = 1:N
            y(i) = y(i)+x(j)/N*exp(2i*pi*(i-1)*(j-1)/N);
        end
    end
end

function [ FreqAx, PwrSpect ] = GetSpect1( Sgn, Fs )
    Ns = length(Sgn);                                   % Length (in samples) of the input waveform
    dF = Fs/Ns;                                         % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                          % Frequency axis for spectrum plot
    CpxSpect = dft(Sgn);
    CpxSpect = [CpxSpect(1+floor(Ns/2):end) ...         % Complex spectrum (amplitude and phase)
        CpxSpect(1:floor(Ns/2))]/Ns;
%     CpxSpect = [CpxSpect(2+floor(Ns/2):end) ...         % Alternative version in case of odd length(Sgn)
%         CpxSpect(1:1+floor(Ns/2))]/Ns;
    
    PwrSpect = 20*log10(abs(CpxSpect));                 % Power spectrum (in dBW)
end

function [ FreqAx, PwrSpect ] = GetSpect2( Sgn, Fs )
    Ns = length(Sgn);                                   % Length (in samples) of the input waveform
    dF = Fs/Ns;                                         % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                          % Frequency axis for spectrum plot
    CpxSpect = fftshift(fft(Sgn))/Ns;                      % Complex spectrum (amplitude and phase)
    PwrSpect = 20*log10(abs(CpxSpect));                 % Power spectrum (in dBW)
end


% FFT -> https://github.com/FFTW/fftw3
