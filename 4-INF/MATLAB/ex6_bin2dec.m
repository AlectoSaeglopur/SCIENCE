
close all; clearvars; clc

a = [1 0 0 1 1 1 0]
b = Bin2Dec(a)
c = Dec2Bin(b,8)



% Function to convert bit-matrix into integers (assuming first bit of each row as MSb).
function [ OutVect ] = Bin2Dec( InMtx )
    Sz = size(InMtx);
    OutVect = zeros(Sz(1),1);
    for i = 1:Sz(1)
      for j = 1:Sz(2)
        OutVect(i) = OutVect(i)+InMtx(i,j)*2^(Sz(2)-j);
      end
    end
end

% Function to convert integers into bit-matrix (assuming first bit of each row as MSb).
function [ OutMtx ] = Dec2Bin(InVect,Ndig)
    LenIn = length(InVect);
    OutMtx = zeros(LenIn,Ndig);
    for i = 1:LenIn
      Val = InVect(i);
      for j = 1:Ndig
        OutMtx(i,Ndig-j+1) = mod(Val,2);
        Val = floor(Val/2);
      end
    end
end
