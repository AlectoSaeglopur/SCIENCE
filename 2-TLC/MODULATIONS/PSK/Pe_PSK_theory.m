
% Title: THEORETICAL M-PSK BER CURVES
% Author: Filippo Valmori
% Date: 22/05/2022
% References: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.4)


close all; clearvars; clc



%% PARAMETERS

M = [2 4 8 16 32];                                                                  % Modulation ordervector
EbN0 = 0:1:35;                                                                      % Eb/N0 vvector [dB]


%% PROCESSING

LenM = length(M);
EbN0lin = 10.^(EbN0/10);                                                            % Convert Eb/N0 from db to linear
Peb = zeros(LenM,length(EbN0));
for j = 1:length(M)
    if M(j) == 2
        Peb(j,:) = 0.5/log2(M(j))*erfc(sqrt(EbN0lin*log2(M(j)))*sin(pi/M(j)));      % Based on formulas 4.79, 4.105 and 4.113 from Sklar's book [see NOTE#1]
    else
        Peb(j,:) = 1/log2(M(j))*erfc(sqrt(EbN0lin*log2(M(j)))*sin(pi/M(j)));        % Multiply by 2 since for M > 2 also the imaginary part shall be taken into account
    end
end


%% GRAPHS

markers = {'-o','-*','-x','-^','-p'};
labels = [{' 2-PSK'};{' 4-PSK'};{' 8-PSK'};{' 16-PSK'};{' 32-PSK'}];
colors = {[.2 .2 1],[.2 .8 .2],[1 .6 .2],[1 0 0],[0 .8 .8]};
figure
for i = 1:LenM
    semilogy(EbN0,Peb(i,:),markers{i},'Color',colors{i});
    hold on
end
xlabel('Eb/N0 [dB]'); ylabel('BER'); legend('Location','NE',labels)
title('PSK PERFORMANCE OVER AWGN CHANNEL')
ylim([1e-50 1e1])
grid on; hold off


%% NOTES

% 1. The Peb formula is slighlty different from the one presented in Sklar's book since the "erfc" (aka Q)
%    function is defined differently in Matlab!
   
