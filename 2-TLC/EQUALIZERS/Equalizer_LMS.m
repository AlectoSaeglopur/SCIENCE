
%%% Title:      LEAST MEAN SQUARES (LMS) EQUALIZER SIMULATION
%%% Author:     Filippo Valmori
%%% Date:       02/08/2018
%%% Reference:  Digital Communications - B.Sklar & P.K.Ray (p.159) 
%%%             Wikipedia (https://en.wikipedia.org/wiki/Least_mean_squares_filter)

clearvars; close all; clc


%% PARAMETERS

Nseq = 5000;                % Length of the training/info sequence
Ntaps = 50;                 % Equalizer order
Mu = 0.01;                  % Step size
span = 16;                  % Span (in symbols) for channel representation
DF = 1.1e-1;                 % Standard deviation of channel distortion
Rs = 1e3;                   % [Hz] Symbol rate
SNR = 100;                  % [dB] Signal-to-noise ratio over channel
TSF = 1e3;                  % Time plot scale factor (e.g. "1e3" means "ms")


%% PROCESSING (INFO)

Ts = 1/Rs;                                          % [s] Symbol time

OrigSeq = randi([-2 2],Nseq,1);                     % Training/info sequence

ChTaps = [1;zeros(span-1,1)]+DF*rand(span, 1);      % Distorting channel impulse response
DistTrain = filter(ChTaps,1,OrigSeq);               % Channel filtering
DistTrain = awgn(DistTrain,SNR,'measured');         % AWGN addition

EqTaps = zeros(Ntaps,1);                            % Equalizer taps initialization
err = zeros(1,Nseq-Ntaps+1);                        % Error vector

for k  = Ntaps : Nseq
    
    d = DistTrain(k:-1:k-Ntaps+1);                  % Portion of the distorted input inside the equalizer at time k
    y = EqTaps'*d;                                  % Equalizer output sample at time k
    e = OrigSeq(k)-y;                               % Error sample at time k
    err(k-Ntaps+1) = e;                             % Save error sample into vector (just for plot purpose)
    EqTaps = EqTaps + Mu*d*conj(e);                 % Equalizer taps updating

end

RecSeq = filter(EqTaps,1,DistTrain);                % Recovered sequence after equalizer convergence


%% PLOTS AND COMMENTS

Time = Ts*(0:Nseq-1);

figure('name','LMS')
semilogy(abs(err));
xlabel('Iteration Number'); ylabel('Absolute value')
title('Error convergence')

figure('name','LMS'); box on; hold on
stem(Time*TSF,OrigSeq,'b*')
stem(Time*TSF,DistTrain,'rx')
stem(Time*TSF,RecSeq,'go--')
legend('Original symbols','Distorted symbols','Recovered symbols')
title('Training/info sequence comparison')
xlabel('Time [ms]'); ylabel('Amplitude [V]')
xlim(TSF*[.3 .35]); hold off


% NB#1: For the sake of simplicity, the info sequence has been used also as training.

% NB#2: Higher the channel distortion requires lower Mu, higher Ntaps and higher
% Ntrain to assure the algorithm convergence!

% NB#3: Instead, low SNR increases the noise floor for error convergence (see the
% first figure) and that is not recoverable in any way!
