
%%% Title: 2ND ORDER SYSTEM CONTROL
%%% Author: Filippo Valmori
%%% Date: 21/07/2023
%%% Reference: [1] MATLAB and Simulink crash course for engineers (Eklas Hossain, 2022) [Ch.9]

close all; clearvars; clc


%% PARAMETERS

Num = [0 1 10];                                                                 % Transfer function numerator : s +10
Den = [1 2 6];                                                                  % Transfer function denumerator : s^2 +2s +6



%% PARTIAL FRACTION EXPANSION

[r,p,k] = residue(Num,Den)                                                      % re-arrange transfer function as H(s) = k +Epsilon rj/(s-pj)



%% SYMBOLIC
syms s t
H1 = (Num(1)*s^2+Num(2)*s^1+Num(3)) / (Den(1)*s^2+Den(2)*s^1+Den(3));           % Symbolic reprentation of transfer function H(s)

figure
subplot(2,2,1)
fplot(H1,'b.-')
xlim(50*[-1 1])
ylim(2.5e0*[-.1 1])
xlabel('{\it s = \alpha+j\omega}')
ylabel('G(s)')
title('TRANSFER FUNCTION')
grid on



%% TRANSFER FUNCTION

H2 = tf(Num,Den)                                                                % MATLAB built-in reprentation of transfer function H(s)
zeros = zero(H2)                                                                % Estimate transfer function zeros
poles = pole(H2)                                                                % Estimate transfer function poles



%% STEP RESPONSE

[Ystep,Xstep] = step(H2);                                                       % Estimate step response

subplot(2,2,2)
plot(Xstep,Ystep,'b.-')
xlabel('Time [s]')
ylabel('Amplitude')
title('STEP RESPONSE')
grid on



%% IMPULSE RESPONSE

[Yimp,Ximp] = impulse(H2);                                                      % Estimate impulse response
subplot(2,2,3)
plot(Ximp,Yimp,'b.-')
xlabel('Time [s]')
ylabel('Amplitude')
title('IMPULSE RESPONSE')
grid on

h(t) = ilaplace(H1)                                                             % Calculate impulse response formula

dc_gain = limit(H1,s,0)                                                         % Calculate DC gain of transfer function (NB: shall match H(s) in 1st graph for s=0)

lim0 = limit(s*H1,s,Inf)                                                        % Calculate transfer function initial value through limit in Laplace domain (NB: shall match h(t) forumla for t=0)

limInf = limit(s*H1,s,0)                                                        % Calculate transfer function final value through limit in Laplace domain (NB: shall match h(t) forumla for t=Inf)
