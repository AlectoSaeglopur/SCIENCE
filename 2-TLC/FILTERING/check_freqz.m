
close all
clearvars
clc


%% PARAMETERS %%

B = [1 -0.9 0.81];                                                              % H(z) numerator -> e.g. [1 5 -3] means 1 +5*z^-1 -3*z^-2
A = [1 -0.6 0.36];                                                              % H(z) denominator
N = 1024;                                                                       % Number of points for the filter representation



%% PROCESSING %%

[H,w_rad] = freqz(B,A,N);                                                       % get complex transfer function
w_deg = 180*w_rad/pi;
H_ampl = abs(H);                                                                % retrieve amplitude spectrum     
H_phas = 180*angle(H)/pi;                                                       % retrieve phase spectrum



%% RESULTS %%

figure
subplot(1,2,1)
box on
plot(w_deg,H_ampl,'.-','linewidth',1.0,'markersize',3,'Color','Blue')
xlabel('Normalized frequency [deg]','fontsize',10)
ylabel('Magnitude','fontsize',10)
xlim([0 180])
grid on

subplot(1,2,2)
box on
plot(w_deg,H_phas,'.-','linewidth',1.0,'markersize',3,'Color','Red')
xlabel('Normalized frequency [deg]','fontsize',10)
ylabel('Phase [deg]','fontsize',10)
xlim([0 180])
grid on

