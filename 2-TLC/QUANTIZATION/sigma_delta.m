
%%% Title: SIGMA-DELTA MODULATION ADC
%%% Author: Filippo Valmori
%%% Date: 10/03/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013) [Ch.12]

close all
clearvars
clc


%% PARAMETERS

Fs1 = 10e3;                                                         % Original sample-rate [Sa/s] (NB: shall be Fs1 > 2*Fcb )
Fca = 1e3;                                                          % "Slower" sinusoid frequency [Hz]
Fcb = 2.2e3;                                                        % "Faster" sinusoid frequency [Hz]
Ncyc = 10;                                                          % Number of "slower" sinusoid cycles to be simulated
Aa = 0.6;                                                           % "Slower" sinusoid amplitude [V]
Ab = 1.5;                                                           % "Faster" sinusoid amplitude [V]

Nbadc = 1;                                                          % ADC resolution [b] (see NOTE#4)
X = 10;                                                             % Oversampling factor [.]
Ord = 3;                                                            % Sigma-delta order [.]



%% CONSTANTS

Nskip = 1*Ord;                                                      % Number of samples to be skipped from plotting at beginning and end of SD-ADC output [Sa] (see NOTE#2)
Fs2 = X*Fs1;                                                        % Sigma-delta sample-rate [Sa/s]
AdcMax = 2^(Nbadc-1);                                               % ADC maximum level (in absolute value) after conversion
ScFct = 1e3;                                                        % Scale factor for time plots (e.g. 1e3 = 1ms)
Blue = [.2 .2 1];                                                   % Custom blue color
Green = [.2 .8 .2];                                                 % Custom green color
Orange = [1 .7 .2];                                                 % Custom orange color
Violet = [.8 0 .8];                                                 % Custom violet color
Azure = [0 .8 .8];                                                  % Custom azure color
Red = [1 .2 0];                                                     % Custom red color
Brown = [.5 .2 0];                                                  % Custom brown color
Grey = [.7 .7 .7];                                                  % Custom grey color
Black = [0 0 0];                                                    % Custom black color



%% PROCESSING

% 1. Regular ADC
TimeAx1 = 1/Fs1*(0:round(Ncyc*Fs1/Fca));                            % Get time axis
SgnA1 = Aa*sawtooth(2*pi*Fca*TimeAx1,0.5)+ ...
    Ab*sin(2*pi*Fcb*TimeAx1);                                       % Generate input analog signal (i.e. after sample-and-hold, thus discrete in time but still continuous in amplitude)
SgnS1 = SgnA1*AdcMax/max(abs(SgnA1));                               % Rescale analog signal to fit entire ADC range (see NOTE#1)
SgnQ1 = round(SgnS1);                                               % Apply regular ADC (R-DAC) quantization
ErrQ1 = SgnQ1-SgnS1;                                                % Estimate R-DAC quantization error (cleary always between +/- 0.5)
Snr1 = 10*log10(sum(SgnS1(1+Nskip:end-Nskip).^2)/ ...
    sum(ErrQ1(1+Nskip:end-Nskip).^2));                              % Estimate signal-to-quantization-noise ration for R-ADC conversion

% 2. Sigma-delta ADC
TimeAx2 = 1/Fs2*(0:round(Ncyc*Fs2/Fca));                            % Get oversampled time axis
SgnA2 = Aa*sawtooth(2*pi*Fca*TimeAx2,0.5)+ ...
    Ab*sin(2*pi*Fcb*TimeAx2);                                       % Generate oversampled input analog signal (i.e. after sample-and-hold, thus discrete in time but still continuous in amplitude)
SgnS2 = SgnA2*AdcMax/max(abs(SgnA2));                               % Rescale oversampled analog signal to fit entire ADC range
SgnQ2 = SigmaDeltaADC(SgnS2,X,Fs1,Ord);                             % Apply sigma-delta ADC (SD-DAC) quantization
ErrQ2 = SgnQ2-SgnS1;                                                % Estimate SD-DAC quantization error (expected smaller than ErrQ1) (see NOTE#3)
Snr2 = 10*log10(sum(SgnS1(1+Nskip:end-Nskip).^2)/ ... 
    sum(ErrQ2(1+Nskip:end-Nskip).^2));                              % Estimate signal-to-quantization-noise ration for SD-ADC



%% RESULTS

fprintf(' * R-DAC SNR = %1.2f dB\n',Snr1);
fprintf(' * SD-DAC SNR = %1.2f dB\n\n',Snr2);

figure('Name','REGULAR VS SIGMA-DELTA ADC','NumberTitle','off')
subplot(2,2,1)
box on
hold on
plot(TimeAx1*ScFct,SgnA1,'*-','linewidth',1,'markersize',3,'Color',Brown)
plot(TimeAx2*ScFct,SgnA2,'o-.','linewidth',1,'markersize',3,'Color',Orange)
hold off
title('ANALOG SIGNAL')
legend(sprintf('Fs1 = %d kSa/s',Fs1/1e3),sprintf('Fs2 = %d kSa/s',Fs2/1e3))
xlabel('Time [ms]')
ylabel('Amplitude [V]')
grid on
subplot(2,2,3)
box on
hold on
plot(TimeAx1*ScFct,SgnS1,'*-','linewidth',1,'markersize',3,'Color',Blue)
stairs(TimeAx1*ScFct,SgnQ1,'*--','linewidth',1,'markersize',3,'Color',Red)
stairs(TimeAx1*ScFct,SgnQ2,'*-.','linewidth',1,'markersize',3,'Color',Green)
title('QUANTIZED SIGNALS')
legend(' Original','R-ADC','SD-ADC')
xlabel('Time [ms]')
ylabel('Magnitude [AdcL]')                                          % Magnitude expressed in terms of ADC levels
ylim(1.1*AdcMax*[-1 1])
hold off
grid on
subplot(2,2,2)
stem(TimeAx1*ScFct,ErrQ1,'*-','linewidth',1,'markersize',3,'Color',Grey)
title('R-ADC QUANTIZATION ERROR')
xlabel('Time [ms]')
ylabel('Magnitude [AdcL]')
ylim(1.1*[-0.5 0.5])
grid on
subplot(2,2,4)
stem(TimeAx1*ScFct,ErrQ2,'*-','linewidth',1,'markersize',3,'Color',Black)
title('SD-ADC QUANTIZATION ERROR')
xlabel('Time [ms]')
ylabel('Magnitude [AdcL]')
xlim(ScFct*[TimeAx1(1+Nskip) TimeAx1(end-Nskip)])
grid on



%% FUNCTIONS

% >> Function to execute Sigma-Delta Modulation analog-to-digital conversion (Fig 12.32 as reference).
function W = SigmaDeltaADC( X, M, Fs, Ord )
    Len = length(X);                                                % Get input signal length [Sa]
    Y = zeros(1,Len);
    Ydly = 0;                                                       % Delayed Y-sample [z^-1]
    H = zeros(1,Ord);
    for i = 1:Len
        H(1) = (H(1)+(X(i)-Ydly));                                  % Update 1st integrator output value 
        for j = 2:Ord
            H(j) = H(j)+(H(j-1)-Ydly);                              % Update all other integrators output values
        end
        Y(i) = round(H(Ord));                                       % Apply quantization [+=E]
        Ydly = Y(i);                                                % Update delayed Y-sample
    end
    Ntaps = 20*M+1;                                                 % Calculate number of anti-aliasing FIR filter taps [NB: this has to increase in respect of X, here 20 has been chosen empirically]
    Fcut = Fs/2;                                                    % Anti-aliasing/anti-image FIR filter cut-off frequency [Hz]
    B = FirWnd(Ntaps,'LPF',Fcut,'HAM',Fs*M);                        % Get anti-aliasing FIR filter taps
    Ndly = (Ntaps-1)/2;                                             % Calculate expected delay due to FIR filtering [Sa]
    W = filter(B,1,[Y zeros(1,Ndly)]);                              % Apply anti-aliasing filtering
    W = W(1+Ndly:end);                                              % Remove extra delay samples         
    W = W(1:M:end);                                                 % Apply down-sampling
end


% >> Function to calculate FIR filter taps based on window method.
function B = FirWnd( Ntaps, Ftype, Fcut, Wtype, Fs )
    if strcmp(Ftype,'LPF') && (length(Fcut) == 1)
        WnL = Fcut*(2*pi/Fs);                                       % Calculate normalized cut-frequency [rad]
        WnH = 0;
    elseif strcmp(Ftype,'HPF') && (length(Fcut) == 1)
        WnL = 0;
        WnH = Fcut*(2*pi/Fs);
    elseif (strcmp(Ftype,'BPF') || strcmp(Ftype,'BSF'))  && (length(Fcut) == 2)
        WnL = Fcut(1)*(2*pi/Fs);
        WnH = Fcut(2)*(2*pi/Fs);
    else
        error('Invalid cut-frequencies (Fcut) or filter type (Ftype)')
    end
    M = (Ntaps-1)/2;
    hH = sin(WnH*(-M:1:-1))./((-M:1:-1)*pi);
    hH(M+1) = WnH/pi;
    hH(M+2:1:Ntaps) = hH(M:-1:1);
    hL = sin(WnL*(-M:1:-1))./((-M:1:-1)*pi);
    hL(M+1) = WnL/pi;
    hL(M+2:1:Ntaps) = hL(M:-1:1);
    switch Ftype                                                    % see Tab. 7.1 at Pag. 221
        case 'LPF'                                                  % LOW-PASS FILTER
            h(1:Ntaps) = hL(1:Ntaps);
        case 'HPF'                                                  % HIGH-PASS FILTER
            h(1:Ntaps) = -hH(1:Ntaps);
            h(M+1) = 1+h(M+1);
        case 'BPF'                                                  % BAND-PASS FILTER
            h(1:Ntaps) = hH(1:Ntaps)-hL(1:Ntaps);
        case 'BSF'                                                  % STOP-PASS FILTER
            h(1:Ntaps) = hL(1:Ntaps)-hH(1:Ntaps);
            h(M+1) = 1+h(M+1);
    end
    switch Wtype                                                    % see Tab. 7.7 at Pag. 241
        case 'REC'                                                  % RECTANGULAR WINDOW
            w(1:Ntaps) = ones(1,Ntaps);
        case 'TRI'
            w = 1-abs(-M:1:M)/M;
        case 'HAN'
            w = 0.5+0.5*cos((-M:1:M)*pi/M);
        case 'HAM'
            w = 0.54+0.46*cos((-M:1:M)*pi/M);
        case 'BLK'
            w = 0.42+0.5*cos((-M:1:M)*pi/M)+0.08*cos(2*(-M:M)*pi/M);
        otherwise
            error(' Invalid window type (Wtype)')
    end
    B = h.*w;                                                       % Scale taps by selected window
end



%% NOTES

% 1. Rescaling the analog signal to fit entire ADC range is a smart trick, so that the successive ADC quantization can be executed
%    simply by means of the "round" function.

% 2. Nskip takes into account the quantization error of the SD-ADC ouput signal has initial and final spikes. In particular, initial
%    error spikes are due to the initialization of the integrator, whereas the final ones to the abrupt truncation of the analog
%    signal tail (which is low-pass filtered by SD-ADC causing consistent error). However, in continuous operation conditions this
%    is of course absolutely negligible.

% 3. The SD-ADC quantization noise cannot be reduced endlessly (by just increasing Ord and X), since beyond a certain level the Q-noise
%    itself becomes correlated to the input analog signal itself.

% 4. Due to the simplified quantization procedure used here (i.e. through "round" function), the number of ADC levels is not 2^Nbadc as
%    expected, but 2^Nbadc+1. For instance, Nbadc = 2 b creates x5 levels: -2, -1, 0, +1, +2. However, this does not affect the outcome
%    and quality of the simulation.

% 5. Using Fig. 12.28 as reference, note that all Sigma-Delta conversion steps before decimation are executed analogically :
%    - Sample-and hold -> capacitor + switch;
%    - Integrator -> OPAMP + capacitor;
%    - Adder -> OPAMP
%    - Delay block -> DAC (with clock delayed by 1x Ts = 1/Fs);
%    - Q-noise adder -> ADC.
   