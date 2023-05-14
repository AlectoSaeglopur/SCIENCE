
%%% Title: UNIFORM VS MU-LAW QUANTIZATION
%%% Author: Filippo Valmori
%%% Date: 03/03/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013) [Ch.11]

close all
clearvars
clear all
clc


%% FUNCTIONS

% >> Function to apply uniform quantization.
function SgnOut = UnifQuantiz( SgnIn, Qlev )
  ValMin = min(SgnIn);
  ValMax = max(SgnIn);
  Delta = (ValMax-ValMin)/Qlev;
  Edges = linspace(ValMin,ValMax,Qlev+1);
  Qvals = ValMin+Delta/2:Delta:ValMax-Delta/2;
  Len = length(SgnIn);
  SgnOut = Qvals(end)*ones(1,Len);
  for i = 1:Len
    for j = 2:length(Edges)-1
      if SgnIn(i) < Edges(j)
        SgnOut(i) = Qvals(j-1);
        break
      end
    end
  end
%  fprintf('* Theoretical quantization error  = %1.3e\n',(Delta^2)/12);
%  fprintf('* Experimental quantization error = %1.3e\n',mean((SgnIn-SgnOut).^2));
end


% >> Function to apply Mu-law compression algorithm.
function SgnOut = MuLawCompr( SgnIn, Mu, SgnMax )
  Len = length(SgnIn);
  SgnOut = zeros(1,Len);
  for j = 1:Len
    SgnOut(j) = sign(SgnIn(j))*log(1+Mu*abs(SgnIn(j))/SgnMax)/log(1+Mu);
  end
end


% >> Function to apply Mu-law expansion algorithm.
function SgnOut = MuLawExp( SgnIn, Mu, SgnMax )
  Len = length(SgnIn);
  SgnOut = zeros(1,Len);
  for j = 1:Len
    SgnOut(j) = SgnMax*sign(SgnIn(j))/Mu*((1+Mu)^abs(SgnIn(j))-1);
  end
end



%% PARAMETERS

Fs = 50e3;                                                          % Sample frequency [Sa/s]
Fc = 100;                                                           % Input analog signal frequency [Hz]
A = 1;                                                              % Input analog signal amplitude [V]
Ncyc = 5;                                                           % Number of input analog signal cycles to be simulated [.]

Mu = 111;                                                           % Compression degree [.]
Qlev = 8;                                                          % Number of quantization levels [.]



%% CONSTANTS

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

TimeAx = 1/Fs*(0:round(Ncyc*(Fs/Fc))-1);
Sgn1 = 2*A+A*sin(2*pi*Fc*TimeAx);
Sgn2 = UnifQuantiz(Sgn1,Qlev);
Err2 = 100*(Sgn2-Sgn1)./Sgn1;

Sgn3 = MuLawCompr(Sgn1,Mu,max(abs(Sgn1)));
Sgn4 = UnifQuantiz(Sgn3,Qlev);
Sgn5 = MuLawExp(Sgn4,Mu,max(abs(Sgn1)));
Err5 = 100*(Sgn5-Sgn1)./Sgn1;



%% RESULTS

figure
subplot(2,3,1)
plot(TimeAx*ScFct,Sgn1,'.-','linewidth',1.1,'markersize',5,'Color',Blue)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('ORIGINAL WAVE','Fontsize',13)
grid on
subplot(2,3,2)
plot(TimeAx*ScFct,Sgn2,'.-','linewidth',1.1,'markersize',5,'Color',Red)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('U-QUANTIZED WAVE','Fontsize',13)
grid on
subplot(2,3,3)
stem(TimeAx*ScFct,Err2,'.-','linewidth',1.1,'markersize',5,'Color',Green,'markeredgecolor',Green)
xlabel('Time [ms]')
ylabel('Quantization error [%]')
title('U-QUANTIZED ERROR','Fontsize',13)
grid on
subplot(2,3,4)
plot(TimeAx*ScFct,Sgn3,'.-','linewidth',1.1,'markersize',5,'Color',Azure)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('M-COMPRESSED WAVE','Fontsize',13)
grid on
subplot(2,3,5)
plot(TimeAx*ScFct,Sgn5,'.-','linewidth',1.1,'markersize',5,'Color',Violet)
xlabel('Time [ms]')
ylabel('Amplitude [V]')
title('M/U-QUANTIZED','Fontsize',13)
grid on
subplot(2,3,6)
stem(TimeAx*ScFct,Err5,'.-','linewidth',1.1,'markersize',5,'Color',Black,'markeredgecolor',Black)
xlabel('Time [ms]')
ylabel('Quantization error [%]')
title('M/U-QUANTIZED ERROR','Fontsize',13)
grid on



%% NOTES

% 1. As can be seen from the final graphs, the standard quantizer generates a variable quantization error in time.
%    Instead, the mu-law compression + uniform quantization + u-law expansion sequence allows to keep the quantization
%    error constant in time and with a value almost halved compared to the maximum of the uniform quantizer alone.
%    For instance, at 7.5 ms the input analog signal has a minimum (also in absolute value, since sinusoid is DC-shifted)
%    and in fact that's where the uniform quantiuzation alone experiences the largest error. On the contrary, using the
%    Mu-law quantization the discretization step is keep smaller in that region in order to keep the error constant.
