
%%% Title: ADDITIVE / MULTIPLICATIVE SCRAMBLING AND PSEUDO-RANDOM GENERATOR
%%% Author: Filippo Valmori
%%% Date: 13/10/2018
%%% Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Scrambler

close all; clearvars; clc


%% SIMULATION #1 - ADDITIVE SCRAMBLER

% InfoLen = 600;                                                      % Number of source info bits
% Nc = 15;                                                            % Number of scrambler/descramler LFSR cells
% ConVect = [0 0 0 0 0 0 0 0 0 0 0 0 0 1 1];                          % Scrambler/descramler connection vector, i.e. (1+)z^-14+z^-15 - DVB standard
% InitStateTx = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0];                      % Scrambler LFSR initial state
% InitStateRx = [1 0 0 1 0 1 0 1 0 0 0 0 0 0 0];                      % Descrambler LFSR initial state
% Peb = 0e-2;                                                         % Error probabilty over Binary Symmetric Channel (BSC)
% 
% InfoStream = randi([0 1],1,InfoLen);                                % Random generation of source info bits
% CheckParam(Nc,ConVect,InitStateTx,InitStateRx);                     % Check the parameters correctness
% ScrStream = AddScramb(InfoStream,ConVect,InitStateTx);              % Additive scrambled stream
% ChanStream = bsc(ScrStream,Peb);                                    % BSC simulation
% DesStream = AddScramb(ChanStream,ConVect,InitStateRx);              % Additive descrambled stream
% 
% fprintf(" PARAMETERS:\n");
% fprintf(" - Scrambling type : Additive\n")
% fprintf(" - Info stream length = %d bits\n",InfoLen);
% fprintf(" - Number of LFSR cells = %d\n",Nc);
% fprintf(" - Tx/Rx LFSR initial state mismatch = %d bits\n", ...
%     sum(InitStateTx~=InitStateRx));
% fprintf(" - Probability of error over BSC = %1.3f\n",Peb);
% fprintf("\n RESULTS:\n");
% fprintf(" - Errors before descrambler = %d out of %d bits\n", ...
%     sum(ScrStream~=ChanStream),InfoLen);
% fprintf(" - Errors after descrambler = %d out of %d bits\n\n", ...
%     sum(InfoStream~=DesStream),InfoLen);



%% SIMULATION #2 - MULTIPLICATIVE SCRAMBLER

% InfoLen = 600;                                                      % Number of source info bits
% Nc = 17;                                                            % Number of scrambler/descramler LFSR cells
% ConVect =  [0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1];                     % Scrambler/descramler connection vector, i.e. (1+)z^-12+z^-17 - AX.25 standard
% InitStateTx = [0 0 1 0 1 1 0 0 0 0 1 1 0 1 0 1 0];                  % Scrambler LFSR initial state
% InitStateRx = [1 1 1 0 1 1 0 1 1 0 0 1 1 1 1 1 1];                  % Descrambler LFSR initial state
% Peb = 0e-2;                                                         % Error probabilty over Binary Symmetric Channel (BSC)
% 
% InfoStream = randi([0 1],1,InfoLen);                                % Random generation of source info bits
% CheckParam(Nc,ConVect,InitStateTx,InitStateRx);                     % Check the parameters correctness
% ScrStream = MultScramb(InfoStream,ConVect,InitStateTx);             % Multiplicative scrambled stream
% ChanStream = bsc(ScrStream,Peb);                                    % BSC simulation
% DesStream = MultDescramb(ChanStream,ConVect,InitStateRx);           % Multiplicative descrambled stream
% 
% fprintf("     -------------------------------------\n\n");
% fprintf(" PARAMETERS:\n");
% fprintf(" - Scrambling type : Multiplicative\n")
% fprintf(" - Info stream length = %d bits\n",InfoLen);
% fprintf(" - Number of LFSR cells = %d\n",Nc);
% fprintf(" - Tx/Rx LFSR initial state mismatch = %d bits\n", ...
%     sum(InitStateTx~=InitStateRx));
% fprintf(" - Probability of error over BSC = %1.3f\n",Peb);
% fprintf("\n RESULTS:\n");
% fprintf(" - Errors before descrambler = %d out of %d bits\n", ...
%     sum(ScrStream~=ChanStream),InfoLen);
% fprintf(" - Errors after descrambler = \n\t");
% fprintf(" %d out of %d bits (before sync)\n\t", ...
%     sum(InfoStream(1:Nc)~=DesStream(1:Nc)),Nc);
% fprintf(" %d out of %d bits (after sync)\n", ...
%     sum(InfoStream(Nc+1:end)~=DesStream(Nc+1:end)),InfoLen-Nc);



%% SIMULATION #3 - ADDITIVE SCRAMBLER AS PSEUDO-RANDOM GENERATOR

Nc = 5;
InfoLen = 2*(2^Nc-1)+5;                                             % Choosen long enough to create two periods of the generated PN sequence

if Nc == 3
    ConVect = [0 1 1];
elseif Nc == 4
    ConVect = [0 0 1 1];
elseif Nc == 5
    ConVect = [0 0 1 0 1];
else
    Nc = 6;
    ConVect = [0 0 0 0 1 1];
end

InitSt = [1 randi([0 1],1,Nc-1)];                                   % Since the input sequence is all-zero, it must be assured that at least one bit of the initial state is '1'

InfoStream = zeros(InfoLen,1);
ScrStream = AddScramb(InfoStream,ConVect,InitSt);

fprintf(" * Scrambler degree / number of cells = %d\n",Nc);
fprintf(" * Pseudo-noise sequence period = %d bits\n",2^Nc-1);


figure; box on; hold on
Time = 0:length(ScrStream)-1;
plot(Time,ScrStream,'b.-')
line(2^Nc-1*[1 1],[-.2 1.2],'LineWidth',1,'Color',[1 .2 0],'LineStyle','-.')
line(2*(2^Nc-1)*[1 1],[-.2 1.2],'LineWidth',1,'Color',[1 .2 0],'LineStyle','-.')
ylim([-.5 1.5]); grid on
title(sprintf("PSEUDO-NOISE SEQUENCE | Nc = %d",Nc))
hold off



%% FUNCTIONS

%%% --> Function for checking the parameters correctness
function [ ] = CheckParam( Ncells, ConVect, InitStateTx, InitStateRx )

    if length(ConVect) ~= Ncells
        error('Invalid connection vector');
    elseif length(InitStateTx) ~= Ncells
        error('Invalid Tx initial state');
    elseif length(InitStateRx) ~= Ncells
        error('Invalid Rx initial state');
    end
    
end


%%% Function for implementing an additive scrambler (aka synchronous or
%%% linear-feedback shift register scrambler) and descrambler
function [OutBits] = AddScramb( InBits, ConVect, InitState )

    BitLen = length(InBits);
    RegState = InitState;
    OutBits = zeros(1,BitLen);
    
    for j = 1:BitLen
        
        RegBit = mod(sum(RegState.*ConVect),2);
        OutBits(j) = xor(InBits(j),RegBit);
        RegState(2:end) = RegState(1:end-1);
        RegState(1) = RegBit;
        
    end

end


%%% --> Function for implementing a multiplicative scrambler at bit level
function [ OutBits ] = MultScramb( InBits, ConVect, InitState )

    BitLen = length(InBits);
    RegState = InitState;
    OutBits = zeros(1,BitLen);
    
    for j = 1:BitLen
        
        RegBit = mod(sum(RegState.*ConVect),2);
        OutBits(j) = xor(InBits(j),RegBit);
        RegState(2:end) = RegState(1:end-1);
        RegState(1) = OutBits(j);
        
    end

end


%%% --> Function for implementing a multiplicative descrambler at bit level
function [ OutBits ] = MultDescramb( InBits, ConVect, InitState )

    BitLen = length(InBits);
    RegState = InitState;
    OutBits = zeros(1,BitLen);
    
    for j = 1:BitLen
        
        RegBit = mod(sum(RegState.*ConVect),2);
        OutBits(j) = xor(InBits(j),RegBit);
        RegState(2:end) = RegState(1:end-1);
        RegState(1) = InBits(j);
        
    end

end



%% NOTES

% NB#1: Keep in mind that the last element of ConVect must be alway set to '1', otherwise the scrambler degree would be lower 
% than expected.
% NB#2: In SIMLATION#3 by using an all-one info stream (instead of an all-zero as proposed), the output PN sequence would be
% bit-wise XORed.
% NB#3: In SIMLATION#3 ConVect and InitSt shall be choosen accuretely, otherwise the output PN sequence may have a period
% shorter than expected.
