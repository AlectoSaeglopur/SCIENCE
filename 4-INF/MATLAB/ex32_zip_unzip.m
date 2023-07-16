 
clearvars; clc


%% MAIN

fid = fopen('_README.txt');
txt = textscan(fid, '%s', 'whitespace', '');
msg = txt{1};
orig_bytes = msg{1};
compr_bytes = dzip(orig_bytes);
decom_bytes = dunzip(compr_bytes);

fprintf(" * Original length = %d B\n",length(orig_bytes));
fprintf(" * Compressed length = %d B\n",length(compr_bytes));
fprintf(" * Decompressed length = %d B\n",length(decom_bytes));
fprintf(" * I/O identity-check result = %d\n",strcmp(orig_bytes,decom_bytes));      % '1' means successful
fprintf("\n ------ \n\n")
fprintf(" * Compressed message =\n\n");
fprintf("%c ",compr_bytes);
fprintf("\n\n * Decompressed message =\n\n");
fprintf(decom_bytes);




%% ZIP FUNCTION

function Z = dzip(M)
% DZIP - losslessly compress data into smaller memory space
%
% USAGE:
% Z = dzip(M)
%
% VARIABLES:
% M = variable to compress
% Z = compressed output
%
% NOTES: (1) The input variable M can be a scalar, vector, matrix, or
%            n-dimensional matrix
%        (2) The input variable must be a non-complex and full (meaning
%            matrices declared as type "sparse" are not allowed)
%        (3) Permitted input types include: double, single, logical,
%            char, int8, uint8, int16, uint16, int32, uint32, int64,
%            and uint64.
%        (4) In testing, DZIP compresses several megabytes of data per
%            second.
%        (5) In testing, random matrices of type double compress to about
%            75% of their original size. Sparsely populated matrices or
%            matrices with regular structure can compress to less than
%            1% of their original size. The realized compression ratio
%            is heavily dependent on the data.
%        (6) Variables originally occupying very little memory (less than
%            about half of one kilobyte) are handled correctly, but
%            the compression requires some overhead and may actually
%            increase the storage size of such small data sets.
%            One exception to this rule is noted below.
%        (7) LOGICAL variables are compressed to a small fraction of
%            their original sizes.
%        (8) The DUNZIP function decompresses the output of this function
%            and restores the original data, including size and class type.
%        (9) This function uses the public domain ZLIB Deflater algorithm.
%       (10) Carefully tested, but no warranty; use at your own risk.
%       (11) Michael Kleder, Nov 2005
s = size(M);
c = class(M);
cn = strmatch(c,{'double','single','logical','char','int8','uint8',...
    'int16','uint16','int32','uint32','int64','uint64'});
if cn == 3 || cn == 4
    M=uint8(M);
end
M=typecast(M(:),'uint8');
M=[uint8(cn);uint8(length(s));typecast(s(:),'uint8');M(:)];
f=java.io.ByteArrayOutputStream();
g=java.util.zip.DeflaterOutputStream(f);
g.write(M);
g.close;
Z=typecast(f.toByteArray,'uint8');
f.close;
return
end


%% UNZIP FUNCTION

function M = dunzip(Z)
% DUNZIP - decompress DZIP output to recover original data
%
% USAGE:
% M = dzip(Z)
%
% VARIABLES:
% Z = compressed variable to decompress
% M = decompressed output
%
% NOTES: (1) The input variable Z is created by the DZIP function and
%            is a vector of type uint8
%        (2) The decompressed output will have the same data type and
%            dimensions as the original data provided to DZIP.
%        (3) See DZIP for other notes.
%        (4) Carefully tested, but no warranty; use at your own risk.
%        (5) Michael Kleder, Nov 2005

import com.mathworks.mlwidgets.io.InterruptibleStreamCopier
a=java.io.ByteArrayInputStream(Z);
b=java.util.zip.InflaterInputStream(a);
isc = InterruptibleStreamCopier.getInterruptibleStreamCopier;
c = java.io.ByteArrayOutputStream;
isc.copyStream(b,c);
Q=typecast(c.toByteArray,'uint8');
cn = double(Q(1)); % class
nd = double(Q(2)); % # dims
s = typecast(Q(3:8*nd+2),'double')'; % size
Q=Q(8*nd+3:end);
if cn == 3
    M  = logical(Q);
elseif cn == 4
    M = char(Q);
else
    ct = {'double','single','logical','char','int8','uint8',...
        'int16','uint16','int32','uint32','int64','uint64'};
    M = typecast(Q,ct{cn});
end
M=reshape(M,s);
return
end
