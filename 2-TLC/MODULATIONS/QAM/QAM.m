
%%% Title: M-QAM MAPPER AND HARD/SOFT DEMAPPER WITH GRAY CODING
%%% Author: Filippo Valmori
%%% Date: 23/11/2018
%%% Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Quadrature_amplitude_modulation

close all; clearvars; clc

global M


%% SIMULATION #1 - SINGLE RUN PERFORMANCE OVER AWGN CHANNEL

Nbits = 9600;                                                       % Number of info bits to be simulated
SNR = 20;                                                           % [dB] Signal-to-noise ratio over AWGN channel
M = 64;                                                             % Modulation order (NB: shall be a power of 4)
DecMode = 'Hard';

% CheckParam(Nbits);
QamTable = GetQamTable();
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
title(sprintf('%d-QAM CONSTELLATION',M)); axis(1.2*2^(log2(M)/2)*[-1 1 -1 1])
xlabel('In-phase'); ylabel('Quadrature'); legend('Noisy','Ideal')
hold off


%%% --> Function for checking the parameters correctness
function [ ] = CheckParam( Nbits )
    
    global M

    if mod(log2(M),2) ~= 0 || M < 2
        error('Invalid modulation order (M)');
    elseif Nbits/log2(M) ~= round(Nbits/log2(M))
        error('Invalid number of info bits (Nbits)');
    end
    
end


%%% --> Function for getting an M-sequence of Gray coded decimal numbers
function [ GrayMtx ] = GetGray( )

    global M
    
    L = log2(M);                                                    % Number of bits per symbol
    GrayMtx = zeros(M,L);                                           % Gray mapping matrix
    LastCell = [0;1];
    GrayMtx(1:2,end) = LastCell;
    for i = 2:L
        GrayMtx(1+2^(i-1):2^i,end-i+2:end) = flipud(LastCell);
        GrayMtx (1+2^(i-1):2^i,end-i+1) = 1;
        LastCell = GrayMtx(1:2^i,end-i+1:end);
    end

end


%%% --> Function for getting the mapping table between bit sets and
%%%     QAM symbols according to Gray Coding
function Table = GetQamTable( )

    global M
    
    GrayMtx = GetGray();
    L = log2(M);
    MaxVal = 2^(L/2)-1;                                             % Maximum amplitude value per via
    Nrows = sqrt(M);                                                % Number of rows (and columns) within constellation
    Table = struct('Bits',zeros(1,M),'Symbs',zeros(1,M));
    for j = 1:M
        Rem = mod(j-1,Nrows);
        Quot = floor((j-1)/Nrows);
        Table.Bits(j) = bi2de(GrayMtx(j,:),'left-msb');
        Table.Symbs(j) = (-MaxVal+2*Rem)*(-1)^(Quot+1)+1i*(MaxVal-2*Quot);
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
