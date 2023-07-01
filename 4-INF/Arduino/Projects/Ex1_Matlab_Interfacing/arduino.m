
clearvars; clc

board = arduino('com3','uno');
% % method(board);
% 
% writeDigitalPin(board,'D12',LOW);
% writeDigitalPin(board,'D7',HIGH);
% pause(10);
% writeDigitalPin(board,'D7',LOW);

s = serial('COM3');
fopen(s);
fread(s)