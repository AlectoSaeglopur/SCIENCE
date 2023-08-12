
close all; clearvars; clc


%%  PARAMETERS

SymbLen = 100;                                                                      % Source stream length
Nrows = 4;                                                                          % Block-interleaving depth
I = 5;                                                                              % Convolutional-interleaving number of delay lines
M = 13;                                                                             % Convolutional-interleaving number of delay cells per block



%% SIMULATION

InfoStream = 1:1:SymbLen;

BlkIntStream = BlkIntrlv(InfoStream,Nrows);
BlkDeintStream = BlkDeintrlv(BlkIntStream,Nrows);

CnvIntStream = CnvIntrlv(InfoStream,I,M);
CnvDeintStream = CnvDeintrlv(CnvIntStream,I,M);

LogVal = {'FALSE','TRUE'};
fprintf(" Block-interleaving check : %s\n",LogVal{isequal(InfoStream,BlkDeintStream)+1});
fprintf(" Convolutional-interleaving check : %s\n",LogVal{isequal(InfoStream,CnvDeintStream)+1});



%% FUNCTIONS

% >> Function for implementing a block interleaver where matrix is filled column by column
%    and then emptied row by row. As input parameter, the algorithm needs only the number
%    of rows (aka interleaving depth) and adapts the number of columns to the input array
%    size and so can handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).
function [ OutData ] = BlkIntrlv( InData, Nrows )
    Len = length(InData);
    OutData = zeros(1,Len);
    CurRow = 1;
    j = 1;
    for i = 1:Len
        OutData(i) = InData(j);
        j = j+Nrows;
        if j > Len
            CurRow = CurRow+1;
            j = CurRow;
        end
    end
end


% >> Function for implementing a block deinterleaver where matrix is filled row by row and
%    then emptied column by column. As input parameter, the algorithm needs only the number
%    of rows (aka interleaving depth) and adapts the number of columns to the input array
%    size and so can handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).
function [ OutData ] = BlkDeintrlv( InData, Nrows )
    Len = length(InData);
    Ncols = floor(Len/Nrows);
    Extra = Len-Nrows*Ncols;
    OutData = zeros(1,Len);
    CurCol = 1;
    CurRow = 1;
    j = 1;
    for i = 1:Len
        OutData(i) = InData(j);
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


% >> Function for implementing a convolutional interleaver. It requires as the data vector
%    and the number of delay lines (I) and the number of delay cells per block (M). 
function [ OutData ] = CnvIntrlv( InData, I, M )
    Len = length(InData);                                                           % overall I/O buffers length
    OutData = zeros(1,Len);
    ShReg = NaN(I-1,M*(I-1));                                                       % shift register matrix (NaN means the cell is empty)
    InIdx = 1;                                                                      % index over input array
    OutIdx = 1;                                                                     % index over output array
    RwIdx = 0;                                                                      % row index ("0" represents the line with no delay)
    while InIdx <= Len                                                              % loop until all input elements are consumed...
        if RwIdx == 0
            OutData(OutIdx) = InData(InIdx);                                        % output from no-delay line
            OutIdx = OutIdx+1;
        else 
            if ~(isnan(ShReg(RwIdx,M*RwIdx)))
                OutData(OutIdx) = ShReg(RwIdx,M*RwIdx);                             % output from shift-registers
                OutIdx = OutIdx+1;
            end
            for j = M*(RwIdx):-1:2
                ShReg(RwIdx,j) = ShReg(RwIdx,j-1);                                  % update shift-registers (by right-shifting)
            end
            ShReg(RwIdx,1) = InData(InIdx);
        end
        InIdx = InIdx+1;
        
        if RwIdx == I-1
            RwIdx = 0;
        else
            RwIdx = RwIdx+1;
        end
    end
    if RwIdx == 0
        RwIdx = 1;
    end
    while OutIdx <= Len                                                             % loop until all elements still stored in the shift-register has been completely consumed...
        if ~(isnan(ShReg(RwIdx,M*RwIdx)))
            OutData(OutIdx) = ShReg(RwIdx,M*RwIdx);
            OutIdx = OutIdx+1;
        end
        for j = M*(RwIdx):-1:2
            ShReg(RwIdx,j) = ShReg(RwIdx,j-1);
        end
        ShReg(RwIdx,1) = NaN;
        if RwIdx == I-1
            RwIdx = 1;
        else
            RwIdx = RwIdx+1;
        end
    end
end


% >> Function for implementing a convolutional deinterleaver. It requires as input the data
%    vector and the number of delay lines (I) and the number of delay cells per block (M). 
function [ OutData ] = CnvDeintrlv( InData, I, M )
    Len = length(InData);                                                           % overall I/O buffers length
    OutData = zeros(1,Len);
    ShReg = NaN(I-1,M*(I-1));                                                       % shift register matrix (NaN means the cell is empty)
    InIdx = 1;                                                                      % index over input array
    OutIdx = 1;                                                                     % index over output array
    RwIdx = 1;                                                                      % row index
    ClIdx = 0;                                                                      % column index (-1)
    while OutIdx <= Len 
        if RwIdx == I && RwIdx+I*(ClIdx-M*(RwIdx-1)) <= Len
            OutData(OutIdx) = InData(InIdx);                                        % output from no-delay line
            OutIdx = OutIdx+1;
            InIdx = InIdx+1;
        else
            if ~(isnan(ShReg(RwIdx,M*(I-RwIdx))))
                OutData(OutIdx) = ShReg(RwIdx,M*(I-RwIdx));                         % output from shift registers
                OutIdx = OutIdx+1;
            end
            for j = M*(I-RwIdx):-1:2
                ShReg(RwIdx,j) = ShReg(RwIdx,j-1);                                  % update shift-registers (by right-shifting)
            end
            if RwIdx+I*(ClIdx-M*(RwIdx-1)) <= Len
                ShReg(RwIdx,1) = InData(InIdx);
                InIdx = InIdx+1;
            else
                ShReg(RwIdx,1) = NaN;
            end
        end
        if ClIdx < M*(I-1)                                                          % case for 1st phase (initial transient)
            if RwIdx == floor(ClIdx/M)+1                                            % "floor" is for executing the operation of integer-division
                RwIdx = 1;
                ClIdx = ClIdx+1;
            else
                RwIdx = RwIdx+1;
            end
        else                                                                        % case for 2nd phase (shift-registers filled)
            if RwIdx == I
                RwIdx = 1;
                ClIdx = ClIdx+1;
            else
                RwIdx = RwIdx+1;
            end
        end
    end
end
