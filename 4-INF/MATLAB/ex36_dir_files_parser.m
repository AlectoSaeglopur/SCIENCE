
close all
clearvars
clc

%% PROCESSING

Info = struct('Nam',1,'Cnt',2,'Dim',3,'Ntype',4);                               % Mapping between cell fields and indeces

ElemVect = dir('*.*');                                                          % Retrieve all files info within current directory
ElemLen = length(ElemVect);

SortCell = Init_SortCell(Info,ElemLen);                                         % Initialize cell
SortCell = Exe_SortCell(Info,ElemVect,SortCell);                                % Fill-in cell



%% RESULTS

BlueX = [0 .2 1];
RedX = [1 0 .2];

% PIE-CHART
Labels = cell(1,SortCell{Info.Ntype});
for j=1:SortCell{Info.Ntype}
  Labels{j} = strcat(SortCell{Info.Nam}(j),' (',num2str(SortCell{Info.Cnt}(j)),')');
end
figure
subplot(1,2,1)
ExplodeVect = ones(1,SortCell{Info.Ntype});
pie(SortCell{Info.Cnt}(1:SortCell{Info.Ntype}),ExplodeVect,Labels)
title(sprintf('OCCURRENCES\n'),'FontSize',18)

% HISTOGRAM
subplot(1,2,2)
bar(SortCell{Info.Dim}(1:SortCell{Info.Ntype})/1e3,'FaceColor',RedX,'EdgeColor',BlueX);
ax = gca;                                                                       % Get current axes handler
ax.XTickLabel = SortCell{Info.Nam}(1:SortCell{Info.Ntype});                     % Assign custom X-axis tick-labels
ax.XTickLabelRotation = 90;                                                     % Rotate X-axis tick-labels
xlabel('Extension')
ylabel('Dimension [kB]')
title(sprintf('DIMENSIONS'),'FontSize',18)
grid on

% TEXT
fid = fopen('file_list.txt','w');
fprintf(fid,'%s\n',ElemVect.name);                                              % create text file where to list all files name within directory
fclose(fid);



%% FUNCTIONS

function [ SortCell ] = Init_SortCell( Info, ElemLen )
  SortCell = cell(length(Info),1);
  SortCell{Info.Nam} = string(zeros(1,ElemLen));                                % Field containing all extension names found
  SortCell{Info.Cnt} = zeros(1,ElemLen);                                        % Field containing all occurrences of each extension found
  SortCell{Info.Dim} = zeros(1,ElemLen);                                        % Field containing all overall dimensions each extension found
  SortCell{Info.Ntype} = 0;                                                     % Total number of different extensions found
end

function [ SortCell ] = Exe_SortCell( Info, ElemVect, SortCell )
  ElemLen = length(ElemVect);
  for j = 1:ElemLen
    if ElemVect(j).isdir
      % DIRECTORIES
      DirId = 'dir';
      if isempty(cell2mat(strfind(SortCell{Info.Nam},DirId)))
        SortCell{Info.Ntype} = SortCell{Info.Ntype}+1;
        SortCell{Info.Nam}(SortCell{Info.Ntype}) = DirId;
        SortCell{Info.Cnt}(SortCell{Info.Ntype}) = SortCell{Info.Cnt}(SortCell{Info.Ntype})+1;
        SortCell{Info.Dim}(SortCell{Info.Ntype}) = SortCell{Info.Dim}(SortCell{Info.Ntype})+ElemVect(j).bytes;
      else
        Idx = find(~cellfun(@isempty,strfind(SortCell{Info.Nam},DirId)));
        SortCell{Info.Cnt}(Idx) = SortCell{Info.Cnt}(Idx)+1;
        SortCell{Info.Dim}(Idx) = SortCell{Info.Dim}(Idx)+ElemVect(j).bytes;
      end
    else
      % OTHER EXTENSIONS
      ExtPos = strfind(ElemVect(j).name,'.');
      if isempty(ExtPos)
        ExtName = 'unknown';
      else
        ExtName = ElemVect(j).name(ExtPos(end)+1:end);
      end
      if isempty(cell2mat(strfind(SortCell{Info.Nam},ExtName)))
        SortCell{Info.Ntype} = SortCell{Info.Ntype}+1;
        SortCell{Info.Nam}(SortCell{Info.Ntype}) = ExtName;
        SortCell{Info.Cnt}(SortCell{Info.Ntype}) = SortCell{Info.Cnt}(SortCell{Info.Ntype})+1;
        SortCell{Info.Dim}(SortCell{Info.Ntype}) = SortCell{Info.Dim}(SortCell{Info.Ntype})+ElemVect(j).bytes;
      else
        Idx = find(~cellfun(@isempty,strfind(SortCell{Info.Nam},ExtName)));
        SortCell{Info.Cnt}(Idx) = SortCell{Info.Cnt}(Idx)+1;
        SortCell{Info.Dim}(Idx) = SortCell{Info.Dim}(Idx)+ElemVect(j).bytes;
      end
    end
  end
end
