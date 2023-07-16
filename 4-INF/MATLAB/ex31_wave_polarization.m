
% Script to graph different kinds of E/M wave polarization, just considering
% the propagation of a carrier (i.e. an unmodulated sinusoide) [NB: n = E x H]

close all; clearvars; clc


%% PARAMETERS

Nsteps = 100;                                                                       % Number of points for estimating wave propagation along z [ALL]
Ts = 50;                                                                            % Time step along z [ALL]

A = 1;                                                                              % Amplitude of electric and magnetic field [HVC]
Q = .5;                                                                             % Angular velocity [CE]
Amaj = 1.5;
Amin = .5;
elev = 124;                                                                         % Elevation angle for 3D graph view
azim = 4;                                                                           % Azimuth angle for 3D graph view

z = Ts*(1:Nsteps);                                                                  % Time along propagation direction
psf =.7;                                                                            % Plane scale factor
light_green = [.8 1 .8];
[Px,Py] = meshgrid(-A*psf:.1:A*psf,-A*psf:.1:A*psf);
Pz = Px-Py+1.05*z(end);

r = linspace(0,A/5) ;
th = linspace(0,2*pi) ;
[R,TH] = meshgrid(r,th) ;
X = 10\R.*cos(TH) ;
Y = 10\R.*sin(TH) ;
Z = fliplr(1000*R)+1.1*z(end);



%% LINEAR HORIZONTAL POLARIZATION [H]

y = A*cos(z);     % Magnetic field
x = A*cos(z);     % Electric field

figure; hold on
title('Linear horizontal polarization'); view(elev,azim)
xlabel('X axis'); ylabel('Y axis'); zlabel('Z axis')
time = line([0 0],[0 0],[0 z(Nsteps)+Ts*Nsteps/10],'Color','k','LineStyle','-','LineWidth',1.2);
plane = surf(Px,Py,Pz,'LineStyle','none','FaceColor',light_green);
plane.FaceAlpha = .9981;  % to set plane transparency
surf(X,Y,Z);    % Cone plot
for i=1:Nsteps
    line1 = line([0 x(i)],[0 0],[z(i) z(i)],'Color','r','LineWidth',1,'LineStyle','-');
    line2 = line([0 0],[0 y(i)],[z(i) z(i)],'Color','b','LineWidth',1,'LineStyle','-');
    plot3(x(i),0,z(i),'r.'); plot3(0,y(i),z(i),'b.')
end
legend([time,plane,line1,line2],{'Time','Wavefront plane','Electric field','Magnetic field'},'Location','NE')



%% LINEAR VERTICAL POLARIZATION [V]

y = A*cos(z);     % Electric field
x = A*cos(z);     % Magnetic field

figure; hold on
title('Linear vertical polarization'); view(elev,azim)
xlabel('Y axis'); ylabel('X axis'); zlabel('Z axis')
time = line([0 0],[0 0],[0 z(Nsteps)+Ts*Nsteps/10],'Color','k','LineStyle','-','LineWidth',1.2);
plane = surf(Px,Py,Pz,'LineStyle','none','FaceColor',light_green);
plane.FaceAlpha = .9981;  % to set plane transparency
surf(X,Y,Z);    % Cone plot
for i=1:Nsteps
    line1 = line([0 x(i)],[0 0],[z(i) z(i)],'Color','r','LineWidth',1,'LineStyle','-');
    line2 = line([0 0],[0 y(i)],[z(i) z(i)],'Color','b','LineWidth',1,'LineStyle','-');
    plot3(x(i),0,z(i),'r.'); plot3(0,y(i),z(i),'b.')
end
legend([time,plane,line1,line2],{'Time','Wavefront plane','Electric field','Magnetic field'},'Location','NE')



%% CIRCULAR POLARIZATION [C]

E(1,:) = A*cos(Q*z);
E(2,:) = A*sin(Q*z);
H(1,:) = A*cos(Q*z+pi/2);
H(2,:) = A*sin(Q*z+pi/2);

figure; hold on
title('Circular polarization'); view(elev,azim)
xlabel('X axis'); ylabel('Y axis'); zlabel('Z axis')
time = line([0 0],[0 0],[0 z(Nsteps)+Ts*Nsteps/10],'Color','k','LineStyle','-','LineWidth',1.2);
plane = surf(Px,Py,Pz,'LineStyle','none','FaceColor',light_green);
plane.FaceAlpha = .9981;  % to set plane transparency
surf(X,Y,Z);    % Cone plot
for i=1:Nsteps
    line1 = line([0 E(1,i)],[0 E(2,i)],[z(i) z(i)],'Color','r');
    line2 = line([0 H(1,i)],[0 H(2,i)],[z(i) z(i)],'Color','b');
    plot3(E(1,i),E(2,i),z(i),'r.'); plot3(H(1,i),H(2,i),z(i),'b.')
end
legend([time,plane,line1,line2],{'Time','Wavefront plane','Electric field','Magnetic field'},'Location','NE')


%% ELLIPTICAL POLARIZATION [E]

E(1,:) = Amaj*cos(Q*z);
E(2,:) = Amin*sin(Q*z);
H(1,:) = Amaj*cos(Q*z+pi/2);
H(2,:) = Amin*sin(Q*z+pi/2);

figure; hold on
title('Elliptical polarization'); view(elev,azim)
xlabel('X axis'); ylabel('Y axis'); zlabel('Z axis')
time = line([0 0],[0 0],[0 z(Nsteps)+Ts*Nsteps/10],'Color','k','LineStyle','-','LineWidth',1.2);
surf(X,Y,Z);    % Cone plot
for i=1:Nsteps
    line([0 E(1,i)],[0 E(2,i)],[z(i) z(i)],'Color','g'); line([0 H(1,i)],[0 H(2,i)],[z(i) z(i)],'Color','b')
    plot3(E(1,i),E(2,i),z(i),'g.'); plot3(H(1,i),H(2,i),z(i),'b.')
end
axis([-1.1*Amaj 1.1*Amaj -Amaj Amaj])
