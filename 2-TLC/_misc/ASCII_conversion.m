
close all; clearvars; clc

%% CONVERSION OF CHAR MESSAGE INTO BIT STREAM AND BACK _v1 (back less performing)

% in_msg = 'ciao'
% binary = reshape(dec2bin(in_msg, 8).'-'0',1,[])
% str = char(bin2dec(reshape(char(binary+'0'), 8,[]).'));
% out_msg = str(1);
% for j=2:length(str)
%     out_msg = strcat(out_msg ,str(j))
% end


%% CONVERSION OF CHAR MESSAGE INTO BIT STREAM AND BACK _v2 (back more performing, no for loop)

in_msg = 'vkn rules!';
binary = reshape(dec2bin(in_msg, 8).'-'0',1,[])
str = char(bin2dec(reshape(char(binary+'0'), 8,[]).'))'

