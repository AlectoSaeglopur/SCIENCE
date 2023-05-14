
% INSTRUCTIONS
% 1. Set breakpoint in MATLAB before the execution of "GetSpect2" function
% 2. Run MATLAB (and stop at breakpoint)
% 3. Compile and run C++ script -> cls && g++ FFT_vs_DFT.cpp -o asd && asd
% 4. Resume MATLAB execution to the end


close all; clearvars; clc


%% PROCESSING AND RESULTS

Ns1 = 5000;                                             % Number of samples for the input waveform
Fc = 100;                                               % Carrier frequency [Hz]
Fs = 1e4;                                             	% Sample rate [Sa/s]

Time1 = 1/Fs*(0:Ns1-1);                                 % Time axis [s]                         
Sgn = sin(2*pi*Fc*Time1);                               % Signal in time    

WriteWaveBin(Sgn);                                      % Write signal into binary file for C++ execution

[FreqAx1,PwrSpect1] = GetSpect1(Sgn,Fs);                % Calculate spectrum with MATLAB built-in function
figure
plot(FreqAx1/1e3,PwrSpect1,'b-');
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')

[FreqAx2,PwrSpect2] = GetSpect2(Fs,'F');                % Calculate spectrum from C++ FFT
figure
plot(FreqAx2/1e3,PwrSpect2,'r-');
xlabel('Frequency [kHz]'); ylabel('Power [dBW]')

% fid = fopen('FFT_Check','rb');
% Data = fread(fid,[2,inf],'float32');
% Samps = Data(1,:)+Data(2,:)*1i;
% fclose(fid);
% Ns2 = length(Samps);
% figure; box on; hold on
% plot(0:Ns2-1,real(Samps),'b-')
% plot(0:Ns2-1,imag(Samps),'r--')
% legend('real','imag');
% grid on; hold off



%% EXTRA FUNCTIONS

function [ FreqAx, PwrSpect ] = GetSpect1( Sgn, Fs )
    Ns = length(Sgn);                                       % Length (in samples) of the input waveform
    dF = Fs/Ns;                                             % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                              % Frequency axis for spectrum plot
    CpxSpect = fftshift(fft(Sgn))/Ns;                       % Complex spectrum
    PwrSpect = 20*log10(abs(CpxSpect));                     % Power spectrum (in dBW)
end

function [ FreqAx, PwrSpect ] = GetSpect2( Fs, Label )
    if strcmp(Label,'D')
        fid = fopen('CppDFT','rb');
    else
        fid = fopen('CppFFT','rb');
    end
    Data = fread(fid,[2,inf],'float32');
    Vect = Data(1,:)+Data(2,:)*1i;
    fclose(fid);
    Ns2 = length(Vect);
    dF = Fs/Ns2;
    FreqAx = -Fs/2:dF:Fs/2-dF;
    CpxSpect = fftshift(Vect)/Ns2;
    PwrSpect = 20*log10(abs(CpxSpect));
end

function [] = WriteWaveBin( CpxWave )
    CpxLen = length(CpxWave);
    StrI = real(CpxWave);
    StrQ = imag(CpxWave);
    StrIQ(1:2:CpxLen*2-1) = StrI;
    StrIQ(2:2:CpxLen*2) = StrQ;
    fid = fopen('WaveIn','w');
    fwrite(fid,StrIQ,'double');
    fclose(fid);
end
