
%% USING CONVOLUTION TO MULTIPLY POLYNOMIALS

close all; clearvars; clc

a = [3 1 5];                        % a(x) = 3z^2 +z +5
b = [1 0 -2 4 -1];                  % b(x) = z^4 -2z^2 +4z -1
c = conv(a,b)                       % c(x) = a(x)*b(x) = 3z^6 +z^5 -z^4 +10z^3 -9z^2 +19z -5 [EXPECTED]
