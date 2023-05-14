close all; clearvars; clc


%% PARAMETERS

Nbits = 100;                                % [.] Number of bits to be simulated (must be an even value)
Rb = 100e3;                                 % [b/s] Data rate
dev = 50e3;                               % [Hz] Frequency deviation
A = 1;                                      % [V] Carrier waveform amplitude
osf = 16;                                    % Oversampling factor
SNR = 10;                                   % [dB] Signal-to-noise ratio

if dev > Rb
    ResFact = round(osf*dev/Rb);
    dev = Rb*ResFact/osf;
else
    ResFact = round(osf*Rb/dev);
    dev = osf*Rb/ResFact;
end
ResFact = osf;
Fs = Rb*ResFact;                            % [S/s] Sample rate at RF

Tb = 1/Rb;
Ts = 1/Fs;                                  % [s] Sample period
h = 2*dev/Rb;                               % [.] Modulation index
init_phase = 0;
TFscale_RF = 1e6;                           % Scale factor for x-axis of RF plots (e.g. "1e6" means "us" and "MHz")
TFscale_BB = 1e3;                           % Scale factor for x-axis of BB plots (e.g. "1e3" means "ms" and "kHz")

min_pwr_fsk_bb = 1e-8;                      % [W] Minimum power level for FSK frequency plot at BB
light_grey = [.5 .5 .5];                    % RGB custom grey color for plots
bit_in = 5;                                 % Number of bit periods when the time plot window begins
bit_fn = 9;                                 % Number of bit periods when the time plot window ends

% fprintf("Data rate = %1.2f kHz\n",Rb/1e3);
% fprintf("Deviation = %1.2f kHz\n",dev/1e3);
% fprintf("Modulation Index = %1.1f\n",h);


%%  DATA GENERATION

rng(23)
input_bits = randi([0 1],1,Nbits);
input_symbs = dev*(2*input_bits-1);

Time = Ts*(0:ResFact*Nbits-1);


%% FSK MODULATION

fsk_symbs = repelem(input_symbs,ResFact);

fsk_wave_bb_I = A*cos(2*pi*fsk_symbs.*Time+init_phase);
fsk_wave_bb_Q = A*sin(2*pi*fsk_symbs.*Time+init_phase);

fsk_wave_bb = fsk_wave_bb_I+1i*fsk_wave_bb_Q;
fsk_wave_bb = awgn(fsk_wave_bb,SNR,'measured');

Ns_fsk = length(fsk_wave_bb);
dF_fsk = Fs/Ns_fsk;
freq_fsk = -Fs/2:dF_fsk:Fs/2-dF_fsk;
fsk_amp_spect_bb = abs(fftshift(fft(fsk_wave_bb))/Ns_fsk);
fsk_pwr_spect_bb = fsk_amp_spect_bb.^2;



%% SAVE BASEBAND COMPLEX SAMPLES INTO BINARY FILE

% stream_length = length(fsk_wave_bb);
% IQ_stream(1:2:stream_length*2-1) = fsk_wave_bb_I;
% IQ_stream(2:2:stream_length*2) = fsk_wave_bb_Q;
% log_name = sprintf(strcat('SCAT_FSK_bb_stream_',num2str(osf)));
% fid = fopen(log_name,'w');
% fwrite(fid,IQ_stream,'float32');
% fclose(fid);



%% PLOTS

figure('Name','1 - FSK','NumberTitle','off');
subplot(2,1,1); hold on
plot(TFscale_RF*Time,real(fsk_wave_bb),'g-','LineWidth',1)
plot(TFscale_RF*Time,imag(fsk_wave_bb),'r-','LineWidth',1)
xlabel('Time [us]'); ylabel('Amplitude [V]'); hold off
axis([bit_in*Tb*TFscale_RF bit_fn*Tb*TFscale_RF -1.1*A 1.1*A])
for j = 1:Nbits-1
    line([j*Tb*TFscale_RF j*Tb*TFscale_RF],[-1.1*A 1.1*A],'LineStyle','--','Color',light_grey)
end
title('Waveforms'); leg = legend(' I',' Q'); leg.FontSize = 8;
subplot(2,1,2)
semilogy(freq_fsk/TFscale_BB,fsk_pwr_spect_bb,'c')
xlabel('Frequency [kHz]'); ylabel('Power [W]'); grid on
title('BB Spectrum'); axis([-4*dev/TFscale_BB 4*dev/TFscale_BB min_pwr_fsk_bb/1e2 1]);


%% RX FSK DEMOD (Angle discontinuities detector) #2

disc_flag = false;
alpha = atan2(imag(fsk_wave_bb),real(fsk_wave_bb));
discont = zeros(1,length(alpha));
last_pend = sign(alpha(2)-alpha(1));
if last_pend < 0
    last_bit = 0;
else
    last_bit = 1;
    discont(1) = 1;
    discont(2) = 1;
end
for j = 3:length(alpha)
    alpha_diff = alpha(j)-alpha(j-1);
    if disc_flag == true && abs(alpha_diff) > pi
        last_bit = 1-last_bit;
        last_pend = -last_pend;
        disc_flag = false;
    elseif abs(alpha(j)-alpha(j-1)) < pi
        new_pend = sign(alpha_diff);
        disc_flag = false;
        if new_pend ~= last_pend
            last_bit = 1-last_bit;
            last_pend = new_pend;
        end
    else
        disc_flag = true;
    end
    discont(j) = last_bit;
end


shift2 = 4;
discont_down = downsample(discont,ResFact,shift2);
err2 = sum(input_bits ~= discont_down)

% figure
% plot(1:length(alpha),alpha,'r.-')
% figure
% stem(1:length(discont),discont,'b'); ylim([-.2 1.2])
% figure
% stem(1:length(discont_down),discont_down,'b'); ylim([-.2 1.2])




%% RX FSK DEMOD #3 Phase detector = multiplier + LPF

k=1;
Sn = zeros(1,length(fsk_wave_bb));
for j =2:length(fsk_wave_bb)
    Sn(j) = fsk_wave_bb(j)*conj(fsk_wave_bb(j-k));
end

shift3 = 1;%ResFact/2;
Sn_down = downsample(Sn,ResFact,shift3);
Dn = imag(Sn_down)>0;
err3 = sum(input_bits ~= Dn)

% figure('Name','#3 - S(n)','NumberTitle','off');
% plot(1:length(Sn),real(Sn),'b.-',1:length(Sn),imag(Sn),'r.-')
