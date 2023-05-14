
close all; clearvars; clc

%%  PARAMETERS

Nrows = 4;                      % Block interleaving depth
SymbLen = 27;


%% SIMULATION
InfoStream = 1:1:SymbLen;
IntStream = BlkIntrlv(InfoStream,Nrows);
DeintStream = BlkDeintrlv(IntStream,Nrows);
fprintf("Interleaving I/O check : %d\n",~sum(InfoStream~=DeintStream));


%% FUNCTIONS

%%% --> Function for implementing a block interleaver where matrix is filled
%%%     column by column and then emptied row by row. As input parameter,
%%%     the algorithm needs only the number of rows (aka interleaving depth)
%%%     and adapts the number of columns to the input array size and so can
%%%     handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).
function [ OutStream ] = BlkIntrlv( InStream, Nrows )

    Len = length(InStream);
    OutStream = zeros(1,Len);
    
    CurRow = 1;
    j = 1;
    for i = 1:Len
        OutStream(i) = InStream(j);
        j = j+Nrows;
        if j > Len
            CurRow = CurRow+1;
            j = CurRow;
        end
    end
    
end


%%% --> Function for implementing a block deinterleaver where matrix is filled
%%%     row by row and then emptied column by column. As input parameter,
%%%     the algorithm needs only the number of rows (aka interleaving depth)
%%%     and adapts the number of columns to the input array size and so can
%%%     handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).
function [ OutStream ] = BlkDeintrlv( InStream, Nrows )

    Len = length(InStream);
    Ncols = floor(Len/Nrows);
    Extra = Len-Nrows*Ncols;
    OutStream = zeros(1,Len);
    
    CurCol = 1;
    CurRow = 1;
    j = 1;
    for i = 1:Len
        OutStream(i) = InStream(j);
        j = j+Ncols;
        if CurRow <= Extra
            j = j+1;
            CurRow = CurRow+1;
        end   
        if j > Len
            CurCol = CurCol+1;
            j = CurCol;
            CurRow = 1;
        end
    end
    
end

% fai interleaving convoluzionale
% riporta tutto in C++
