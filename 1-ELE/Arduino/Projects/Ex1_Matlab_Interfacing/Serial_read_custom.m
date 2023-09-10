
close all; clearvars; clc
fclose(instrfind);          % to close a still existing previous serial communication (comment if no need!)

Ncycles = 10;
SerialSpeed = 9600;

ard_com = serial('COM3','BaudRate',SerialSpeed);
fopen(ard_com);

x = zeros(Ncycles,1);
y = zeros(Ncycles,1);
for j = 1:Ncycles
    x(j) = fscanf(ard_com,'%d');
    y(j) = fscanf(ard_com,'%d');
end

fclose(ard_com);
figure
plot(1:Ncycles,x,'b.-',1:Ncycles,y,'r.-')
