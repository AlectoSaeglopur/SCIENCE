
%%% Title: FILE-LIST MAKER
%%% Author: Filippo Valmori
%%% Date: 06/09/2023
%%% Description: Script for listing all files of a desired type within a specified folder into a .txt file.

close all; clearvars; clc


%% PARAMETERS

Path = 'C:\Users\E0624826\Documents\EATON_FV\HSCCB\FW\Algorithms\sc_ol';        % path where to search (use '.' for current folder)
Extens = 'mp3';                                                                 % file extension to be searched (use '*' to for all)
Nf = '%4d';                                                                     % counter format


%% PROCESSING

flist = dir(strcat(Path,'\*.',Extens));
fid = fopen('.\list.txt','w');
fprintf(fid,' >> %s [M] <<\n\n',datetime);
if strcmp(Extens,'*')
  ExtLen = 0;
else
  ExtLen = length(Extens)+1;
end
for j = 1:length(flist)
    fprintf(fid,strcat(Nf,': %s\n'),j,flist(j).name(1:end-ExtLen));
end
fclose(fid);
