
close all; clearvars; clc


%% PARAMETERS

Ext = 'mp3';                                                                        % extension of files to be renamed
Mod = 'ADD_I';                                                                      % initial/final add/remove/keep mode (see the x6 available modes below)
Str = ' [Alessandro Barbero]';                                                      % string to be added in ADD mode
Nchar = 1;                                                                          % number of characters to be canceled in REM or KEP mode



%% EXECUTION

files = dir(strcat('*.',Ext));
Nfiles = length(files);
for j = 1:Nfiles
    [~,oldname,extension] = fileparts(files(j).name);
    if strcmp(Mod,'ADD_I')                                                          % add "Str" string at beginning of title
        newname = strcat(Str,oldname,extension);
    elseif strcmp(Mod,'ADD_F')                                                      % add "Str" string at end of title
        newname = strcat(oldname,Str,extension);
    elseif strcmp(Mod,'REM_I')                                                      % remove "Nchar" characters at beginning of title
        newname = strcat(oldname(Nchar+1:end),extension);
    elseif strcmp(Mod,'REM_F')                                                      % remove "Nchar" characters at end of title
        newname = strcat(oldname(1:end-Nchar),extension);
    elseif strcmp(Mod,'KEP_I')                                                      % keep "Nchar" characters at beginning of title (and remove all the rest)
        newname = strcat(oldname(1:Nchar),extension);
    elseif strcmp(Mod,'KEP_F')                                                      % keep "Nchar" characters at end of title (and remove all the rest)
        newname = strcat(oldname(end-Nchar+1:end),extension);
    end
    movefile(files(j).name,newname,'f');
end



%% NOTES

% 1. The script shall be placed and run in the same folder of the files to be renamed.