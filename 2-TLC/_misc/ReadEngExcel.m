
close all; clearvars; clc

Nw = 10;                            % Number of words / expression to be asked
Type = 'VER';                       % ADJ, ADV, NOU, VER, EXP or SEN
Mode = 'ITA';                       % ENG, PRN, ITA, EXE

if strcmp(Type,'ADJ')
    ShId = 1;
    Table = readtable('ENGLISH.xlsx','ReadVariableNames',false,'Sheet',ShId);
    Table.Properties.VariableNames = {'ENG' 'PRN' 'ITA' 'EXE'};   
elseif strcmp(Type,'ADV')
    ShId = 2;
    Table = readtable('ENGLISH.xlsx','ReadVariableNames',false,'Sheet',ShId);
    Table.Properties.VariableNames = {'ENG' 'PRN' 'ITA' 'EXE'};  
elseif strcmp(Type,'CP')
    ShId = 3;
    Table = readtable('ENGLISH.xlsx','ReadVariableNames',false,'Sheet',ShId);
    Table.Properties.VariableNames = {'ENG' 'PRN' 'ITA' 'EXE'};
elseif strcmp(Type,'NOU')
    ShId = 4;
    Table = readtable('ENGLISH.xlsx','ReadVariableNames',false,'Sheet',ShId);
    Table.Properties.VariableNames = {'ENG' 'PRN' 'ITA' 'EXE'};    
elseif strcmp(Type,'VER')
    ShId = 5;
    Table = readtable('ENGLISH.xlsx','ReadVariableNames',false,'Sheet',ShId);
    Table.Properties.VariableNames = {'ENG' 'PRN' 'ITA' 'EXE' 'TIR'};
elseif strcmp(Type,'EXP')
    ShId = 6;
    Table = readtable('ENGLISH.xlsx','ReadVariableNames',false,'Sheet',ShId);
    Table.Properties.VariableNames = {'ENG' 'PRN' 'ITA' 'EXE'};
elseif strcmp(Type,'SEN')
    ShId = 7;
    Table = readtable('ENGLISH.xlsx','ReadVariableNames',false,'Sheet',ShId);
    Table.Properties.VariableNames = {'ENG' 'ITA'};
else
    error('INVALID TYPE');
end

Ntot = size(Table,1);                   % Overall number of lines in current sheet
if strcmp(Mode,'ENG')
    Col = 1;
    for j = 1:Nw
        SubTable = Table(randi([1,Ntot],1,1),Col);
        fprintf('[%d] %s\n\n',j,SubTable.ENG{1})
    end
elseif strcmp(Mode,'ITA')
        Col = 3;
    for j = 1:Nw
        SubTable = Table(randi([1,Ntot],1,1),Col);
        fprintf('[%d] %s\n\n',j,SubTable.ITA{1})
    end
end
        
    
    
    