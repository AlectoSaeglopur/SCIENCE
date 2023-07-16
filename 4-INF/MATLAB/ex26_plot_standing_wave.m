
close all; clearvars; clc

%% PARAMETERS

Fc = 10e3;                                                                          % Carrier frequency [Hz]
osf = 50;                                                                           % Oversampling factor
A = 1;                                                                              % Amplitude [V]
Np = 4;                                                                             % Number of waveform periods to be depicted in each figure
Tsc = 1e3;                                                                          % Time scaling factor
SimMode = 'GIF';                                                                    % Simulation mode (choose GIF or PLOT)


%% TIME SIMULATION

Fs = osf*Fc;                                                                        % Sample rate [Sa/s]
Ttot = Np/Fc;                                                                       % Simulation time interval [s]
Time = 0:1/Fs:Ttot-1/Fs;                                                            % Time axis

SgnFwd = A*sin(2*pi*Fc*Time);                                                       % Forward wave
SgnRef = -SgnFwd;                                                                   % Reflected wave

switch SimMode
    case 'GIF'
        FileName = 'ex26_standing_wave.gif';
        GifDelay = 0.15;                                                            % Delay among consecutive frames for the .gif image
    case 'PLOT'
        Tpause = 1/osf;                                                             % Pause time [s]
        figure; box on                                                              % Initialize image
    otherwise
        error('Invalid SimMode')
end

for i = 1:osf

    if strcmp(SimMode,'PLOT')
        
        plot(Time*Tsc,SgnFwd,'b.-',Time*Tsc,SgnRef,'g.-',Time*Tsc,SgnFwd+SgnRef,'r.-')
        xlabel('Time [ms]'); ylabel('Amplitude [V]')
        legend(' Forward wave',' Reflected wave',' Standing wave')
        axis([Ttot*Tsc*[-1/10 11/10] 2.1*A*[-1 1]]); grid on;
        drawnow
        pause(Tpause)
          
    else
        
        Fig = figure;
        hold on; box on
        plot(Time*Tsc,SgnFwd,'b.-')
        plot(Time*Tsc,SgnRef,'g.-')
        plot(Time*Tsc,SgnFwd+SgnRef,'r.-')
        xlabel('Time [ms]'); ylabel('Amplitude [V]')
        legend(' Forward wave',' Reflected wave',' Standing wave')
        axis([Ttot*Tsc*[-1/10 11/10] 2.1*A*[-1 1]])
        grid on; hold off;
        RgbFrame = getframe(Fig);
        RgbImage = frame2im(RgbFrame);
        [IndImage,ColMap] = rgb2ind(RgbImage,256);
        if i == 1
            imwrite(IndImage,ColMap,FileName,'gif', 'Loopcount',inf);
        else
            imwrite(IndImage,ColMap,FileName,'gif','WriteMode','append','DelayTime',GifDelay);
        end
        close(Fig);
            
    end
    
    SgnFwd = [SgnFwd(end) SgnFwd(1:end-1)];                                         % Update forward wave
    SgnRef = [SgnRef(2:end) SgnRef(1)];                                             % Update reflected wave

end
