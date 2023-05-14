
%%% Function to convert matrix bit-streams into corresponding integer values
%%% (assuming first-left bit as the most significative).
function [ OutVect ] = bin2dec( InMtx )
    Sz = size(InMtx);
    OutVect = zeros(Sz(1),1);
    for i = 1:Sz(1)
      for j = 1:Sz(2)
        OutVect(i) = OutVect(i)+InMtx(i,j)*2^(Sz(2)-j);
      end
    end
end

%%% Function to convert integer values into corresponding matrix bit-streams
%%% (assuming first-left bit as the most significative).
function [ OutMtx ] = dec2bin(InVect,Ndig)
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
