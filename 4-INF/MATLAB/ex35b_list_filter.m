
%%% Title: FILE-LIST FILTER
%%% Author: Filippo Valmori
%%% Date: 06/09/2023
%%% Description: Script for filtering a .txt file-list looking for a specified string pattern.

close all; clearvars; clc


%% PARAMETERS

Pattern = 'è';                                                            % String-pattern to be found
Nskip = 2;                                                                      % Number of header lines to skip


%% PROCESSING

fid = fopen('.\list.txt','r','n','UTF-8');
Data = textscan(fid,'%s','Delimiter','\n','headerLines',Nskip);
fclose(fid);
Nsong = length(Data{1});
for j = 1:Nsong
  if contains(Data{1}(j),Pattern)
    fprintf('%s\n',string(Data{1}(j)));
  end
end
