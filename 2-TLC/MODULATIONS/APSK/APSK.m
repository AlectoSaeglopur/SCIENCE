
%%% Title: M-APSK MAPPER AND HARD/SOFT DEMAPPER WITH GRAY CODING
%%% Author: Filippo Valmori
%%% Date: 23/11/2018
%%% Reference: [1] DVB-S2 Standard (ETSI EN 302 307)

close all; clearvars; clc

global M


%% SIMULATION #1 - SINGLE RUN PERFORMANCE OVER AWGN CHANNEL

Nbits = 9600;                                                       % Number of info bits to be simulated
SNR = 20;                                                           % [dB] Signal-to-noise ratio over AWGN channel
M = 16;                                                             % Modulation order
DecMode = 'Hard';

CheckParam(Nbits);
QamTable = GetApskTable();
InfoBits = randi([0 1],1,Nbits);
MapSymbs = Mapper(InfoBits,QamTable);
ChanSymbs = awgn(MapSymbs,SNR,'measured');
DemBits = Demapper(ChanSymbs,QamTable,DecMode);
Nerr = sum(InfoBits~=DemBits);

fprintf(" Number of errors = %d out of %d\n",Nerr,Nbits);
blue = [0 .5 1];
figure; box on; hold on
plot(real(ChanSymbs),imag(ChanSymbs),'*','Color',blue)
plot(real(MapSymbs),imag(MapSymbs),'r.','MarkerSize',20)
title(sprintf('%d-APSK CONSTELLATION',M)); axis(1.2*2^(log2(M)/2)*[-1 1 -1 1])
xlabel('In-phase'); ylabel('Quadrature'); legend('Noisy','Ideal')
hold off


%%% --> Function for checking the parameters correctness
function [ ] = CheckParam( Nbits )
    
    global M

    if M ~= 16 && M ~= 32
        error('Invalid modulation order (M)');
    elseif Nbits/log2(M) ~= round(Nbits/log2(M))
        error('Invalid number of info bits (Nbits)');
    end
    
end


%%% --> Function for getting the mapping table between bit sets and
%%%     APSK symbols according to Gray Coding
function Table = GetApskTable( )

    global M
    
    Table = struct('Bits',0:M-1,'Symbs',zeros(1,M));
    
    switch M  
        
        case 16
            Table.Symbs(1) = 3*exp(1i*pi/4);                        % i.e. 0000
            Table.Symbs(2) = 3*exp(-1i*pi/4);                       % i.e. 0001
            Table.Symbs(3) = 3*exp(3i*pi/4);                        % i.e. 0010
            Table.Symbs(4) = 3*exp(-3i*pi/4);                       % i.e. 0011
            Table.Symbs(5) = 3*exp(1i*pi/12);                       % i.e. 0100
            Table.Symbs(6) = 3*exp(-1i*pi/12);                      % i.e. 0101
            Table.Symbs(7) = 3*exp(11i*pi/12);                      % i.e. 0110
            Table.Symbs(8) = 3*exp(-11i*pi/12);                     % i.e. 0111
            Table.Symbs(9) = 3*exp(5i*pi/12);                       % i.e. 1000
            Table.Symbs(10) = 3*exp(-5i*pi/12);                     % i.e. 1001
            Table.Symbs(11) = 3*exp(7i*pi/12);                      % i.e. 1010
            Table.Symbs(12) = 3*exp(-7i*pi/12);                     % i.e. 1011
            Table.Symbs(13) = exp(1i*pi/4);                         % i.e. 1100
            Table.Symbs(14) = exp(-1i*pi/4);                        % i.e. 1101
            Table.Symbs(15) = exp(3i*pi/4);                         % i.e. 1110
            Table.Symbs(16) = exp(-3i*pi/4);                        % i.e. 1111
            
        case 32
            Table.Symbs(1) = 3*exp(1i*pi/4);                        % i.e. 00000
            Table.Symbs(2) = 3*exp(5i*pi/12);                       % i.e. 00001
            Table.Symbs(3) = 3*exp(-1i*pi/4);                       % i.e. 00010
            Table.Symbs(4) = 3*exp(-5i*pi/12);                      % i.e. 00011
            Table.Symbs(5) = 3*exp(3i*pi/4);                        % i.e. 00100
            Table.Symbs(6) = 3*exp(7i*pi/12);                       % i.e. 00101
            Table.Symbs(7) = 3*exp(-3i*pi/4);                       % i.e. 00110
            Table.Symbs(8) = 3*exp(-7i*pi/12);                      % i.e. 00111
            Table.Symbs(9) = 5*exp(1i*pi/8);                        % i.e. 01000
            Table.Symbs(10) = 5*exp(3i*pi/8);                       % i.e. 01001
            Table.Symbs(11) = 5*exp(-1i*pi/4);                      % i.e. 01010
            Table.Symbs(12) = -5i;                                  % i.e. 01011
            Table.Symbs(13) = 5*exp(3i*pi/4);                       % i.e. 01100
            Table.Symbs(14) = 5i;                                   % i.e. 01101
            Table.Symbs(15) = 5*exp(-7i*pi/8);                      % i.e. 01110
            Table.Symbs(16) = 5*exp(-5i*pi/8);                      % i.e. 01111
            Table.Symbs(17) = 3*exp(1i*pi/12);                      % i.e. 10000
            Table.Symbs(18) = exp(1i*pi/4);                         % i.e. 10001 
            Table.Symbs(19) = 3*exp(-1i*pi/12);                     % i.e. 10010
            Table.Symbs(20) = exp(-1i*pi/4);                        % i.e. 10011
            Table.Symbs(21) = 3*exp(11i*pi/12);                     % i.e. 10100
            Table.Symbs(22) = exp(3i*pi/4);                         % i.e. 10101
            Table.Symbs(23) = 3*exp(-11i*pi/12);                    % i.e. 10110           
            Table.Symbs(24) = exp(-3i*pi/4);                        % i.e. 10111
            Table.Symbs(25) = 5;                                    % i.e. 11000
            Table.Symbs(26) = 5*exp(1i*pi/4);                       % i.e. 11001
            Table.Symbs(27) = 5*exp(-1i*pi/8);                      % i.e. 11010 
            Table.Symbs(28) = 5*exp(-3i*pi/8);                       % i.e. 11011
            Table.Symbs(29) = 5*exp(7i*pi/8);                       % i.e. 11100
            Table.Symbs(30) = 5*exp(5i*pi/8);                       % i.e. 11101
            Table.Symbs(31) = -5;                                   % i.e. 11110
            Table.Symbs(32) = 5*exp(-3i*pi/4);                      % i.e. 11111
            
    end

end


%%% --> Function for mapping an input bit stream into the constellation
%%%     symbols specified by the mapping table
function [ OutSymbs ] = Mapper( InBits, Table )

    global M
    
    L = log2(M);                                                    % Number of bits per symbol
    InLen = length(InBits);
    OutLen = InLen/L;
    OutSymbs = zeros(1,OutLen);

    for j = 1:OutLen
        CurBits = bi2de(InBits(1+(j-1)*L:j*L),'left-msb');
        for i = 1:M
            if Table.Bits(i) == CurBits
                OutSymbs(j) = Table.Symbs(i);
                break;
            end
        end
    end
    
end


%%% --> Function for demapping an input symbol stream into bits (hard or soft)
%%%     accordig to the specified mapping table
function [ OutBits ] = Demapper( InSymbs, Table, DecMode )

    global M
    
    L = log2(M);                                                    % Number of bits per symbol
    InLen = length(InSymbs);
    OutBits = zeros(1,InLen*L);                                     % Output bits (in antipodal form in case of soft-decoding)
    
    if strcmp(DecMode,'Hard')
        
        for k = 1:InLen
            Dist = abs(real(InSymbs(k))-real(Table.Symbs))+ ...
                abs(imag(InSymbs(k))-imag(Table.Symbs));
            [~,MinIdx] = min(Dist);
            OutBits(1+(k-1)*L:k*L) = de2bi(Table.Bits(MinIdx),L,'left-msb');
        end
        
    elseif strcmp(DecMode,'Soft')
        
        N0 = 4;                                                     % Assumed noise variance in linear (i.e. 6 dB)
        for k = 1:InLen
                Dist = exp(-((real(InSymbs(k))-real(Table.Symbs)).^2+ ...
                    (imag(InSymbs(k))-imag(Table.Symbs)).^2)/N0);
                for i = 1:L
                    Num = 0;
                    Den = 0;
                    for j = 1:M
                        if bitget(Table.Bits(j),i) == 1
                            Num = Num+Dist(j);
                        else
                            Den = Den+Dist(j);
                        end
                    end
                    OutBits(L-i+1+(k-1)*L) = N0/2*log(Num/Den);   
                end
        end

    else
        
        error('Invalid decoding method (DecMode)');
        
    end
    
end
