%Ref. https://www.iz2uuf.net/wp/index.php/2013/04/06/100g-yagi/
clc
clear
close all
fc=144.3e6;
%% Creating Antenna
yagiUda=yagiUda('NumDirectors',2);
yagiUda.DirectorLength=[0.9 0.84];
yagiUda.DirectorSpacing=[0.2 0.33];
yagiUda.ReflectorLength=1.01;
yagiUda.ReflectorSpacing=0.46;
yagiUda.Exciter=dipole;
yagiUda.Exciter.Width=cylinder2strip(0.0023/2);%Al-Device diameter
yagiUda.Exciter.Length=0.995;
yagiUda.Exciter.TiltAxis=[0 1 0];
yagiUda.Exciter.Tilt=90;
yagiUda.TiltAxis=[0 1 0;-1 0 0];
yagiUda.Tilt=[90 90];
% figure('name','Antenna Layout','NumberTitle','off');
% show(yagiUda)
%% Patterns
figure('name','Vertical Plane','NumberTitle','off');
patternElevation(yagiUda,fc,0,'Elevation',0:1:360);
figure('name','Horizontal Plane','NumberTitle','off');
patternAzimuth(yagiUda,fc,0,'Azimuth',0:1:360);
figure('name','3D','NumberTitle','off');
pattern(yagiUda,fc)