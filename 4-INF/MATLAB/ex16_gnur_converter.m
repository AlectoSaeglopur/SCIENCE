
% Example script for showing how to read/write binary files
% from GNU Radio (saved as byte or complex streams)

close all; clearvars; clc


%% 1) READ COMPLEX STREAM FROM GNURADIO BINARY OUTPUT

f1 = fopen('complex_stream_in','rb');
t1 = fread(f1,[2,inf],'float32');
v = t1(1,:)+t1(2,:)*1i;         % BEWARE: sometimes that gives the conjugate of each sample (try "v=t1(1,:)+t1(2,:)*1i;")
fclose(f1);
fprintf('\nCOMPLEX STREAM:\n');
for j = 1:length(v)
    fprintf('%1.1f+%1.1fj\n',t1(1,j),t1(2,j));
end


%% 2) READ BYTE STREAM FROM GNURADIO BINARY OUTPUT

% f2 = fopen('byte_stream_in','rb');
% t2 = fread(f2,inf,'uint8');
% fclose(f2);
% t3 = dec2bin(t2);
% fprintf('\nBYTE STREAM:\n');
% for j = 1:10
%     fprintf('%d\n',t2(j));
% end
% fprintf('\nBIT STREAM:\n');
% for j = 1:10
%     fprintf('%c%c%c%c%c%c%c%c\n',t3(j,1),t3(j,2),t3(j,3),t3(j,4),t3(j,5),t3(j,6),t3(j,7),t3(j,8));
% end


%% 3) WRITE COMPLEX STREAM TO BINARY FOR GNURADIO INPUT

% complex_stream = [1+.5i 22+99i 51.34+41i -6+2.89j -3.2-77i];    % monodimesional array of double complex - real and imag parts are float64
% complex_stream = single(complex_stream);    % single complex conversion - real and imag parts are float32 [NOT ESSENTIAL]
% 
% stream_length = length(complex_stream);
% I_stream = real(complex_stream);
% Q_stream = imag(complex_stream);
% IQ_stream(1:2:stream_length*2-1) = I_stream;
% IQ_stream(2:2:stream_length*2) = Q_stream;
% f3 = fopen('complex_stream_out','w');
% fwrite(f3,IQ_stream,'float32');
% fclose(f3);
% 
% f3 = fopen('complex_stream_out','rb');
% t3 = fread(f3,[2,inf],'float32');
% fclose(f3);
% fprintf('\nOUT:\n');
% for j = 1:stream_length
%     fprintf('%1.1f+%1.1fj\n',t3(1,j),t3(2,j));
% end


%% 4) WRITE BYTE STREAM TO BINARY FOR GNURADIO INPUT

% byte_stream = [251 5 12 38 64 189];       % monodimesional array of uint8
% byte_stream = uint8(byte_stream);         % uint8 conversion [NOT ESSENTIAL]
% 
% stream_length = length(byte_stream);
% f4 = fopen('byte_stream_out','w');
% fwrite(f4,byte_stream,'uint8');
% fclose(f4);
% 
% f4 = fopen('byte_stream_out','rb');
% t4 = fread(f4,'uint8');
% fclose(f4);
% fprintf('\nOUT:\n');
% for j = 1:stream_length
%     fprintf('%d\n',t4(j));
% end
