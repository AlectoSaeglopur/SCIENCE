
% Function to read the content of binary files (uint8).
% NB: to launch the script type "run read_bin.m" in Octave's command window!

close all
clear all
clc

%fid = fopen("/home/vkn/Documents/GNUR/Flowgraphs/Logs/preamble_adder.bin",'r');
fid = fopen("/home/vkn/Documents/GNUR/Flowgraphs/Logs/byte_endianess_flip.bin",'r');
byte_vect = fread(fid,'uint8');
fclose(fid);
len_vect = length(byte_vect);
fprintf(" LEN = %d B\n",len_vect);
fprintf(" 0x%X ",byte_vect);
fprintf("\n");
