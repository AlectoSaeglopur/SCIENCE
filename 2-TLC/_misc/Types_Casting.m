
close all; clearvars; clc


%% DEC-TO-BIN CONVERSION (BYTES->BITS)

InDec = [2 254 170];
OutBin = Dec2Bin(InDec)


%% BIN-TO-DEC CONVERSION (BITS->BYTES)

% % InBin = [1 0 1 0 1 0 1 0 1 1 1 1 1 1 1 0 0 0 0 1 0 1 0 0];
% % OutDec = Bin2Dec(InBin)


%% DEC-TO-HEX BYTE CONVERSION (BYTES->BYTES)

% % InDec = [170 254 20];
% % OutHex1 = Dec2Hex_v1(InDec)                 % output bytes as a single string
% % OutHex2 = Dec2Hex_v2(InDec)                 % output bytes as multiple strings


%% HEX-TO-DEC BYTE CONVERSION (BYTES->BYTES)

% % InHex1 = ['AA';'FE';'14'];
% % OutDec1 = hex2dec(InHex1)                   % if input bytes are already columnwise
% % 
% % InHex2 = 'AAFE14';
% % OutDec2 = Hex2Dec(InHex2)                   % if input bytes are all in a single row


%% BIN-TO-HEX CONVERSION (BITS->BYTES)

% % InBin = [1 0 0 1 1 1 1 0 0 0 0 0 0 1 0 0];
% % OutHex = Bin2Hex(InBin)


%% HEX-TO-BIN CONVERSION (BYTES->BITS)

% % InHex = ['AA';'FE';'14'];
% % OutBin = Hex2Bin(InHex)



%% CONVERSION FUNCTIONS

function [ OutBits ] = Dec2Bin( InDecBytes )
    OutBits = reshape(de2bi(InDecBytes,8,'left-msb').',[1 8*length(InDecBytes)]);     % NB: 8 means bpb
end


function [ OutDecBytes ] = Bin2Dec( InBits )
    OutDecBytes = bi2de(reshape(InBits,8,length(InBits)/8).','left-msb');          % NB: 8 means bpb
end


function [ OutHexBytes ] =  Dec2Hex_v1( InDecBytes )
    OutHexBytes = reshape(dec2hex(InDecBytes,2).',[1,2*length(InDecBytes)]);

end


function [ OutHexBytes ] =  Dec2Hex_v2( InDecBytes )
    ByteLen = length(InDecBytes);
    HexChar = reshape(dec2hex(InDecBytes,2).',[1,2*ByteLen]);                      % NB: 2 is the number of chars for byte
    OutHexBytes = strings(1,ByteLen);
    for j = 1:ByteLen
        OutHexBytes(j) = strcat(HexChar(2*j-1),HexChar(2*j));
    end
end


function [ OutDecBytes ] =  Hex2Dec( InHexBytes )
    OutDecBytes = hex2dec(reshape(InHexBytes,[2 length(InHexBytes)/2]).');                 % NB: 2 is the number of chars for byte
end


function [ OutHexBytes ] = Bin2Hex( InBits )
    DecBytes = Bin2Dec(InBits);
    OutHexBytes = Dec2Hex_v2(DecBytes);
end


function [ OutBits ] = Hex2Bin( OutHexBytes )
    DecBytes = hex2dec(OutHexBytes);
    OutBits = reshape(de2bi(DecBytes,8,'left-msb').',[1 8*length(DecBytes)]);
end



