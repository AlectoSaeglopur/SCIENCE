
close all; clearvars; clc

spf = 2^18-1;               % number of samples per frame
Nsymb = 4050;               % overall number of symbols per packet (8100 for QPSK and 4050 for 16APSK))

Gold_polyX = '1+x^7+x^18';
Gold_polyY = '1+x^5+x^7+x^10+x^18';
Gold_initX = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
Gold_initY = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
Gold_n = 0;
GOLD_SEQ2 = comm.GoldSequence('FirstPolynomial',Gold_polyX,'SecondPolynomial',Gold_polyY,...
    'FirstInitialConditions',Gold_initX,'SecondInitialConditions',Gold_initY,...
    'Index',Gold_n,'SamplesPerFrame',spf);


Zn = GOLD_SEQ2();
Rn = zeros(1,Nsymb);
for j=0:Nsymb-1
    Rn(j+1) = 2*Zn(mod(j+131072,262143)+1)+Zn(j+1);
end
Ciq = exp(.5i*pi.*Rn);

Ci = real(Ciq); Cq = imag(Ciq);


symb_stream = rand(1,Nsymb)+1i*rand(1,Nsymb);

rand_symb_stream = real(symb_stream).*real(Ciq)-imag(symb_stream).*imag(Ciq)+ ...
    1i*(real(symb_stream).*imag(Ciq)+imag(symb_stream).*real(Ciq));


derand_symb_stream = (Cq.*imag(rand_symb_stream)+Ci.*real(rand_symb_stream))./(Ci.^2+Cq.^2)+ ...
    1i*((Ci.*imag(rand_symb_stream)-Cq.*real(rand_symb_stream))./(Ci.^2+Cq.^2));
    

sum(symb_stream == derand_symb_stream)

