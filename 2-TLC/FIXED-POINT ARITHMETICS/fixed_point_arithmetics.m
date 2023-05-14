
%%% Title: FLOATING-POINT VS FIXED-POINT ARITHMETICS
%%% Author: Filippo Valmori
%%% Date: 22/02/2023
%%% Reference: [1] Digital signal processing - Fundamentals and applications (Li Tan, 2013)

close all
clearvars
clc


%% PARAMETERS %%

Q = 15;                                                                         % fixed-point Q-format [NB: use 7 for int8, 15 for int16, or 31 for int32]
Ti1 = -0.03785;                                                                 % 1st floating point operand to be simulated [NB: its absolute value shall be < 1]
Ti2 = 0.267;                                                                    % 2nd floating point operand to be simulated [NB: its absolute value shall be < 1] 



%% TEST#1 : OPERAND CONVERSION %%

[Xd1,Xh1] = Conv_Float2Fixed(Ti1,Q);                                            % convert 1st operand from floating to fixed-point format (with both decimal and hex representations)
Te1 = Conv_Fixed2Float(Xd1,Q);                                                  % convert 1st operand back from fixed-point to floating (NB: the lower Q, the larger the truncation error!)

fprintf("\n § TEST #1 : OPERAND CONVERSION\n")
fprintf(" Ti = %1.6f\n",Ti1);
fprintf(" Xd1/Xh = %d/0x%s\n",Xd1,Xh1);
fprintf(" Te = %1.6f\n",Te1);



%% TEST#2 : ADDITION/MULTIPLICATION %%

TiA = Ti1+Ti2;                                                                  % get addition result using floating-point arithmetics
TiM = Ti1*Ti2;                                                                  % get multiplication result using floating-point arithmetics
[Xd2,~] = Conv_Float2Fixed(Ti2,Q);                                              % convert 2nd operand from floating to fixed-point format
TeA = Conv_Fixed2Float(Xd1+Xd2,Q);                                              % get addition result using fixed-point arithmetics
TeM = Conv_Fixed2Float(MultFx(Xd1,Xd2,Q),Q);                                    % get multiplication result using fixed-point arithmetics

fprintf("\n § TEST #2 : ADDITION / MULTIPLICATION\n")
fprintf(" TiA = %1.6f\n",TiA);
fprintf(" TeA = %1.6f\n",TeA);
fprintf(" TiM = %1.6f\n",TiM);
fprintf(" TeM = %1.6f\n\n",TeM);



%% FUNCTIONS %%

% >> Function to convert input number into a (Q+1)-bit signed integer.
function Y = ConvInt( X, Q )
  switch Q
    case 7
      Y = int8(X);
    case 15
      Y = int16(X);
    case 31
      Y = int32(X);
    case 63
      Y = int64(X);
    otherwise
      error("Invalid Q")
  end
end


% >> Function to convert input number into a (Q+1)-bit unsigned integer.
function Y = ConvUint( X, Q )
  switch Q
    case 7
      Y = uint8(X);
    case 15
      Y = uint16(X);
    case 31
      Y = uint32(X);
    otherwise
      error("Invalid Q")
  end
end


% >> Function to convert a number from floating to fixed-point format.
function [ Ydec, Yhex ] = Conv_Float2Fixed( X, Q )
  Ydec = ConvInt(0,Q);
  Z = abs(X);
  if Z > 1
    error("Input out of range!")
  end
  for j = 1:Q
    Z = 2*Z;
    if Z >= 1
      Z = Z-1;
      Ydec = Ydec+2^(Q-j);
    end
  end
  if X < 0
    Yhex = dec2hex(bitcmp(ConvUint(Ydec,Q))+1,(Q+1)/4);
    Ydec = -Ydec;
  else
    Yhex = dec2hex(Ydec,(Q+1)/4);
  end
end


% >> Function to convert a number from fixed to floating-point format.
function Y = Conv_Fixed2Float( X, Q )
  Y = double(X)*2^-Q;
end


% >> Function to execute fixed-point multiplication.
function Y = MultFx( X1, X2, Q )
  Y = ConvInt(X1,2*Q+1)*ConvInt(X2,2*Q+1);                                      % convert operands to higher format before multiplication (e.g. int16 to int32)
  Y = bitshift(Y,1);                                                            % left-shift to get rid of sign-extended bit
  Y = ConvInt(bitshift(Y,-(Q+1)),Q);                                            % right-shift to move back to original format
end



%% NOTES %%

% 1. Known test case :
% +0.560123 -> 0.100011110110010 = 47B2
% -0.160123 -> 1.110101110000010 = EB82
