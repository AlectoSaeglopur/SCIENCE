
%%% Title: CYCLIC REDUNDANCY CHECK (CRC) CALCULATOR
%%% Author: Filippo Valmori
%%% Date: 08/11/2018
%%% Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Cyclic_redundancy_check

close all; clearvars; clc


%% PARAMETERS

CrcDeg = 16;                                        % CRC degree (i.e. number of CRC bits)
MsgLen = 10;                                        % Source stream length (in bytes)


%% SIMULATION

MsgBytes = randi([0 255],1,MsgLen);
GenPoly = GetGenPoly(CrcDeg);
CrcBytes = CrcCalc(MsgBytes,GenPoly,CrcDeg);


%% CRC FUNCTIONS

%%% --> Function for retrieving the generator polynmial (maximum
%%% 	term is implied) as a function of the CRC degree
function GenPoly = GetGenPoly( CrcDeg )

    switch CrcDeg
        case 4
            GenPoly = [0 1];                        % 1+x(+x^4) from ITU standard
        case 8
            GenPoly = [0 2 4 6 7];                  % 1+x^2+x^4+x^6+x^7(+x^8) from DVB-S2 standard
        case 16
            GenPoly = [0 5 12];                     % 1+x^5+x^12(+x^16) from CCITT standard
        case 24
            GenPoly = [0 1 5 6 23];                 % 1+x+x^5+x^6+x^23(+x^24) from UMTS standard
        case 32
            GenPoly = [0 1 2 4 5 7 8 10 ...         % 1+x+x^2+x^4+x^5+x^7+x^8+x^10+x^11+x^12+x^16+x^22+x^23+x^26(+x^32) from MPEG-2 standard
                11 12 16 22 23 26];
        case 64
            GenPoly = [0 1 3 4];                    % 1+x+x^3+x^4(+x^64) from ISO standard
        otherwise
            error('Invalid CRC degree');
    end
    
end


%%% --> Function for estimating the CRC of the input bit stream
%%%     as a function of the selected generator polynomial
function CrcBytes = CrcCalc( InBytes, GenPoly, CrcDeg )

        InBits = Byte2BitConv(InBytes);
        InLen = length(InBits);
        PolyLen = CrcDeg+InLen;
        TmpPoly = [InBits zeros(1,CrcDeg)];
        MaxDeg = PolyLen-find(TmpPoly==1,1,'first');
        
        if ~isempty(MaxDeg)
            
            QuotDeg = MaxDeg-CrcDeg;

            while QuotDeg >= 0

                TmpPoly(PolyLen-MaxDeg) = 0;        % Reset the maxim degree coefficient of TmpPoly(x)

                for i = 1:length(GenPoly)
                    RemIdx = PolyLen-QuotDeg-GenPoly(i);
                    TmpPoly(RemIdx) = mod(TmpPoly(RemIdx)+1,2);
                end

                MaxDeg = PolyLen-find(TmpPoly==1,1,'first');
                QuotDeg = MaxDeg-CrcDeg;

            end
            
        end
        
        CrcBytes = Bit2ByteConv(TmpPoly(InLen+1:end));

end


%%% --> Function for converting a byte stream into the corresponding bit stream
function OutBits = Byte2BitConv( InBytes )

    OutBits = reshape(de2bi(InBytes,8,'left-msb').',[1 8*length(InBytes)]);

end


%%% --> Function for converting a bit stream into the corresponding byte stream
function OutBytes = Bit2ByteConv( InBits )

    OutBytes = bi2de(reshape(InBits,8,length(InBits)/8).','left-msb');

end
