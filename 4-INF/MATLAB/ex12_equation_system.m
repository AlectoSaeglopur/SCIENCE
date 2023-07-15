
close all; clearvars; clc


%% SIMPLE EXAMPLE OF SYSTEM EQUATION

syms x y z
Eq1 = z/2 + x + y/2 == 1;
Eq2 = -3 + y - z == x;
Eq3 = x + 2*y + 3*z == -10;

[A,B] = equationsToMatrix([Eq1,Eq2,Eq3],[x,y,z]);
X = linsolve(A,B);
fprintf("x = %1.3f\n",X(1));
fprintf("y = %1.3f\n",X(2));
fprintf("z = %1.3f\n",X(3));
fprintf("-----\n");



%% CIRCUIT SOLVER FOR EXAMPLE 4.11 (P.283) OF SEDRA'S "MICROELECTRONIC CIRCUITS"

syms ib1 ic1 ie1 vb1 ib2 ie2 vb2
Eq1 = ie1 == (vb1-0.7)/3e3;
Eq2 = ib1 == (15-3*vb1)/100e3;
Eq3 = ic1 == 100*ib1;
Eq4 = ie1 == ic1+ib1;
Eq5 = ic1 == ib2+(15-vb2)/5e3;
Eq6 = ie2 == (15-vb2-0.7)/2e3;
Eq7 = ie2 == (1+100)*ib2;

[A,B] = equationsToMatrix([Eq1,Eq2,Eq3,Eq4,Eq5,Eq6,Eq7], [ib1,ic1,ie1,vb1,ib2,ie2,vb2]);
X = linsolve(A,B);

fprintf("ib1 = %1.3f uA\n",X(1)*1e6);
fprintf("ic1 = %1.3f mA\n",X(2)*1e3);
fprintf("ie1 = %1.3f mA\n",X(3)*1e3);
fprintf("vb1 = %1.3f V\n",X(4));
fprintf("ib2 = %1.3f uA\n",X(5)*1e6);
fprintf("ie2 = %1.3f mA\n",X(6)*1e3);
fprintf("vb2 = %1.3f V\n",X(7));

















