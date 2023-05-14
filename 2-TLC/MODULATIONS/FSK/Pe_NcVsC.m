
%%%  THEORETICAL COHERENT VS NON-COHERENT FSK PROBABILITY OF ERROR OVER AWGN CHANNEL %%%

close all; clearvars; clc

M = 4;                                                              % Modulation order
EbN0 = -5:0.5:16;                                                   % Eb/N0 range [dB]

% Pe_CFSK = M/2*erfc(sqrt(10.^(EbN0/10)*log2(M)));                    % BER for coherent FSK demodulation from Sklar's formulas 4.107 and 4.112 [DO NOT USE]
Pe_CFSK = 1/2*(M/2)*erfc(sqrt(10.^(EbN0/10)*log2(M)/2));            % BER for coherent FSK demodulation [MODIFIED: since "erfc" definition is different between Sklar and Matlab!])
Pe_NCFSK = M/4*exp(-10.^(EbN0/10)*log2(M)/2);                       % BER for non-coherent FSK demodulation (see Sklar's Eq. 4.96)
EbN0_C2NC = 10*log10(-2/log2(M)*log(4/M*Pe_CFSK));                  % Equivalent non-coherent Eb/N0 values in correspondance of coherent BER estimate

figure('Name',sprintf('FSK PERFORMANCE : M=%d',M),'NumberTitle','off')
subplot(1,3,1); box on
semilogy(EbN0,Pe_CFSK,'r.-')
hold on
semilogy(EbN0,Pe_NCFSK,'b.--')
legend('Coherent','Non-coherent')
xlabel('Eb/N0 [dB]'); ylabel('BER')
title('Comparison fixing Eb/N0')
grid on; hold off

subplot(1,3,2); box on
semilogy(EbN0,Pe_CFSK,'r.-')
hold on
semilogy(EbN0_C2NC,Pe_CFSK,'b.--')
legend('Coherent','Non-coherent')
xlabel('Eb/N0 [dB]'); ylabel('BER')
title('Comparison fixing BER')
grid on; hold off

subplot(1,3,3)
semilogx(Pe_CFSK,EbN0_C2NC-EbN0,'k.-')
xlabel('BER'); ylabel('Gain [dB]')
title('C over NC gain fixing BER')
grid on
