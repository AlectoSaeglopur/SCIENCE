
close all; clearvars; clc


import class_wave.*                                                                 % Import class from dedicated file

Sgn1 = class_wave(8e3);                                                             % Create new instance of class_wave
disp(Sgn1)                                                                          % Print instance content
Sgn1 = Sgn1.set_Fc(200);                                                            % Set new value of Fc attribute through public method [NB: equivalent to "Sgn1 = set_Fc(Sgn1,50)"]
Sgn1.Ncyc = 7;                                                                      % Set new value of Ncyc attribute directly (NB: allowed only if the attribute is public)
Sgn1 = calc_AxisX(Sgn1);                                                            % Calculate X-axis
Sgn1 = set_Type(Sgn1,'Sin');                                                        % Set new value of Type attribute through public method [NB: equivalent to "Sgn1 = Sgn1.set_Type('Sin')"] 
Sgn1 = calc_AxisY(Sgn1);                                                            % Calculate y-axis
disp(Sgn1) 

figure
plot(get_AxisX(Sgn1,1e3),get_AxisY(Sgn1))                                           % Plot waveform based on class instance data (with x-axis in ms, since scaled by 1000)
grid on



