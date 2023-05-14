
%%% Title: DSP FIXED-POINT IIR FILTER DESIGN (DIRECT-FORM I)
%%% Author: Filippo Valmori
%%% Date: 22/02/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013) [Ch.9]

close all
clearvars
clc


%% PARAMETERS %%

Amp = 1.0;                                                                      % Square wave amplitude [V]
Frq = 0.5e3;                                                                    % Square wave frequency [Hz]
Ncyc = 10;                                                                      % Number of square wave cycles to be simulated [.]

Fs = 10e3;                                                                      % Sample rate [Sa/s]
Order = 4;                                                                      % IIR filter order ('LPF' by default)
Rip = 25;                                                                       % Stopband attenuation/ripple [dB]
Fcut = 1.5e3;                                                                   % Cut-off frequency [Hz]

Q = 15;                                                                         % fixed-point Q-format [NB: use 7 for int8, 15 for int16, or 31 for int32]
AdcRes = 12;                                                                    % ADC signed resolution [b] (e.g. 12 bits means samples between -2048 and +2047)
Vdd = 3.3;                                                                      % ADC reference voltage [V] (assuming ADC input signal shall be between 0 and Vdd V)



%% CONSTANTS %%

Npt = 512;                                                                      % Number of points for filter representation
ScFct = 1e3;                                                                    % Scale factor for time plots (e.g. 1e3 = 1ms)
Blue = [.2 .2 1];                                                               % Custom blue color
Green = [.2 .8 .2];                                                             % Custom green color
Orange = [1 .7 .2];                                                             % Custom orange color
Violet = [.8 0 .8];                                                             % Custom violet color
Azure = [0 .8 .8];                                                              % Custom azure color
Red = [1 .2 0];                                                                 % Custom red color
Brown = [.5 .2 0];                                                              % Custom brown color
Grey = [.7 .7 .7];                                                              % Custom grey color
Black = [0 0 0];                                                                % Custom black color



%% 1. PROCESSING : FLOATING-POINT %%

[B,A] = cheby2(Order,Rip,Fcut/(Fs/2),"low");                                    % Design IIR taps
[H,FreqAxH] = freqz(B,A,Npt,Fs);                                                % Get filter complex transfer function
H_mgn = 20*log10(abs(H));                                                       % Estimate filter magnitude spectrum [dB] 
H_pha = 180*unwrap(angle(H))/pi;                                                % Estimate filter phase spectrum [deg]

TimeAx = 1/Fs*(0:Ncyc*(Fs/Frq)-1);                                              % Get time axis for signal
Sgn1 = sin(2*pi*Frq*TimeAx);                                                    % Create input square wave
Sgn1(Sgn1>=0) = Amp;
Sgn1(Sgn1<0) = -Amp;
[FreqAx,Spect1,~] = GetSpect(Sgn1,Fs);
Sgn1 = Sgn1+Vdd/2;                                                              % Add DC-offset (needed only to simulated the actual behavior of dsPIC33CH ADC module)

Sgn2 = filter(B,A,Sgn1-Vdd/2);                                                  % Apply floating-point IIR filtering
[~,Spect2,~] = GetSpect(Sgn2,Fs);



%% 2. PROCESSING : FIXED-POINT %%

Sgn3 = ConvAdc(Sgn1,AdcRes,Vdd,Q);                                              % Convert input wave into ADC samples

[Sgn4,Bx1,Ax1,Ss1,Cs1] = FxdP_IIR_DF1(Sgn3,B,A,Q,AdcRes);                       % Apply fixed-point direct-form-1 IIR filtering
Sgn4 = Conv_Fixed2Float(Sgn4,Q)*Vdd;
[~,Spect4,~] = GetSpect(Sgn4,Fs);

[Sgn5,Bx2,Ax2,Ss2,Bs2,As2] = FxdP_IIR_DF2(Sgn3,B,A,Q,AdcRes);                   % Apply fixed-point direct-form-2 IIR filtering
Sgn5 = Conv_Fixed2Float(Sgn5,Q)*Vdd;
[~,Spect5,~] = GetSpect(Sgn5,Fs);



%% RESULTS %%

fprintf("\n >> PARAMETERS <<");
fprintf("\n * Fs = %1.1f kSa/s",Fs/1e3);
fprintf("\n * Ntaps = %d",length(Ax1));
fprintf("\n\n >> DIRECT-FORM 1 <<");
fprintf("\n * Bx = ")
fprintf("%d ",Bx1);
fprintf("\n * -Ax = ")
fprintf("%d ",-Ax1);
fprintf("\n * Ss = %d",Ss1);
fprintf("\n * Cs = %d",Cs1);
fprintf("\n\n >> DIRECT-FORM 2 <<");
fprintf("\n * Bx = ")
fprintf("%d ",Bx2);
fprintf("\n * -Ax = ")
fprintf("%d ",-Ax2);
fprintf("\n * Ss = %d",Ss2);
fprintf("\n * Bs = %d",Bs2);
fprintf("\n * As = %d\n\n",As2);

figure('Name','1. FLOATING-POINT FILTERING','NumberTitle','off')
subplot(2,3,1)
box on
plot(FreqAxH,H_mgn,'.-','linewidth',1,'markersize',3,'Color',Black)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Magnitude [dB]','fontsize',11)
title('FILTER MAGNITUDE','fontsize',13)
grid on
subplot(2,3,4)
box on
plot(FreqAxH,H_pha,'.-','linewidth',1.1,'markersize',3,'Color',Grey)
xlabel('Frequency [Hz]','fontsize',11)
ylabel('Phase [deg]','fontsize',11)
title('FILTER PHASE','fontsize',13)
grid on
subplot(2,3,2)
box on
plot(TimeAx*ScFct,Sgn1,'.-','linewidth',1.1,'markersize',3,'Color',Azure)
xlabel('Time [ms]','fontsize',11)
ylabel('Amplitude [V]','fontsize',11)
title('ADC INPUT','fontsize',13)
grid on
subplot(2,3,5)
box on
plot(FreqAx/ScFct,Spect1,'.-','linewidth',1.1,'markersize',3,'Color',Blue)
xlabel('Frequency [kHz]','fontsize',11)
ylabel('Power [dB]','fontsize',11)
title('ADC SPECTRUM | DF2-IIR','fontsize',13)
grid on
subplot(2,3,3)
box on
plot(TimeAx*ScFct,Sgn2,'.-','linewidth',1.1,'markersize',3,'Color',Orange)
xlabel('Time [ms]','fontsize',11)
ylabel('Amplitude [V]','fontsize',11)
title('DAC SAMPLES','fontsize',13)
grid on
subplot(2,3,6)
box on
plot(FreqAx/ScFct,Spect2,'.-','linewidth',1.1,'markersize',3,'Color',Red)
xlabel('Time [ms]','fontsize',11)
ylabel('Amplitude [V]','fontsize',11)
title('DAC SPECTRUM','fontsize',13)
grid on

figure('Name','2. FIXED-POINT FILTERING','NumberTitle','off')
subplot(2,3,1)
box on
plot(TimeAx*ScFct,Sgn3,'.-','linewidth',1.1,'markersize',3,'Color',Green)
xlabel('Time [ms]','fontsize',11)
ylabel('Level [.]','fontsize',11)
title('ADC SAMPLES','fontsize',13)
grid on
subplot(2,3,2)
box on
plot(TimeAx*ScFct,Sgn4,'.-','linewidth',1.1,'markersize',3,'Color',Orange)
xlabel('Time [ms]','fontsize',11)
ylabel('Amplitude [V]','fontsize',11)
title('DF1-IIR SAMPLES','fontsize',13)
grid on
subplot(2,3,5)
box on
plot(FreqAx/ScFct,Spect4,'.-','linewidth',1.1,'markersize',3,'Color',Red)
xlabel('Frequency [kHz]','fontsize',11)
ylabel('Power [dB]','fontsize',11)
title('DAC SPECTRUM | DF1-IIR','fontsize',13)
grid on
subplot(2,3,3)
box on
plot(TimeAx*ScFct,Sgn5,'.-','linewidth',1.1,'markersize',3,'Color',Azure)
xlabel('Time [ms]','fontsize',11)
ylabel('Amplitude [V]','fontsize',11)
title('DAC SAMPLES | DF2-IIR','fontsize',13)
grid on
subplot(2,3,6)
box on
plot(FreqAx/ScFct,Spect5,'.-','linewidth',1.1,'markersize',3,'Color',Blue)
xlabel('Frequency [kHz]','fontsize',11)
ylabel('Power [dB]','fontsize',11)
title('DAC SPECTRUM | DF2-IIR','fontsize',13)
grid on



%% FUNCTIONS %%

% >> Function to convert input number into a (Q+1)-bit signed integer.
function Y = ConvInt( X, Q )
  switch Q
    case 7
      Y = int8(X);
    case 15
      Y = int16(X);
    case 31
      Y = int32(X);
    case 63
      Y = int64(X);
    otherwise
      error("Invalid Q!")
  end
end


% >> Function to convert input number into a (Q+1)-bit unsigned integer.
function Y = ConvUint( X, Q )
  switch Q
    case 7
      Y = uint8(X);
    case 15
      Y = uint16(X);
    case 31
      Y = uint32(X);
    otherwise
      error("Invalid Q!")
  end
end


% >> Function to convert a number from floating to fixed-point format.
function [ Ydec, Yhex ] = Conv_Float2Fixed( X, Q )
  Ydec = ConvInt(0,Q);                                                          % Fixed-point output in decimal format
  Z = abs(X);
  if Z > 1
    error("Input out of range!")
  end
  for j = 1:Q
    Z = 2*Z;
    if Z >= 1
      Z = Z-1;
      Ydec = Ydec+2^(Q-j);
    end
  end
  if X < 0
    Yhex = dec2hex(bitcmp(ConvUint(Ydec,Q))+1,(Q+1)/4);
    Ydec = -Ydec;
  else
    Yhex = dec2hex(Ydec,(Q+1)/4);                                               % Fixed-point output in hexadecimal format
  end
end


% >> Function to convert a number from fixed to floating-point format.
function Y = Conv_Fixed2Float( X, Q )
  Y = double(X).*2^-Q;
end


% >> Function to execute fixed-point multiplication.
function Y = MultFx( X1, X2, Q )
  Y = ConvInt(X1,2*Q+1)*ConvInt(X2,2*Q+1);                                      % Convert operands to higher format (e.g. int16 to int32) and multiply
  Y = bitshift(Y,1);                                                            % Left-shift to get rid of sign-extended bit
  Y = ConvInt(bitshift(Y,-(Q+1)),Q);                                            % Right-shift to move back to original format
  if (Y == 0) && (X1 ~= 0) && (X2 ~= 0)
    warning('Multiplication underflow occurred!');
  end
end


% >> Function to get C scaling factor for direct-form-1 IIR filter in fixed-point arithmetics.
function [ Cval, Cshf ] = GetC_DF1( B, A )
  Vmax = max(max(abs(B)),max(abs(A)));
  Cval = 1;
  Cshf = 0;
  while Vmax >= Cval
    Cval = 2*Cval;
    Cshf = Cshf+1;
  end
end


% >> Function to get S scaling factor for direct-form-1 IIR filter in fixed-point arithmetics.
function [ Sval, Sshf ] = GetS_DF1( B, A )
  Imax = 1;                                                                     % Always equal to 1, since in "ConvSgn" signal is always adapted to exploit the entire fixed-point range! [DO NOT CHANGE]
  Hmax = Imax*sum(abs(impz(B,A)));
  Sval = 1;
  Sshf = 0;
  while Hmax >= Sval
    Sval = 2*Sval;
    Sshf = Sshf+1;
  end
end


% >> Function to convert filter taps from floating-point to fixed-point representation.
function [ Bx, Ax ] = ConvTaps( B, A, Q )
  N = length(A);
  Bx = ConvInt(zeros(1,N),Q);
  Ax = ConvInt(zeros(1,N),Q);
  for i = 1:N
    [Bx(i),~] = Conv_Float2Fixed(B(i),Q);
    [Ax(i),~] = Conv_Float2Fixed(A(i),Q);
  end
end


% >> Function to filter signal with direct-form-1 IIR in fixed-point arithmetics.
function [ SgnOut, Bx, Ax, Ss, Cs ] = FxdP_IIR_DF1( SgnIn, B, A, Q, AdcRes )
  SgnIn = bitshift(SgnIn,(Q+1-AdcRes));                                         % Right/left shift ADC samples to exploit the entire fixed-point integer range
  [Cv,Cs] = GetC_DF1(B,A);                                                      % Retrieve C scaling factor
  [~,Ss] = GetS_DF1(B,A);                                                       % Retrieve S scaling factor
  [Bx,Ax] = ConvTaps(B/Cv,A/Cv,Q);
  Ntaps = length(A);
  Len = length(SgnIn);
  X = ConvInt(zeros(1,Ntaps-1),Q);
  Y = ConvInt(zeros(1,Ntaps-1),Q);
  SgnOut = ConvInt(zeros(1,Len),Q);
  for i = 1:length(SgnIn)
    InSa = bitshift(SgnIn(i),-Ss);
    OutSa = MultFx(InSa,Bx(1),Q);
    for j = 2:Ntaps
      OutSa = OutSa+MultFx(X(j-1),Bx(j),Q)+MultFx(Y(j-1),-Ax(j),Q);
    end
    OutSa = bitshift(OutSa,Cs);
    for j = Ntaps-1:-1:2
      X(j) = X(j-1);
      Y(j) = Y(j-1);
    end
    X(1) = InSa;
    Y(1) = OutSa;
    SgnOut(i) = bitshift(OutSa,Ss);
  end
end


% >> Function to get A and B scaling factors for direct-form-2 IIR filter in fixed-point arithmetics.
function [ Aval, Ashf, Bval, Bshf ] = GetAB_DF2( B, A )
  Bmax = sum(abs(B));
  Bval = 1;
  Bshf = 0;
  while Bmax >= Bval
    Bval = 2*Bval;
    Bshf = Bshf+1;
  end
  Amax = max(abs(A));
  Aval = 1;
  Ashf = 0;
  while Amax >= Aval
    Aval = 2*Aval;
    Ashf = Ashf+1;
  end
end


% >> Function to get S scaling factor for direct-form-2 IIR filter in fixed-point arithmetics.
function [ Sval, Sshf ] = GetS_DF2( A )
  Imax = 1;                                                                     % Always equal to 1, since in "ConvSgn" signal is always adapted to exploit the entire fixed-point range! [DO NOT CHANGE]
  Hmax = Imax*sum(abs(impz(1,A)));
  Sval = 1;
  Sshf = 0;
  while Hmax >= Sval
    Sval = 2*Sval;
    Sshf = Sshf+1;
  end
end


% >> Function to filter signal with direct-form-2 IIR in fixed-point arithmetics.
function [ SgnOut, Bx, Ax, Ss, Bs, As ] = FxdP_IIR_DF2( SgnIn, B, A, Q, AdcRes )
  SgnIn = bitshift(SgnIn,(Q+1-AdcRes));                                         % Right/left shift ADC samples to exploit the entire fixed-point integer range
  [Av,As,Bv,Bs] = GetAB_DF2(B,A);                                               % Retrieve A and B scaling factors
  [~,Ss] = GetS_DF2(A);                                                         % Retrieve S scaling factor
  [Bx,Ax] = ConvTaps(B/Bv,A/Av,Q);                                              % Scale and convert taps from floating to fixed-point
  Ntaps = length(A);
  Len = length(SgnIn);
  W = ConvInt(zeros(1,Ntaps-1),Q);                                              % Initialize internal shift-registers
  SgnOut = ConvInt(zeros(1,Len),Q);
  for i = 1:length(SgnIn)
    InSa = bitshift(SgnIn(i),-(Ss+As));                                         % Right-shift input sample to prevent overflow
    for j = 2:Ntaps
      InSa = InSa+MultFx(W(j-1),-Ax(j),Q);                                      % Apply left-branch filtering
    end
    InSa = bitshift(InSa,As);
    OutSa = InSa*B(1);
    for j = 2:Ntaps
      OutSa = OutSa+MultFx(W(j-1),Bx(j),Q);                                     % Apply right-branch filtering
    end
    for j = Ntaps-1:-1:2 
      W(j) = W(j-1);                                                            % Update shift-registers
    end
    W(1) = InSa;
    SgnOut(i) = bitshift(OutSa,(Ss+Bs));
  end
end


% >> Function to convert ADC input signal into corresponding signed integer smples.
function SgnOut = ConvAdc( SgnIn, AdcRes, Vdd, Q )
  SgnOut = ConvInt((SgnIn-Vdd/2)/(Vdd/2)*2^(AdcRes-1),Q);                       % Remove DC offset and convert input voltage to corresponding ADC level
end



% >> Function to get the power spectrum of the input signal.
function [ FreqAx, PwrSpect, OvPwrF ] = GetSpect( Sgn, Fs )
    Ns = length(Sgn);                                                           % Length (in samples) of the input waveform
    dF = Fs/Ns;                                                                 % Discretization step for frequency axis
    FreqAx = -Fs/2:dF:Fs/2-dF;                                                  % Frequency axis for spectrum plot
    CpxSpect = fftshift(fft(Sgn))/Ns;                                           % Complex spectrum
    PwrSpect = 20*log10(abs(CpxSpect));                                         % Power spectrum [dBW/Hz]
    OvPwrF = 10*log10(sum((abs(CpxSpect)).^2));                                 % Overall signal power [dBW] estimated in frequency domain (NB: do NOT multiply by dF, that's wrong for this descrete representation!)
    % As a check, below the overall power is estimated in time as well %
%     OvPwrT = 10*log10(sum(Sgn.^2)/length(Sgn));                                 % Overall signal power [dBW] estimated in time domain (i.e. P = Vrms^2/R, where Vrms = sqrt(1/N*sum(Sgn[i]^2)) and assuming R = 1 Ohm)
end



%% NOTES %%

% 0. The project is intended to simulate an actual fixed-point IIR filtering with dsPIC33CH, where the
%    ADC is fed with a square wave from a signal generator (SG), filtered and the DAC updated with the
%    output sine tone, in turn connected to the oscilloscope. The ADC is configured to have a signed
%    resolution of 12 bits (i.e. generating samples between -2048 and +2047) and the input voltage to
%    convert shall be in the range 0 to 3.3V. Therefore, the square wave generate by the SG shall have
%    a DC offset of 1.65V, which is evaluated by the ADC as 0 (instead, for example, 0V correspond to
%    -2048). The DAC, having a resolution of 12 bits as well, requires unsigned integer as input to
%    drive the output voltage from 0 to 3.3V. The square waves Sgn4/5. To solve the issue a higher Q
%    shall be used!

% 1. Remember that filtering a square wave with amplitude A and frequency Fc (using a cut-off frequency
%    between Fc and 3*Fc) generates a sinusoid with frequency Fc and amplitude > A!

% 2. Increasing Fs (and keeping all other parameters fixed) causes the taps values to decrease. This can
%    cause underflow (causing the output signal not to be filtered at all) or bad representation (causing
%    an undesired DC-offset on the output waaveestupon multiplications.

% 3. This MATLAB script shall be used to generate taps and scaling factors for the MPLAB project "Ex6_IIR_FP",
%    based on dsPIC33CH512MP508 MCU (PXS platform folder).
