
close all; clearvars; clc


TD = char(datetime());                                                              % get current time and date
TD = strcat(TD(1:11),"_",TD(13:14),"-", ...
    TD(16:17),"-",TD(19:end));                                                      % convert date/time into Windows-compatible filename format     
diary(strcat("ex1_log_",TD,'.txt'))                                                 % create file for logging session (named based on current date/time)
 
diary on                                                                            % start logging session from here on
x = input('Enter value = ');                                                        % wait for input from keybord
a = uint8([13 59])                                                                  % create array of uint8_t
b = single(1.234)                                                                   % create float variable
c = char(2+48)                                                                      % interger to ASCII-char conversion (e.g. this returns '2')
d = string(b)                                                                       % convert float to string
e = false                                                                           % create boolean variable
whos                                                                                % print info about all variables in workspace
diary off                                                                           % stop logging here

