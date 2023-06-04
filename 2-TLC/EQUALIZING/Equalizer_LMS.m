
%%% Title:      LEAST MEAN SQUARES (LMS) EQUALIZER SIMULATION
%%% Author:     Filippo Valmori
%%% Date:       02/06/2023
%%% Reference:  [1] Digital Communications (Bernard Sklar, 2014) [Ch.3] 
%%%             [2] Wikipedia (https://en.wikipedia.org/wiki/Least_mean_squares_filter)

close all
clearvars
clc


%% PARAMETERS

Nseq = 2000;                                                    % Length of training sequence [Sy]
Ntaps = 50;                                                     % Equalizer order
Mu = 0.01;                                                      % Step size
span = 16;                                                      % Span for channel representation [Sy]
DF = 0.17;                                                      % Standard deviation of channel distortion (assuming Gaussian distribution)
Rs = 1e3;                                                       % Symbol rate [Sy/s]
SNR = 40;                                                       % Signal-to-noise ratio over channel [dB]
TSF = 1e3;                                                      % Graphs scaling factor (e.g. "1e3" means "ms")



%% PROCESSING (INFO)

Ts = 1/Rs;                                                      % Symbol time [s]
SeqTx = randi([-2 2],Nseq,1);                                   % Training sequence (random integer symbols between +/-2)
ChTaps = [1;zeros(span-1,1)]+DF*rand(span,1);                   % Distorting channel impulse response
RxSeq = awgn(filter(ChTaps,1,SeqTx),SNR,'measured');            % Apply distortion and AWGN due to channel
EqTaps = zeros(Ntaps,1);                                        % Equalizer taps initialization
Verr = zeros(1,Nseq-Ntaps+1);                                   % Error vector (for graph purpose only)
for k = Ntaps:Nseq
    d = RxSeq(k:-1:k-Ntaps+1);                                  % Signal portion at equalizer input at time k
    y = EqTaps'*d;                                              % Equalizer output sample at time k
    e = SeqTx(k)-y;                                             % Error sample at time k
    Verr(k-Ntaps+1) = e;                                        % Save error sample st time k
    EqTaps = EqTaps+Mu*d*conj(e);                               % Update equalizer taps
end
RcSeq = filter(EqTaps,1,RxSeq);                                 % Recovered sequence after equalizer convergence
Time = Ts*(0:Nseq-1);                                           % Get time axis for graphs



%% PLOTS

Blue = [.2 .2 1];                                               % Custom blue color
Green = [.2 .8 .2];                                             % Custom green color
Orange = [1 .7 .2];                                             % Custom orange color
Violet = [.8 0 .8];                                             % Custom violet color
Azure = [0 .8 .8];                                              % Custom azure color
Red = [1 .2 0];                                                 % Custom red color
Brown = [.5 .2 0];                                              % Custom brown color
Grey = [.7 .7 .7];                                              % Custom grey color
Black = [0 0 0];                                                % Custom black color

figure
subplot(2,2,1)
plot(Verr,'Color',Black);
title('LMS TREND')
xlabel('Iteration [Sy]');
ylabel('e[k]')
grid on

subplot(2,2,2)
box on;
hold on
plot(Time*TSF,SeqTx,'.','markersize',20,'Color',Green)
plot(Time*TSF,RxSeq,'x','markersize',10,'Color',Red)
plot(Time*TSF,RcSeq,'o','markersize',10,'Color',Blue)
xlim(TSF*[.5 .55]);
legend('TxSeq','RxSeq','RcSeq')
title('TIME COMPARISON')
xlabel('Time [ms]')
ylabel('Amplitude [V]')
grid on
hold off

subplot(2,2,3)
box on;
hold on
plot(Time*TSF,RxSeq-SeqTx,'.-','markersize',20,'Color',Orange)
plot(Time*TSF,RcSeq-SeqTx,'.-','markersize',10,'Color',Violet)
legend('RxSeq','RcSeq')
title('ERROR TREND')
xlabel('Time [ms]')
ylabel('Error [V]')
grid on
hold off



%%  NOTES

% 1. For simplicity's sake the successive info sequence has been omitted.
% 2. Higher the channel distortion requires lower Mu, higher Ntaps and higher Nseq to assure the algorithm convergences.
% 3. Instead, low SNR increases the noise floor for error convergence and that is not recoverable in any way.
% 4. In real applications, equalization is applied at sample level (since equalization is useful especial for symbol
%    recovery). However, conceptually its operation can be perfectly tested also at symbol level.
