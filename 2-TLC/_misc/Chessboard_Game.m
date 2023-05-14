
close all; clearvars; clc

sps = 8;                    % number of slots per side
slen = 3;                   % width of a single slot (should be an odd value)

lpa = sps+1;                % number of lines per axis
perc = slen*sps/10;

figure; box on; hold on
axis([-perc slen*sps+perc -perc slen*sps+perc])
for j = 1:lpa
    line([(j-1)*slen (j-1)*slen],[0 slen*sps],'Color','k','LineWidth',2)
    line([0 slen*sps],[(j-1)*slen (j-1)*slen],'Color','k','LineWidth',2)
end

Pos = [slen/2 slen/2];
h = plot(Pos(1),Pos(2),'ro','MarkerSize',10,'MarkerFaceColor','r');

while 1
    
    shift = input('Next move ? : [U/D/L/R/UL/UR/DL/DR] :','s');
    switch shift
        case 'U'
            NewPos(1) = Pos(1);
            NewPos(2) = Pos(2)+slen;
        case 'D'
            NewPos(1) = Pos(1);
            NewPos(2) = Pos(2)-slen;
        case 'L'
            NewPos(1) = Pos(1)-slen;
            NewPos(2) = Pos(2);
        case 'R'
            NewPos(1) = Pos(1)+slen;
            NewPos(2) = Pos(2);
        case 'UL'
            NewPos(1) = Pos(1)-slen;
            NewPos(2) = Pos(2)+slen;
        case 'UR'
            NewPos(1) = Pos(1)+slen;
            NewPos(2) = Pos(2)+slen;
        case 'DL'
            NewPos(1) = Pos(1)-slen;
            NewPos(2) = Pos(2)-slen;
        case 'DR'
            NewPos(1) = Pos(1)+slen;
            NewPos(2) = Pos(2)-slen;
        otherwise
            shift = 'NONE';
    end
    
    if ~strcmp(shift,'NONE') && NewPos(1)>0 && NewPos(1)<slen*sps && NewPos(2)>0 && NewPos(2)<slen*sps
        Pos = NewPos;
        delete(h);
        h = plot(Pos(1),Pos(2),'ro','MarkerSize',10,'MarkerFaceColor','r');
    end
    
    pause(.5)        % stop execution for half a second
    
end