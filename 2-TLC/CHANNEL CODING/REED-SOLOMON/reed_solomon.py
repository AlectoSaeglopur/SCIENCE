
"""
" Title: REED-SOLOMON ENCODER AND DECODER
" Author: Filippo Valmori
" Date: 29/10/2018
" Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.8)
"            [2] Implementing Reed-Solomon - A.Brown
"            [3] Reed-Solomon Decoder: TMS320C64x Implementation - J.Sankaran
"""


### LIBRARIES ###

from numpy import zeros, where, array, copy
from random import seed, uniform
from numpy.random import randint
from time import time



### PARAMETERS ###

m = 8                                                                   # extended Galois field degree (i.e. the number of bits per symbol)
n = 204														            # codeword length (in symbols)
k = 188														            # message length (in symbols)
Nmsg = 1														        # number of messages to be encode/decoded
Peb = 0.004													            # bit error probability for BSC simulation



### FUNCTIONS ###

def GetInfo( m, n, k, Nmsg ) :
    DimGF = int(1<<m)												        # overall number of symbols in GF(2^m)
    t = int((n-k)/2)												    # maximum number of recoverable corrupted symbols
    nUnsh = int((1<<m)-1)											        # unshortened value of n
    kUnsh = int(nUnsh-2*t)											        # unshortened value of k
    UncLen = int((m*k*Nmsg)/8)										    # uncoded stream length (in bytes)
    EncLen = int((m*n*Nmsg)/8)										    # encode stream length (in bytes)
    LenGP = int(2*t+1)												        # length of the generator polynomial array
    Info = dict([('m',m),('n',n),('k',k),('DimGF',DimGF), \
        ('t',t),('nUnsh',nUnsh),('kUnsh',kUnsh),('UncLen',UncLen), \
        ('EncLen',EncLen),('LenGP',LenGP),('Nmsg',Nmsg)])
    return Info


"""
" Function for checking the parameters correcteness.
"""
def CheckParam( m, n, k ) :
    DimGF = int(1<<m)												        # overall number of symbols in GF(2^m)
    if (m != 4) and (m != 8) :
        print("\n >> ERROR : Invalid extended Galois field degree (m)\n")
        exit(1)
    elif (k <= 0) or ((n-k)%2 != 0) or (n > (DimGF-1)) :
        print("\n >> ERROR : Invalid message/codeword length (n,k)\n")
        exit(1)
    elif (m == 4) and ((n%2) != 0) :
        print("\n >> ERROR : when m equals 4, n must be even\n")
        exit(1)


"""
" Function for retrieving primitive polynomial (maximum degree is implied) as a
" function of the chosen m.
"""
def GetPrimPoly( m ) :
    if m == 4 :
        pPoly = array([0,1])									        # primitive polynomial for GF(2^4) (maximum degree is implied)
    elif m == 8 :
        pPoly = array([0,2,3,4])									    # primitive polynomial for GF(2^8) (maximum degree is implied)
    return pPoly


"""
" Function for retrieving the bit basis from remainder polynomial during mapping.
"""
def GetBasis( Poly, m ) :
    Basis = 0
    Poly = Poly.astype(int)
    for j in range(m) :
        Basis |= (Poly[j]<<(m-j-1))
    return Basis


"""
" Function for creating the mapping table between GF symbols and bit basis by calculating
" the remainder of x^j divided by PrimPoly(x).
"""
def MapGF( PrimPoly, Info ) :
    m = Info['m']
    DimGF = Info['DimGF']
    Table = zeros((2,DimGF),dtype=int)				                    # mapping table between symbol to basis (1st row S2B, 2nd row B2S)
    for j in range(1,DimGF,1) :
        TmpPoly = zeros(DimGF,dtype=int)                                # reset all elements of temporary polynomial to 0
        MaxDeg = j-1                                                    # polynomial maximum degree at current iteration
        TmpPoly[MaxDeg] = 1
        QuotDeg = MaxDeg-m
        while QuotDeg >= 0 :
            TmpPoly[MaxDeg] = 0
            for i in range(len(PrimPoly)) :
                TmpPoly[QuotDeg+PrimPoly[i]] = \
                    (TmpPoly[QuotDeg+PrimPoly[i]]+1)%2
            MaxDeg = max(max(where(TmpPoly>0)))                         # find the new maximum degree of polynomial
            QuotDeg = MaxDeg-Info['m']									# update the quotient degree of polynomial after division
        Table[0][j] = GetBasis(TmpPoly,m)						        # retrieve bit basis from remainder
        Table[1][Table[0][j]] = j
    return Table


"""
" Function for performing multiplication in GF(2^m).
"""
def MultGF( SymbA, SymbB, DimGF ) :
    SymbRes = 0
    if (SymbA != 0) and (SymbB != 0) :
        SymbRes = ((SymbA+SymbB-2)%(DimGF-1))+1
    return SymbRes


"""
" Function for performing power operation in GF(2^m).
" NB#1: to get "alpha^(w)" use "PowGF(2,w)".
" NB#2: to get "alpha^(-w)" use "PowGF(2,-w)".
" NB#3: to get "Symb^-1" use "PowGF(2,-Symb+1)" and keep in mind the
"       identity "MultGF(Symb,PowGF(2,-Symb+1))=1".
"""
def PowGF( SymbBase, Exp, DimGF ) :
    if (SymbBase == 0) or (SymbBase == 1) :
        SymbRes = SymbBase
    else :
        Tmp = ((SymbBase-1)*Exp)%(DimGF-1)
        if Exp < 0 :
            SymbRes = Tmp+DimGF
        else :
            SymbRes = Tmp+1
    return SymbRes


"""
" Function for performing addition in GF(2^m).
"""
def AddGF( SymbA, SymbB, Table ) :
    BasisRes = Table[0][SymbA]^Table[0][SymbB]
    return Table[1][BasisRes]


"""
" Function for iteratively computing the code generator polynomial as
" GenPoly(x) = (x+a)*(x+a^2)*...*(x+a^2t).
"""
def GetGenPoly( Info, Table ) :
    LenGP = Info['LenGP']
    DimGF = Info['DimGF']
    GenPoly = zeros(LenGP,dtype=int)
    GenPoly[0] = 2												        # initialize generator polynomial as (x+a)
    GenPoly[1] = 1
    for i in range(2,LenGP,1) :
        for j in range(LenGP-1,-1,-1) :
            Tmp = MultGF(GenPoly[j],PowGF(2,i,DimGF),DimGF)
            if ( j > 0 ) :
                GenPoly[j] = AddGF(Tmp,GenPoly[j-1],Table)
            else :
                GenPoly[j] = Tmp
    return GenPoly


"""
" Function for getting the GF symbol corresponding to the input bit basis.
"""
def ConvB2S( InBasis, Table ) :
    return Table[1][InBasis]


"""
" Function for getting the bit basis corresponding to the input GF symbol.
"""
def ConvS2B( InSymb, Table ) :
	return Table[0][InSymb]


"""
" Function for performing Reed-Solomon encoding in systematic form at byte level.
" Redundancy bytes are appendend at the beginning of codewords and calculated as the
" remainder of the upshifted message polynomial divided by the generator polynomial.
" NB: The encoder can handle multiple input messages at a time.
"""
def EncoderRS( InBytes, GenPoly, Info, Table ) :
    k = Info['k']
    t = Info['t']
    LenGP = Info['LenGP']
    DimGF = Info['DimGF']
    kUnsh = Info['kUnsh']
    nUnsh = Info['nUnsh']
    EncLen = Info['EncLen']
    InSymbs = zeros(kUnsh,dtype=int)
    TmpPoly = zeros(nUnsh,dtype=int)
    OutBytes = zeros(EncLen,dtype=int)
    DivQuotCoef = zeros(nUnsh,dtype=int)
    for i in range(Nmsg) :
        InSymbs[:] = 0
        for j in range(k) :
            if m == 4 :
                if (j%2) == 0 :
                    CurSymb = InBytes[int((j+i*k)/2)]>>4
                else :
                    CurSymb = InBytes[int((j-1+i*k)/2)]&15
            elif m == 8 :
                CurSymb = InBytes[j+i*k]
            InSymbs[j] = ConvB2S(CurSymb,Table)			                # bits-to-symbol conversion
        TmpPoly[:] = 0
        TmpPoly[2*t:] = InSymbs                                         # upshift the message polynomial by 2t positions
        MaxDeg = nUnsh-1                                                # initialize the temporary polynomial maximum degree
        QuotDeg = MaxDeg-2*t
        while QuotDeg >= 0 :                                            # NB: this while-loop is the most time-demanding part of the encoder!
            QuotCoef = TmpPoly[MaxDeg]								    # quotient coefficient at current iteration
            DivQuotCoef[:] = 0
            for j in range(LenGP) :
                DivQuotCoef[j+QuotDeg] = MultGF(QuotCoef,GenPoly[j],DimGF)
            for j in range(nUnsh) :
                TmpPoly[j] = AddGF(TmpPoly[j],DivQuotCoef[j],Table)
            MaxDeg = max(max(where(TmpPoly>0))) 
            QuotDeg = MaxDeg-2*t
        if m == 4 :
            for j in range(2*t) :
                if (j%2) == 0 :
                    OutBytes[int((j+i*n)/2)] = ConvS2B(TmpPoly[j],Table)<<4
                else :
                    OutBytes[int((j-1+i*n)/2)] |= ConvS2B(TmpPoly[j],Table)
            OutBytes[int(t+i*n/2):int(t+i*n/2+k/2)] = InBytes[int(i*k/2):int(i*k/2+k/2)]
        elif m == 8 :
            for j in range(2*t) :
                OutBytes[j+i*n] = ConvS2B(TmpPoly[j],Table);		    # write redundancy bits into output stream after symbol-to-bits conversion
            OutBytes[2*t+i*n:2*t+i*n+k] = InBytes[i*k:i*k+k]            #  copy current message bits into output stream
    return OutBytes


"""
" Function for simulating a Binary Symmetric Channel (BSC) to introduce errors on the input
" byte stream with probability fixed by parameter Peb. The number of bit and symbol errors
" per message are store into the CahnErr matrix.
"""
def ChanBSC( InBytes, Peb, Info ) :
    m = Info['m']
    n = Info['n']
    EncLen = len(InBytes)
    Mask = 1
    BitErrCount = 0
    SymbErrCount = 0
    MsgIdx = 0
    LockSymbErr = False
    OutBytes = copy(InBytes)                                            # NB: do not use "OutBytes=InBytes" otherwise they point to the same physical array (thus modifying OutBytes modifies InBytes as well!)
    BitLen = 8*EncLen
    ChanErr = zeros((Nmsg,2),dtype=int)
    for j in range(BitLen) :
        if uniform(0.0,1.0) < Peb :
            BitErrCount += 1
            if LockSymbErr == False :
                SymbErrCount += 1
                LockSymbErr = True
            ByteIdx = j>>3
            BitIdx = j&7
            if OutBytes[ByteIdx] & (Mask<<(7-BitIdx)) :
                OutBytes[ByteIdx] &= ~(Mask<<(7-BitIdx))
            else :
                OutBytes[ByteIdx] |= (Mask<<(7-BitIdx))
        if (j%m) == m-1 :
            LockSymbErr = False
        if (j%(m*n)) == (m*n-1) :
            ChanErr[MsgIdx][0] = BitErrCount                            # store the number of bit errors within current message
            ChanErr[MsgIdx][1] = SymbErrCount                           # store the number of symbol errors within current message
            BitErrCount = 0
            SymbErrCount = 0
            MsgIdx += 1
    return OutBytes, ChanErr


"""
" Function for estimating the syndrome symbols vector of the input codeword
" (the 0-degree coefficient is omitted, since always 0).
"""
def GetSyndrome( CwSymbs, Info, Table ) :
    t = Info['t']
    DimGF = Info['DimGF']
    nUnsh = Info['nUnsh']
    ErrFlag = False
    Syndr = zeros(2*t,dtype=int)
    for i in range(2*t) :                           	                # compute syndrome polynomial Syndr(x) as Cw(x) for x = a, a^2, ..., a^2t
        SumValue = CwSymbs[0]
        for j in range(1,nUnsh,1) :
            SumValue = AddGF(SumValue,MultGF(CwSymbs[j],PowGF(i+2,j,DimGF),DimGF),Table)
        Syndr[i] = SumValue
        if SumValue != 0 :
            ErrFlag = True											    # assert error flag if one coefficient is not equal to 0
    return Syndr, ErrFlag


"""
" Function for calculating the discrepancy within the Berlekamp-Massey algorithm. 
"""
def GetDiscrepancy( Syndr, Sigma, Nerr, Iter, Info, Table ) :
    DimGF = Info['DimGF']
    Delta = 0
    for j in range(Nerr+1) :
        Delta = AddGF(Delta,MultGF(Sigma[j],Syndr[Iter-j],DimGF),Table)
    return Delta


"""
" Function for executing the Berlekamp-Massey algorithm to iteratively estimate the
" error locator polynomial Sigma(x).
""" 
def BerlekMasseyAlg( Syndr, Info, Table ) :
    t = Info['t']
    DimGF = Info['DimGF']
    Ec = 0													            # current number of assumed errors
    h = -1                                                              # error iteration counter
    SigmaC = zeros(t+1,dtype=int)                                       # Sigma(x) polynomial at current iteration
    SigmaN = zeros(t+1,dtype=int)                                       # Sigma(x) polynomial at next iteration
    Tau = zeros(t+1,dtype=int)                                          # Tau(x) polynomial
    Tau[1] = 1
    SigmaC[0] = 1
    for i in range(2*t) :
        if Ec <= t :
            Delta = GetDiscrepancy(Syndr,SigmaC,Ec,i,Info,Table)                    # compute discrepancy
            if Delta != 0 :
                for j in range(t+1) :
                    SigmaN[j] = AddGF(SigmaC[j],MultGF(Delta,Tau[j],DimGF),Table)   # compute next value of polynomial Sigma(x)
                if Ec < (i-h) :
                    En = i-h                                                        # compute next value of E
                    h = i-Ec
                    for j in range(t+1) :
                        Tau[j] = MultGF(PowGF(2,-Delta+1,DimGF),SigmaC[j],DimGF)    # update polynomial Tau(x)
                    Ec = En
                SigmaC = copy(SigmaN)                                               # update polynomial Sigma(x) to latest value
            Tau[1:] = Tau[:-1]
            Tau[0] = 0
    return SigmaC


"""
" Function for executing the Chien search algorithm to estimate the error positions
" of the corrupted symbols by finding the roots of Sigma(x). 
"""
def ChienAlg( Sigma, Info, Table ) :
    Idx = 0
    t = Info['t']
    nUnsh = Info['nUnsh']
    DimGF = Info['DimGF']
    ErrLoc = zeros(t,dtype=int)
    for i in range(nUnsh) :
        Root = Sigma[0]
        for j in range(1,t+1,1) :

            Root = AddGF(Root,MultGF(Sigma[j],PowGF(i+1,j,DimGF),DimGF),Table)
        if (Root == 0) and (Idx < t) :
            ErrLoc[Idx] = PowGF(i+1,-1,DimGF)%(DimGF-1)
            #print(ErrLoc[Idx])
            Idx += 1
    return ErrLoc


"""
" Function for estimating the error evaluator polynomial Omega(x) by using the Key equation
" Omega(x) = mod((1+Syndr(x))*Sigma(x),x^(2t+1)).
"""
def KeyAlg( Syndr, Sigma, Info, Table ) :
    t = Info['t']
    DimGF = Info['DimGF']
    TmpOmega = zeros(3*t+1,dtype=int)
    TmpSyndr = zeros(2*t+1,dtype=int)
    TmpSyndr[0] = 1
    TmpSyndr[1:] = Syndr                                                # TmpSyndr(x) = 1+Syndr(x)
    for i in range(t+1) :
        for j in range(2*t+1) :
            TmpOmega[i+j] = AddGF(TmpOmega[i+j],MultGF(Sigma[i],TmpSyndr[j],DimGF),Table)
    Omega = TmpOmega[:2*t+1]
    return Omega


"""
" Function for executing the Forney algorithm to estimate the error magnitudes
" of the corrupted symbols.
"""
def ForneyAlg( Omega, ErrLoc, Info, Table ) :
    t = Info['t']
    DimGF = Info['DimGF']
    ErrMag = zeros(t,dtype=int)
    for i in range(t) :
        if ErrLoc[i] != 0 :
            Root = PowGF(ErrLoc[i],-1,DimGF)
            Num = Omega[0]
            for j in range(1,2*t+1,1) :
                Num = AddGF(Num,MultGF(Omega[j],PowGF(Root,j,DimGF),DimGF),Table)
            Den = 1
            for j in range(t) :
                if i != j :
                    Den = MultGF(Den,AddGF(1,MultGF(Root,ErrLoc[j],DimGF),Table),DimGF)
            ErrMag[i] = MultGF(Num,PowGF(2,-Den+1,DimGF),DimGF)
    return ErrMag


"""
" Function for correcting the corrupted symbols with the estimated error
" locations and magnitudes.
"""
def CorrectErr( IoSymbs, ErrLoc, ErrMag, Info, Table ) :
    t = Info['t']
    DimGF = Info['DimGF']
    for j in range(t) :
        if ErrLoc[j] != 0 :
            IoSymbs[ErrLoc[j]-1] = AddGF(IoSymbs[ErrLoc[j]-1],ErrMag[j],Table)
    return IoSymbs


"""
" Function for performing Reed-Solomon decoding in systematic form at byte level. Redundancy
" bytes are expected at the beginning of codewords.
" NB: The decoder can handle multiple input codewords at a time.
"""
def DecoderRS( InBytes, Info, Table ) :
    k = Info['k']
    n = Info['n']
    t = Info['t']
    Nmsg = Info['Nmsg']
    nUnsh = Info['nUnsh']
    UncLen = Info['UncLen']
    OutBytes = zeros(UncLen,dtype=int)
    IoSymbs = zeros(nUnsh,dtype=int)
    for i in range(Nmsg) :
        for j in range(n) :
            if m == 4 :
                if (j%2) == 0 :
                    CurSymb = InBytes[int((j+i*n)/2)]>>4
                else :
                    CurSymb = InBytes[int((j-1+i*n)/2)]&15
            elif m == 8 :
                CurSymb = InBytes[j+i*n]
            IoSymbs[j] = ConvB2S(CurSymb,Table)                         # bits-to-symbol conversion
        Syndr,ErrFlag = GetSyndrome(IoSymbs,Info,Table);				# estimate the syndrome polynomial
        if ErrFlag == True :											# check if symbol errors have been detected
            Sigma = BerlekMasseyAlg(Syndr,Info,Table)                   # estimate polynomial Sigma(x)
            ErrLoc = ChienAlg(Sigma,Info,Table)							# estimate the error locator polynomial
            Omega = KeyAlg(Syndr,Sigma,Info,Table)						# estimate the polynomial Omega(x)
            ErrMag = ForneyAlg(Omega,ErrLoc,Info,Table)                 # estimate the error magnitude polynomial
            IoSymbs = CorrectErr(IoSymbs,ErrLoc,ErrMag,Info,Table)      # correct the corrupted symbol stream
        if m == 4 :
            for j in range(k) :
                if (j%2) == 0 :
                    OutBytes[int((j+i*k)/2)] = ConvS2B(IoSymbs[j+2*t],Table)<<4
                else :
                    OutBytes[int((j-1+i*k)/2)] |= ConvS2B(IoSymbs[j+2*t],Table)
        elif m == 8 :
            for j in range(k) :
                OutBytes[j+i*k] = ConvS2B(IoSymbs[j+2*t],Table)         # symbol-to-bits conversion
    return OutBytes



### PROCESSING ###

Time1 = time()
Info = GetInfo(m,n,k,Nmsg)
CheckParam(m,n,k)												        # check the parameters correctness
seed(time())                                                            # link random seed to actual time
SrcBytes = randint(0,256,Info['UncLen'])                                # random generation of source bytes
PrimPoly = GetPrimPoly(m)									            # retrieve the primitive polynomial for GF(2^m)
Table = MapGF(PrimPoly,Info)									        # fill the mapping table
GenPoly = GetGenPoly(Info,Table)                                        # retrieve the code generator polynomial
Time2 = time()
EncBytes = EncoderRS(SrcBytes,GenPoly,Info,Table)                       # apply Reed-Solomon encoding
Time3 = time()
ChBytes,Nerr = ChanBSC(EncBytes,Peb,Info)								# BSC simulation
Time4 = time()
DecBytes = DecoderRS(ChBytes,Info,Table)                                # apply Reed-Solomon decoding
Time5 = time()
Check = (SrcBytes==DecBytes).all()                                      # check initial TX info bytes with final RX ones [all.() returns TRUE if all elements of the two arrays match, FALSE otherwise)

print('\n >> REED-SOLOMON ENCODING <<\n')
# print(' * SRC ('+str(len(SrcBytes))+' bytes) :\n'," ".join(str(hex(x)[2:].upper()) for x in SrcBytes),'\n')
# print(' * ENC ('+str(len(EncBytes))+' bytes) :\n'," ".join(str(hex(x)[2:].upper()) for x in EncBytes),'\n')
# print(' * CHA ('+str(len(ChBytes))+' bytes) :\n'," ".join(str(hex(x)[2:].upper()) for x in ChBytes),'\n')
# print(' * DEC ('+str(len(DecBytes))+' bytes) :\n'," ".join(str(hex(x)[2:].upper()) for x in DecBytes),'\n')
print(' * CHANNEL ERRORS (max recovery = '+str(Info['t'])+' Symb):' )
for j in range(Nmsg) :
    print('  - Msg#'+str(j+1),'>> Nbits =',Nerr[j,0],'| Nsymb =',Nerr[j,1])
print('\n * FINAL CHECK :',str(Check))

Time6 = time()
print('\n >> Elapsed time : INI = '+str(round(Time2-Time1,3))+' s')
print(' >> Elapsed time : ENC = '+str(round(Time3-Time2,3))+' s')
print(' >> Elapsed time : CHA = '+str(round(Time4-Time3,3))+' s')
print(' >> Elapsed time : DEC = '+str(round(Time5-Time4,3))+' s')
print(' >> Elapsed time : RES = '+str(round(Time6-Time5,3))+' s')
print(' >> Elapsed time : TOT = '+str(round(Time6-Time1,3))+' s')
