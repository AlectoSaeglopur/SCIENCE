
close all; clearvars; clc



%% CONVERSION OF CHAR MESSAGE INTO BIT STREAM AND BACK (v.1)
% bin2char less performing (for-loop needed)

in_msg = 'ciao'
binary = reshape(dec2bin(in_msg, 8).'-'0',1,[])
str = char(bin2dec(reshape(char(binary+'0'), 8,[]).'));
out_msg = str(1);
for j=2:length(str)
    out_msg = strcat(out_msg ,str(j));
end
out_msg
fprintf(" -------\n");


%% CONVERSION OF CHAR MESSAGE INTO BIT STREAM AND BACK (v.2)
% bin2char more performing (no for-loop needed)

in_msg = 'vkn rules!'
binary = reshape(dec2bin(in_msg, 8).'-'0',1,[])
str = char(bin2dec(reshape(char(binary+'0'), 8,[]).'))'

