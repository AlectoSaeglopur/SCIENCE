
close all; clearvars; clc

% Script for simulating the QPSK waveform transmitted over channel after SRRC filtering
% and the samples detected in reception after corresponding matched filtering
% NB || v1 features (upgrade of v1):
% - usage of the Simulink "comm.RaisedCosineTx/RxFilter" block to execute the SRRC shaping (same performances as "rcosdesign" of v2)
% - LPF outside the RF up-resampling by ResFact (formally more accurate and better performances than v2)
% - HPA in TX and AGC in RX
% - Time and frequency analysis


%% PARAMETERS

In_Msg = 'How does it feel?';                                                 % Message to be transmitted
bpc = 8;                                                                      % Bits per char
Nbits = bpc*length(In_Msg);                                                   % Number of bits to be transmitted
c = 299.8e6;                                                                  % [m/s] E/M waveform propagation speed

Rb = 100e3;                                                                   % [b/s] Bit rate
Fc = 100e6;                                                                   % [Hz] Carrier frequency
R = 50;                                                                       % [Ohm] Antenna resistance
Ant_Power = 30;                                                               % [dBm] Signal power level to be forwarded to antenna
SNR = 10;                                                                      % [dB] Signal-to-noise ratio per symbol over channel
ChAtt = 110;                                                                  % [dB] Power attenuation over channel (NB: higher ChAtt needs higher AGC_max_gain to be recovered!)
ChDist = 80;                                                                  % [.] Variance of time distortion over channel

M = 4;                                                                        % Modulation order (4 for QPSK)
phase_offset = -pi/4;                                                         % QPSK constellation phase offset
QPSK_MOD = comm.QPSKModulator('PhaseOffset',phase_offset,'BitInput', ...      % QPSK modulator object
    true, 'SymbolMapping','Gray','OutputDataType','double');
QPSK_DEM = comm.QPSKDemodulator('PhaseOffset',phase_offset, ...               % QPSK demodulator object (ALLR if channel coding, HARD otherwise)
    'BitOutput',true,'DecisionMethod','Hard decision');

beta = 0.3;                                                                   % Roll-off factor for SRRC filter (NB: lower values require higher span!)
span = 8;                                                                     % Window span in samples for SRRC filter
sps = 20;                                                                     % Number of samples per symbol for SRRC filter upsampling
SRRC_FILTER_TX = comm.RaisedCosineTransmitFilter('Shape', ...                 % SRRC TX filter object
  'Square root','RolloffFactor',beta,'FilterSpanInSymbols',span, ...
  'OutputSamplesPerSymbol',sps);
SRRC_FILTER_RX = comm.RaisedCosineReceiveFilter('Shape', ...                  % SRRC RX filter object
  'Square root','RolloffFactor',beta,'FilterSpanInSymbols',span, ...
  'InputSamplesPerSymbol',sps,'DecimationFactor',1);
SRRC_delay = span*sps/2;                                                      % Delay in samples introduced by each SRRC filter

AGC_out_power = 0.05;                                                         % [W] AGC target output power
AGC_window = 80;                                                              % Length of the AGC averaging window
AGC_step = 0.05;                                                              % Higher value: more quickly updates upon input level changes but higher error in output level
AGC_max_gain = 70;                                                            % [dB] AGC maximum power gain
AGC_BLOCK = comm.AGC('AdaptationStepSize',AGC_step,'DesiredOutputPower', ...
    AGC_out_power,'AveragingLength',AGC_window,'MaxPowerGain',AGC_max_gain);

Rs = Rb/log2(M);                                                              % [s/s] Symbol rate
BW = Rs*(1+beta);
Fs_BB = Rs*sps;                                                               % [S/s] Sample rate before RF up-resampling
ResFact = round(12*Fc/Fs_BB);                                                 % Resample factor used during up-down conversion ("12" means six times the minumum Nyquist rate)
Fs_RF = Fs_BB*ResFact;                                                        % [S/s] Sample rate after RF up-resampling

Nfir = 200;                                                                   % Order of FIR low pass filter in RX
FIR_delay = Nfir/2;                                                           % Delay (in samples) introduced by FIR filter
Wn = 1/Fs_BB;                                                                 % Design parameter for LPF cut-off frequency (NB: Fcut = Wn*Fs/2)
Taps_FIR = fir1(Nfir,Wn,'low');                                               % RF low-pass filter coefficients

AntTX_gain = 0;                                                               % [dB] TX antenna gain (omnidirectional)
AntRX_eff = 0.6;                                                              % [.] RX antenna efficiency
AntRX_diam = 5.5;                                                             % [m] RX antenna diameter
AntGainRX = AntRX_eff*(pi*AntRX_diam*Fc/c)^2;                                 % [dB] RX antenna gain (parabolic)
                                                             
T0 = 290;                                                                     % [K] RX antenna temperature
F = 1.5;                                                                      % [dB] LNA noise figure
LNA_gain = 15;                                                                % [dB] LNA gain
Tsyst = (10^(F/10)-1)*T0;                                                     % [K] System noise temperature in RX
GT = LNA_gain+AntGainRX-10*log10(Tsyst);                                      % [dB/K] Gain-to-Noise-Temperature figure of merit in RX

TFscale = 1000;                                                               % Time and BB frequency scale for plots (e.g. Tscale = 1000 means "ms" and "kHz")
Ndummy_I = 2;                                                                 % Number of dymmy symbols at the beginning of signal
Ndummy_F = 4;                                                                 % Number of dymmy symbols at the end of signal



%% SIMULATION

Time1 = 1/Fs_BB*(0:(Nbits/log2(M)+Ndummy_I+Ndummy_F)*sps+SRRC_delay-1);                 % Time axis after SRRC shaping in TX
Time2 = 1/Fs_RF*(0:ResFact*((Nbits/log2(M)+Ndummy_I+Ndummy_F)*sps+SRRC_delay)-1);       % Time axis after up-resampling in TX
Time3 = 1/Fs_RF*(0:ResFact*((Nbits/log2(M)+Ndummy_I+Ndummy_F)*sps+SRRC_delay)-1);       % Time axis after LPF in RX
Time4 = 1/Fs_BB*(0:(Nbits/log2(M)+Ndummy_I+Ndummy_F)*sps+SRRC_delay-1);                 % Time axis after down-sampling in RX

input_bits = reshape(dec2bin(In_Msg, bpc).'-'0',1,[])';                                 % Generation of input bit stream (otherwise randomly, i.e. "randi([0,1],Nbits,1)")
mod_symb = QPSK_MOD(input_bits);                                                        % Bit-to-symbol mapping
mod_symb = [zeros(Ndummy_I,1); mod_symb; zeros(Ndummy_F,1)];                            % Dummy symbols padding (just for graphical purpose)
SRRC_TX_symb = SRRC_FILTER_TX([mod_symb; zeros(span/2,1)]);                             % TX SRRC filtering with BB up-sampling by sps (and padding for delay) 
Res_symb_TX = spline(Time1,SRRC_TX_symb,Time2);                                         % RF up-resampling (necessary before up-convertion)
RF_symb_TX_inph = real(Res_symb_TX).*sin(2*pi*Fc*Time2);                                % Up-conversion for in-phase stream [sin(w)]
RF_symb_TX_quad = imag(Res_symb_TX).*cos(2*pi*Fc*Time2);                                % Up-conversion for quadrature stream [sin(w+pi/2)]
RF_symb_TX = RF_symb_TX_inph+RF_symb_TX_quad;                                           % Physical version of signal transmitted over channel
In_Power = sum(abs(RF_symb_TX).^2)/(length(RF_symb_TX)*R);                              % Signal power estimate before HPA
Amp_gain = sqrt(10^((Ant_Power-30)/10)/(In_Power*10^(AntTX_gain/10)));                                       % HPA amplitude gain to reach the target antenna output power
AntHPA_RF_symb_TX = RF_symb_TX*Amp_gain;                                                % HPA and TX antenna amplification
ChTaps = sqrt(10^(ChAtt/10) + ChDist*randn(1,length(AntHPA_RF_symb_TX)));               % Channel taps estimate for attenuation and time distortion
channel_symb = awgn(AntHPA_RF_symb_TX,SNR,'measured')./ChTaps;                          % Channel corruption (AWG noise, attenuation and distortion)
AntLNA_symb_RX = channel_symb*sqrt(GT);
RF_symb_RX_inph = 2*AntLNA_symb_RX.*sin(2*pi*Fc.*Time2);                                % Received RF inphase symbols after down-conversion
RF_symb_RX_quad = 2*AntLNA_symb_RX.*cos(2*pi*Fc.*Time2);                                % Received RF quadrature symbols after down-conversion
BB_symb_RX = filter(Taps_FIR,1,[RF_symb_RX_inph+1i*RF_symb_RX_quad ...                  % Received BB symbols after low-pass filtering
    zeros(1,FIR_delay)]);
Res_symb_RX = spline(Time3,BB_symb_RX(1+FIR_delay:end),Time4);                          % RF down-resampling (advisable after down-convertion) after LPF delay removal
AGC_symb = AGC_BLOCK(conj(Res_symb_RX'));                                               % Received symbols after Automatic Gain Control (NB: transpose inverts imag sign!)
SRRC_RX_symb = SRRC_FILTER_RX([AGC_symb; zeros(span*sps/2,1)]);                         % RX SRRC filtering and padding for delay 
RX_symb_downsamp = downsample(SRRC_RX_symb(1+Ndummy_I*sps+2*SRRC_delay: ...             % Downsample by a factor of sps after removing all delay samples
    end-Ndummy_F*sps),sps);
output_bits = QPSK_DEM(RX_symb_downsamp);                                               % QPSK demapping
err_bits  = sum(output_bits~=input_bits);                                               % Bit stream corruption check
Out_Msg = char(bin2dec(reshape(char(output_bits+'0'),bpc,[]).'))';

fprintf(" - REQUIRED HPA GAIN = %1.1f dB\n",20*log10(Amp_gain));
fprintf(" - CORRUPTED BITS = %d out of %d\n",err_bits,Nbits);
fprintf(" - DECODED MESSAGE : %s\n",Out_Msg);


%% TIME ANALYSIS

% figure
% Time = TFscale/Fs_BB*(0:length(real(SRRC_TX_symb))-1);    
% plot(Time,real(SRRC_TX_symb),'b-',Time,imag(SRRC_TX_symb),'r-')
% xlabel('Time [ms]'); ylabel('Amplitude [V]')
% legend('In-phase','Quadrature','Location','NW')
% title('1 - Signal in TX after SRRC shaping')
% 
% figure
% Time = TFscale/(Fs_BB*ResFact)*(0:length(RF_symb_TX_inph)-1);
% plot(Time,RF_symb_TX_inph,'b-',Time,RF_symb_TX_quad,'r-')
% xlabel('Time [ms]'); ylabel('Amplitude [V]')
% legend('In-phase','Quadrature','Location','NW')
% title('2 - Signal in TX after RF up-convertion (I-Q)')
% 
% figure
% Time = TFscale/(Fs_BB*ResFact)*(0:length(RF_symb_TX)-1);
% plot(Time,RF_symb_TX,'g')
% xlabel('Time [ms]'); ylabel('Amplitude [V]')
% legend('Overall signal (I+Q)','Location','NW')
% title('3 - Physical signal in TX')
% 
% figure
% Time = TFscale/(Fs_BB*ResFact)*(0:length(channel_symb)-1);
% plot(Time,channel_symb,'g')
% xlabel('Time [ms]'); ylabel('Amplitude [V]')
% legend('Overall signal (I+Q)','Location','NW')
% title('4 - Physical signal in RX')
% 
% figure
% Time = TFscale/(Fs_BB*ResFact)*(0:length(RF_symb_RX_inph)-1);
% plot(Time,RF_symb_RX_inph*1e3,'b',Time,RF_symb_RX_quad*1e3,'r')
% xlabel('Time [ms]'); ylabel('Amplitude [mV]')
% legend('In-phase','Quadrature','Location','NW')
% title('5 - Signal in RX after BB down-convertion')
% 
% figure
% Time = TFscale/(Fs_BB*ResFact)*(0:length(real(BB_symb_RX))-1);
% plot(Time,real(BB_symb_RX)*1e3,'b',Time,imag(BB_symb_RX)*1e3,'r')
% xlabel('Time [ms]'); ylabel('Amplitude [mV]')
% legend('In-phase','Quadrature','Location','NW')
% title('6 - Signal in RX after low-pass filtering')
% 
% figure
% Time = TFscale/Fs_BB*(0:length(real(AGC_symb))-1);
% plot(Time,real(AGC_symb),'b',Time,imag(AGC_symb),'r')
% xlabel('Time [ms]'); ylabel('Amplitude [V]')
% legend('In-phase','Quadrature','Location','NW')
% title('7 - Signal in RX after AGC')
% 
% figure
% Time = TFscale/Fs_BB*(0:length(real(SRRC_RX_symb))-1);
% plot(Time,real(SRRC_RX_symb)','b',Time,imag(SRRC_RX_symb)','r')
% xlabel('Time [ms]'); ylabel('Amplitude [V]')
% legend('In-phase','Quadrature','Location','NW')
% title('8 - Signal in RX after SRRC filtering')
% 
figure; hold on
Time = 1:length(RX_symb_downsamp);
plot(Time,real(RX_symb_downsamp),'bo',Time,imag(RX_symb_downsamp),'ro')
stem(Time,real(mod_symb(1+Ndummy_I:end-Ndummy_F)),'bx','LineStyle','-.')
stem(Time,imag(mod_symb(1+Ndummy_I:end-Ndummy_F)),'rx','LineStyle','-.')
title('9 - Sampling of the received waveform'); hold off
xlabel('Sample sequence [#]'); ylabel('Amplitude [V]')
legend('Inphase RX','Quadrature RX','Inphase TX','Quadrature TX')


%% FREQUENCY ANALYSIS

% Fspan = Fs_RF/2;                                                                    % Upper and lower limit for frequency plots (i.e. [-Fs/2 +Fs/2])
% 
% Ns = length(Res_symb_TX);                                                           % Length in samples of the baseband stream after up-resampling
% dF = Fs_RF/Ns;                                                                      % Discretization step of the frequency axis
% Freq = -Fspan:dF:Fspan-dF;                                                          % Frequency axis
% BB_spectrum_amp = fftshift(fft(Res_symb_TX));                                       % BB amplitude spectrum
% BB_spectrum_pwr_dBW = 10*log10(abs(BB_spectrum_amp)/Ns);                            % BB power spectrum
% figure
% plot(Freq/TFscale,BB_spectrum_pwr_dBW,'b')
% xlabel('Frequency [kHz]'); ylabel('Amplitude [dBV]')
% title(sprintf('10 - Baseband Amplitude Spectrum (BW = %1.1f kHz)',BW/1e3))
% xlim([-Fspan/(100*TFscale) Fspan/(100*TFscale)]); grid on
% 
% Out_Power = sum(abs(AntHPA_RF_symb_TX).^2)/(Ns*R);                                  % Signal power estimate after HPA
% Ns = length(RF_symb_TX);                                                            % Length in samples of the baseband stream after up-resampling              
% dF = Fs_RF/Ns;                                                                      % Discretization step of the frequency axis
% Freq = -Fspan:dF:Fspan-dF;                                                          % Frequency axis
% RF_spectrum_amp = fftshift(fft(AntHPA_RF_symb_TX))/Ns;                              % RF amplitude spectrum
% RF_spectrum_pwr_dBW = 10*log10(abs(RF_spectrum_amp).^2/R);                          % RF power spectrum
% figure
% plot(Freq/1e6,RF_spectrum_pwr_dBW+30,'r')
% xlabel('Frequency [MHz]'); ylabel('Power [dBm]'); grid on
% title(sprintf('11 - RF Power Spectrum (SgnPwr = %1.1f W)',Out_Power))


%% @TODO

% aggiungere rumore di fase/frequenza + rumore burst su canale
% incapsulamento di pacchetto (RS+CRC+SCRAMB+INTRL+VITERBI+CIFRATURA) + simulare rx di pacchetto
% simulare IF e filtraggio per frequenza immagine (?)
% aggiungere distorsione di freq in canale ed equalizzatore in rx
% fai codifica di sorgente sui bit da trasmettere e crea messaggio vero (ASCI, immagine o canzone!!)
% prova modulaz OQPSK e altre strane
