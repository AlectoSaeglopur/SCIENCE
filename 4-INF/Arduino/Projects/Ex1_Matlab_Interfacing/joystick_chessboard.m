
close all; clearvars; clc


%% GRAPHICS OF THE CHESSBOARD

cpx = 12;                   % Number of cells on X-axis
cpy = 9;                    % number of cells on Y-axis
clen = 3;                   % Side length of a single slot (should be an odd value)

lpx = cpx+1;                % Number of lines perpendicular to X-axis
lpy = cpy+1;                % Number of lines perpendicular to X-axis
perc_x = clen*cpx/10;       % Percentage of extra plot on X-axis
perc_y = clen*cpy/10;       % Percentage of extra plot on Y-axis

figure; box on; hold on
axis([-perc_x clen*cpx+perc_x -perc_y clen*cpy+perc_y])
for j = 1:lpx
    line([(j-1)*clen (j-1)*clen],[0 clen*cpy],'Color','k','LineWidth',2)
    
end
for j = 1:lpy
    line([0 clen*cpx],[(j-1)*clen (j-1)*clen],'Color','k','LineWidth',2)
end

Pos = [clen/2 clen/2];
h = plot(Pos(1),Pos(2),'ro','MarkerSize',10,'MarkerFaceColor','r');



%% INITIALIZATION OF SERIAL COMMUNICATION WITH ARDUINO BOARD

serial_speed = 9600;        % [b/s] Serial communication speed

rest_pos = 510;             % Starting position for manual mode
shift_thr = 300;
vel_auto = [1 1];           % Starting X-Y velocity for automtic mode
timeout = 10;               % [s] Timeout for exiting from automatic mode
state = 'MANUAL';           % Starting mode

% fclose(instrfind);        % to close previous serial communication (NB: comment if first run or no crtl+c exit before!)
ard_com = serial('COM3','BaudRate',serial_speed);
fopen(ard_com);



%% LOOP EXECUTION

tic
while strcmp(state,'MANUAL') || toc < timeout
    
    button = fscanf(ard_com,'%d');
    if button == 0 && strcmp(state,'MANUAL')
        state = 'AUTOMATIC';
        tic
    end 
    
    if strcmp(state,'MANUAL')
    
        shift(2) = 1024-fscanf(ard_com,'%d');    % latest y-shift (value from 0 to 1024)
        shift(1) = 1024-fscanf(ard_com,'%d');    % latest x-shift (value from 0 to 1024)

        for j = 1:2
            if shift(j) > rest_pos+shift_thr
                shift(j) = 1;
            elseif shift(j) < rest_pos-shift_thr
                shift(j) = -1;
            else
                shift(j) = 0;
            end
        end

        NewPos(1) = Pos(1)+clen*shift(1);
        NewPos(2) = Pos(2)+clen*shift(2);

        if NewPos(1)>0 && NewPos(1)<clen*cpx && NewPos(2)>0 && NewPos(2)<clen*cpy
            Pos = NewPos;
            delete(h);
            h = plot(Pos(1),Pos(2),'ro','MarkerSize',10,'MarkerFaceColor','r');
        end
    
    elseif strcmp(state,'AUTOMATIC')
        
        Pos(1) = Pos(1)+clen*vel_auto(1);
        Pos(2) = Pos(2)+clen*vel_auto(2);
        
        if Pos(1)<0 || Pos(1)>clen*cpx
            vel_auto(1) = -vel_auto(1);
            Pos(1) = Pos(1)+2*clen*vel_auto(1);
        end
        if Pos(2)<0 || Pos(2)>clen*cpy
            vel_auto(2) = -vel_auto(2);
            Pos(2) = Pos(2)+2*clen*vel_auto(2);
        end
        
        delete(h);
        h = plot(Pos(1),Pos(2),'ro','MarkerSize',10,'MarkerFaceColor','r');
        fprintf("Time [s] = %1.2f\n",toc);
        
    end
    
    pause(.1)        % delay execution
    
end

fclose(ard_com);
