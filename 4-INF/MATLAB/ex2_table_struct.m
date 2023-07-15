
close all; clearvars; clc


%% TABLES

T1 = readtable('ex2_intab.txt');                                                    % create table T1 from input text file
fprintf("T1 =\n\n")
disp(T1);                                                                           % print table

Name = {'Jack';'Mary';'Billy'};                                                     % create names for corresponding field of table T2 [NB: important to define them as a column cell-array to match expected dimensions nd avoid errors]
Age = [12;38;25];
Sex = {'M';'F';'M'};
Height = [1.55; 1.69; 1.87];
T2 = table(Name,Age,Sex,Height);                                                    % create table with all specified fields
fprintf("\nT2 =\n\n")
disp(T2);



%% STRUCT

Field3a = 'Name';                                                                   % define single structure field name
Field3b = 'Age';
Field3c = 'Sex';
Field3d = 'Height';
S3 = struct(Field3a,Name,Field3b,num2cell(Age),Field3c,Sex, ...
    Field3d,num2cell(Height));                                                      % create structure combining all fields and values
fprintf("\nS3 =\n\n")
disp(S3);                                                                           % print table fields
fprintf("\nS3[2] =\n\n")
disp(S3(2));                                                                        % print table entry in 2nd position


S4.Title = 'SIN';                                                                   % create structure for signal representation (with fields added progressively)
S4.Fs = 8e3;
S4.Fc = 50;
S4.Ncyc = 10;
S4.x = 1/S4.Fs*(0:S4.Fs/S4.Fc*S4.Ncyc-1);
S4.y = sin(2*pi*S4.Fc*S4.x);
figure
plot(S4.x,S4.y)
title(S4.Title);
grid on
