
close all; clearvars; clc


%% TAYLOR SERIES

syms x
f(x) = 1.5*sin(x)-cos(2*x);                                                         % original function f(x)
T4 = taylor(f,x,0,'order',5);                                                       % 4th-order Taylor approximation of function f(x) around x=0
T23 = taylor(f,x,0,'order',23);                                                     % 23rd-order Taylor approximation of function f(x) around x=0

figure
box on; hold on
fplot(f,'k.-')
fplot(T4,'b.-')
fplot(T23,'r.-')
axis(6*[-1 1 -1 1])
xlabel('x');
ylabel('f(x)');
legend('Original','Taylor-4th','Taylor-23rd','location','southwest')
hold off
grid on