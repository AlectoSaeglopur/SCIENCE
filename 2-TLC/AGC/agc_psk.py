
"""
" Title: AUTOMATIC GAIN CONTROL (TESTED WITH PSK SIGNAL)
" Author: Filippo Valmori
" Date: 19/08/2022
" Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.13)
"""


### LIBRARIES ###

from numpy import zeros, pi, sin, cos, sqrt, log2, append, floor, \
    asarray, copy, array, flipud, conj, multiply, argmin
from cmath import exp
from numpy.random import normal
from random import randint, seed
from statistics import mean
import matplotlib.pyplot as mpl



### PARAMETERS ###

Nbits = 1600                                            # Number of bits to be simulated
Rb = 10e3                                               # Bit rate [b/s]
N0 = -35                                                # Channel noise power [dBW] (on both I and Q via) -> NB: see NOTE#1
M = 4                                                   # Modulation order
osf = 8                                                 # BB oversampling factor (and also sps factor for RCC filter design)
span = 8                                                # Span for RRC filter representation [Sy]
beta = 0.1                                              # Roll-off factor for RRC filter representation
PhOfs = (1-M)*pi/M                                      # Constellation phase offset [rad]
Rs = Rb/log2(M)                                         # Symbol rate [Sy/s]
Fs = osf*Rs                                             # Sample rate [Sa/s]
NdumS = 0                                               # Number of dummy zero-symbols to be appended at the beginning of Tx stream (OPTIONAL) [S]
NdumF = 0                                               # Number of dummy zero-symbols to be appended at the end of Tx stream (OPTIONAL) [S]
Nsy = int(Nbits/log2(M)+NdumS+NdumF)                    # Number of symbols to be processed [Sy]
ScFct = 1e3                                             # Scaling factor for time graphs

OfsRef = 0+0j                                           # AGC signal DC-offset reference (I+Q) [V]
AmpRef = 1+1j                                           # AGC signal amplitude reference (I+Q) [V]
WinSz = 12*osf                                           # AGC window size [Sa] -> NB: higher "WinSz" means better accuracy (since better noise filtering) but more convergence delay
OfsGain = 0.85                                          # AGC DC-offset loop gain -> NB: use values between 0 and 1, otherwise AGC is unstable + lower "OfsGain" means better accuracy but more convergence delay
AmpGain = 0.65                                          # AGC amplitude loop gain -> NB: use values between 0 and 1, otherwise AGC is unstable + lower "AmpGain" means better accuracy but more convergence delay

Tvar = [[0, 0.3, 0.6],
        [0, 0.2, 0.5]]                                  # Variation times (I+Q) -> NB: expressed as fractions of the overall waveform length
Ovar = [[0.2, 0.25, 0.4],
        [-2.5, -2.55, -2.6]]                            # DC offset variations (I+Q) [V]
Avar = [[0.07, 0.11, 0.09],
        [0.15, 0.45, 0.25]]                             # Amplitude variations (I+Q) [V]

InfAgc = dict([('WinSz',WinSz),('OfsRef',OfsRef),
    ('OfsGain',OfsGain),('AmpRef',AmpRef),('AmpGain',AmpGain)])



### FUNCTIONS ###

"""
" Function for converting an input binary array into the corresponding decimal
" value.
"""
def bi2de( InBin ) :
    OutDe = str(InBin).replace(' ','').replace(',','')                          # Convert array into a string
    OutDe = OutDe.replace(']','').replace('[','')                               # Remove useless characters from string
    return int(OutDe,2)


"""
" Function for converting an input decimal value into the corresponding binary array
" (specifying also the number of bits for the representation).
"""
def dec2bin(Val,Ndig) :
    OutMtx = zeros(Ndig,dtype=int)
    for j in range(Ndig) :
        OutMtx[Ndig-j-1] = Val%2
        Val = int(Val/2)
    return OutMtx


"""
" Function for getting an M-sequence of Gray coded decimal numbers.
"""
def GetGray( M ) :
    L = int(log2(M))                                                            # Number of bits per symbol
    GrayMtx = zeros((M,L),dtype=int)
    LastCell = [[0],[1]]
    GrayMtx[0:2,-1:] = LastCell                                                 # Gray matrix
    for j in range(1,L) :
        GrayMtx[2**j:2**(j+1),-j:] = flipud(LastCell)
        GrayMtx[2**j:2**(j+1),-j-1] = 1
        LastCell = GrayMtx[0:2**(j+1),-j-1:]
    return GrayMtx


"""
" Function for retrieving the PSK bits-to-constellation-symbols
"  mapping according to Gray encoding.
"""
def GetPskTable( M, Ofst ) :
    GrayMtx = GetGray(M)
    Table = dict([('Bi',zeros(M,dtype=int)),('Sy',zeros(M,dtype=complex))])
    for j in range(M) :
        Table['Bi'][j] = bi2de(GrayMtx[j,:])
        Table['Sy'][j] = exp(1j*(Ofst+2*pi*j/M))
    return Table


"""
" Function for mapping an input bit stream into the constellation
" symbols specified by Table.
"""
def Mapper( InBits, Table, NdumS, NdumF, Rs ) :
    M = len(Table['Sy'])
    L = int(log2(M))
    InLen = len(InBits)
    OutLen = int(InLen/L)
    OutSymbs = zeros(OutLen,dtype=complex)
    for j in range(OutLen) :
        CurBits = bi2de(InBits[j*L:(j+1)*L])
        for i in range(M) :
            if Table['Bi'][i] == CurBits :
                OutSymbs[j] = Table['Sy'][i]
                break
    OutSymbs = append(zeros(NdumS,dtype=complex),OutSymbs)                     # Append initial dummy symbols
    OutSymbs = append(OutSymbs,zeros(NdumF,dtype=complex))                     # Append final dummy symbols
    Time = [i/Rs for i in range(len(OutSymbs))]
    return OutSymbs, Time


"""
" Function to upsample input complex stream by a specific factor (with all-zero filling).
"""
def Upsample( InVect, sps ):
    LenIn = len(InVect)
    OutVect = zeros(sps*LenIn,dtype=complex)
    for i in range(LenIn) :
        OutVect[i*sps] = InVect[i]
    return OutVect


"""
" Function to retrieve SRRC filter taps specifying design parameters.
"""
def GetSrrcTaps( beta, span, sps ) :
    Ntaps = sps*span+1
    Taps = zeros(Ntaps,dtype=float)
    epsilon = 1e-30
    ZeroVal = 1/(2*pi*sps)*(pi*(beta+1)*sin(pi*(beta+1)/(4*beta))-4*beta*sin(pi*(beta-1)/(4*beta))+pi*(beta-1)*cos(pi*(beta-1)/(4*beta)))
    for j in range(Ntaps) :
        if j == int(sps*span/2) :
            Taps[j] = -1/(pi*sps)*(pi*(beta-1)-4*beta)
        else :
            Time = (j-sps*span/2)/sps
            if abs(abs(4*beta*Time)-1) < epsilon :
                Taps[j] = ZeroVal
            else :
                Taps[j] = -4*beta/sps*(cos((1+beta)*pi*Time)+sin((1-beta)*pi*Time)/(4*beta*Time))/(pi*((4*beta*Time)**2-1))
    Energy = 0
    for j in range(Ntaps) :
        Energy = Energy+Taps[j]**2
    Energy = sqrt(Energy)
    for j in range(Ntaps) :
        Taps[j] = Taps[j]/Energy
    return Taps, Energy


"""
" Function for performing finite impulse response (FIR) filtering according
" to the specified taps on the input sample stream.
"""
def FirFilter( InSamps, Taps ) :
    Ntaps = len(Taps)
    FirDelay = int((Ntaps-1)/2)
    StateReg = zeros(Ntaps-1,dtype=complex)
    Len = len(InSamps)
    OutSamps = zeros(Len+FirDelay,dtype=complex)
    for i in range(Len+FirDelay) :
        if i < Len :
            InValue = InSamps[i]
        else :
            InValue = 0
        if i >= FirDelay :
            OutValue = Taps[0]*InValue
            for j in range(1,Ntaps) :
                OutValue += Taps[j]*StateReg[j-1]
            OutSamps[i-FirDelay] = OutValue
        for j in range(Ntaps-2,0,-1) :
            StateReg[j] =  StateReg[j-1]
        StateReg[0] = InValue
    return OutSamps[:-FirDelay]


"""
" Function for filtering the input signal by means of SRRC taps and
" adding/removing proper delay samples.
"""
def RccFilter( InVect, beta, span, sps, rtx ) :
    LenIn = len(InVect)
    [RccTaps, SsEnergy] = GetSrrcTaps(beta,span,sps)                            # Retrieve SRCC filter taps and squared energy
    RccDelay = int(span*sps/2)
    if rtx == 'TX' :
        TmpVect = Upsample(InVect,sps)                                          # Upsample input vector
        OutVect = FirFilter(TmpVect,RccTaps)
    else :                                                                      # 'RX' case
        OutVect = FirFilter(InVect,RccTaps)                                     # do not apply upsampling in RX
    return OutVect, SsEnergy


"""
" Function for pulse shaping the input complex symbols into a baseband
" waveform (upsampling + filtering + I/Q phase offset).
"""
def PulseShaper( TxSymbs, beta, span, osfBB, Rs) :
    FsBB = Rs*osfBB
    Nsymbs = len(TxSymbs)
    TimeBB = [i/FsBB for i in range(Nsymbs*osfBB)]                              # Time axis for baseband waveform
    [TxSgnBB, SsEnergy] = RccFilter(TxSymbs,beta,span,osfBB,'TX')               # Root-raised-cosine filtering
    return TxSgnBB, TimeBB, SsEnergy


"""
" Function to downsample input complex stream by a specific factor.
"""
def Downsample( InVect, sps ):
    LenOut = int(len(InVect)/sps)
    OutVect = zeros(LenOut,dtype=complex)
    for i in range(LenOut) :
        OutVect[i] = InVect[i*sps]
    return OutVect


"""
" Function for hard demapping the input symbols into bits according to Table
"""
def Demapper( InSymbs, Table ) :
    M = len(Table['Sy'])
    L = int(log2(M))
    InLen = len(InSymbs)
    OutBits = zeros(InLen*L,dtype=int)
    for k in range(InLen) :
        Dist = abs(InSymbs[k].real-Table['Sy'].real)+ \
            abs(InSymbs[k].imag-Table['Sy'].imag)                               # Apply hard-demapping
        MinIdx = argmin(Dist)
        OutBits[k*L:(k+1)*L] = dec2bin(Table['Bi'][MinIdx],L)
    return OutBits


"""
" Function to aaply DC offset and amplitude variations to the modulated signal.
"""
def VarTxSgn( Sgn ) :
    LenT = len(Sgn)                                                             # Total signal length [Sa]
    for i in range(len(Tvar[0])-1) :
        Sgn[int(LenT*Tvar[0][i]):int(LenT*Tvar[0][i+1])].real = \
            Ovar[0][i]+Avar[0][i]*Sgn[int(LenT*Tvar[0][i]):int(LenT*Tvar[0][i+1])].real
        Sgn[int(LenT*Tvar[1][i]):int(LenT*Tvar[1][i+1])].imag = \
            Ovar[1][i]+Avar[1][i]*Sgn[int(LenT*Tvar[1][i]):int(LenT*Tvar[1][i+1])].imag
    i += 1
    Sgn[int(LenT*Tvar[0][i]):].real = Ovar[0][i]+Avar[0][i]*Sgn[int(LenT*Tvar[0][i]):].real
    Sgn[int(LenT*Tvar[1][i]):].imag = Ovar[1][i]+Avar[1][i]*Sgn[int(LenT*Tvar[1][i]):].imag
    return Sgn


"""
" Function for applying channel AWGN to input signal. Noise samples
" are applied estimating the power of the input waveform.
"""
def AwgnChan( InVect, N0, Fs ) :
    IoLen = len(InVect)                                                         # Calculate output length [Sa]
    Noise = normal(0,sqrt(10**(N0/10.0)),IoLen)+ \
        1j*normal(0,sqrt(10**(N0/10.0)),IoLen)                                  # Get complex AWGN samples (specifying mean value and standard deviation)
    OutVect = copy(InVect)
    OutVect = OutVect+Noise                                                     # Sum noise
    Time = [i/Fs for i in range(IoLen)]                                         # Time axis for baseband waveform
    return OutVect


"""
" Function implementing AGC DC-offset and amplitude compensations.
"""
def Agc( InSgn, InfAgc, Scen ) :
    OfsRef = InfAgc['OfsRef']
    AmpRef = InfAgc['AmpRef']
    WinSz = InfAgc['WinSz']
    OfsGain = InfAgc['OfsGain']
    AmpGain = InfAgc['AmpGain']
    if( Scen == 'CHAN' ) :
        AmpRef *= SsEnergy 
    LenIo = len(InSgn)                                                          # Retrieve I/O signal length [Sa]
    Ncagc = int(floor(LenIo/WinSz))                                             # Number of AGC cycles to process the input signal
    OfsX = 0+0j                                                                 # Starting values of DC offset compensation factor (I+Q)
    AmpX = 1+1j                                                                 # Starting values of amplitude compensation factor (I+Q)
    OutSgn = zeros(LenIo,dtype=complex)
    OfsXv = zeros(Ncagc,dtype=complex)
    AmpXv = zeros(Ncagc,dtype=complex)
    for j in range(Ncagc) :
        # OFFSET CALCULATION #
        MeanWin = mean(InSgn[j*WinSz:(j+1)*WinSz].real)+ \
            1j*mean(InSgn[j*WinSz:(j+1)*WinSz].imag)
        OfsErr = MeanWin-OfsX-OfsRef                                            # Estimate DC-offset error
        OfsXv[j] = OfsErr                                                       # [DEBUG]
        OfsX += OfsErr*OfsGain                                                  # Update DC-offset compensation factor
        # AMPLITUDE CALCULATION #
        PwrWin = (sum((InSgn[j*WinSz:(j+1)*WinSz].real-MeanWin.real)**2)+ \
            1j*sum((InSgn[j*WinSz:(j+1)*WinSz].imag-MeanWin.imag)**2))/WinSz    # Estimate AC power within current window
        AmpErr = AmpRef.real/sqrt(2*PwrWin.real)/AmpX.real+ \
            1j*AmpRef.imag/sqrt(2*PwrWin.imag)/AmpX.imag                        # Estimate amplitude error -> NB: "sqrt(2*PwrWin))" represents the corresponding signal amplitude within current window
        AmpXv[j] = AmpErr-(1+1j)                                                # ("-1" since AmpErr is a ort of scale factor) [DEBUG]
        AmpX = AmpX.real*(1+(AmpErr.real-1)*AmpGain)+ \
            1j*AmpX.imag*(1+(AmpErr.imag-1)*AmpGain)                            # Update amplitude compensation factor
        # OUTPUT COMPENSATION #
        OutSgn[j*WinSz:(j+1)*WinSz] = MeanWin-OfsX+ \
            AmpX.real*(InSgn[j*WinSz:(j+1)*WinSz].real-MeanWin.real)+ \
            1j*AmpX.imag*(InSgn[j*WinSz:(j+1)*WinSz].imag-MeanWin.imag)
    return OutSgn, Ncagc, OfsXv, AmpXv


"""
" Function to retrieve the symbol error positions between Tx and RX.
"""
def GetSyErrPos( TxSy, RxSy ) :
    LenIo = len(TxSy)
    ErrPos = zeros(LenIo,dtype=complex)
    if LenIo != len(RxSy) :
        print(' >> "GetSyErrPos" error: input arrays shall have the same length!')
        exit()
    else :
        for j in range(LenIo) :
            if TxSy[j].real != RxSy[j].real :
                ErrPos[j] += 1
            if TxSy[j].imag != RxSy[j].imag :
                ErrPos[j] += 0.9j
    return ErrPos



### PROCESSING ###

# TX #
TxBits = [randint(0,1) for j in range(Nbits)]                           # Random source bits generation
PskTable = GetPskTable(M,PhOfs)                                         # Retrieve PSK constellation table
[TxSy,_] = Mapper(TxBits,PskTable,NdumS,NdumF,Rs)                       # Bit-to-symbol mapping
[TxSgn,Time,SsEnergy] = PulseShaper(TxSy,beta,span,osf,Rs)              # SRRC pulse shaping to get the Tx baseband waveform
TxSgn = VarTxSgn(TxSgn)                                                 # Apply variations in DC offset and amplitude
ChSgn = AwgnChan(TxSgn,N0,Fs)                                           # Apply AWGN
# RX - pt.1 (SRRC+AGC) #
[RxSgnA,_] = RccFilter(ChSgn,beta,span,osf,'RX')                        # Rx baseband signal after matched SRRC filtering
[RxSgnA,NcagcA,OfsXvA,AmpXvA] = Agc(RxSgnA,InfAgc,'SRRC')               # Apply AGC recovery
RxSyA = Downsample(RxSgnA,osf)                                          # Down-sampling from samples to symbols
RxBitsA = Demapper(RxSyA[NdumS:len(RxSyA)-NdumF],PskTable)              # PSK hard demapping
NerrA = (TxBits!=RxBitsA).sum()                                         # Check number of errors [b]
[RxSyEqA,_] = Mapper(RxBitsA,PskTable,NdumS,NdumF,Rs)                   # Equivlent bit-to-symbol mapping on Rx side
ErrPosA = GetSyErrPos(TxSy,RxSyEqA)                                     # Get symbol error positions in time
# RX - pt.2 (AGC+SRRC) #
[RxSgnB,NcagcB,OfsXvB,AmpXvB] = Agc(ChSgn,InfAgc,'CHAN')                # Apply AGC recovery
[RxSgnB,_] = RccFilter(RxSgnB,beta,span,osf,'RX')                       # Rx baseband signal after matched SRRC filtering
RxSyB = Downsample(RxSgnB,osf)                                          # Down-sampling from samples to symbols
RxBitsB = Demapper(RxSyB[NdumS:len(RxSyB)-NdumF],PskTable)              # PSK hard demapping
NerrB = (TxBits!=RxBitsB).sum()                                         # Check number of errors [b]
[RxSyEqB,_] = Mapper(RxBitsB,PskTable,NdumS,NdumF,Rs)                   # Equivlent bit-to-symbol mapping on Rx side
ErrPosB = GetSyErrPos(TxSy,RxSyEqB)                                     # Get symbol error positions in time
# RESULTS #
print('\n >> AGC (PSK) <<\n')
print(' * Reference :')
print('   - Offset = '+str(OfsRef)+' Vdc')
print('   - Amplit = '+str(AmpRef)+' Vac')
print('\n * Settings :')
print('   - WinSize = '+str(int(WinSz/osf))+' Sy')
print('   - OfsGain = '+str(OfsGain))
print('   - OfsGain = '+str(AmpGain))
print('\n * Performance :')
print('   - Nerr #A (SRRC+AGC) = '+str(NerrA)+' out of '+str(Nbits)+ ' bits')
print('   - Nerr #B (AGC+SRRC) = '+str(NerrB)+' out of '+str(Nbits)+ ' bits')



### PLOTS ###

Fig_1 = mpl.figure(num='AGC-PSK #A (SRRC+AGC)')
Fig_1.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(231)
mpl.plot([i*ScFct for i in Time], TxSgn.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" I")
mpl.plot([i*ScFct for i in Time], TxSgn.imag, color='red', linestyle='-.', linewidth=1,
    marker='o', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('TX SIGNAL')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(232)
mpl.plot([i*ScFct for i in Time], ChSgn.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" I")
mpl.plot([i*ScFct for i in Time], ChSgn.imag, color='red', linestyle='-.', linewidth=1,
    marker='o', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('CHANNEL SIGNAL')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(233)
mpl.plot([i*WinSz/Fs*ScFct for i in range(NcagcA)], OfsXvA.real, color='black', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" DC offset")
mpl.plot([i*WinSz/Fs*ScFct for i in range(NcagcA)], AmpXvA.real, color='darkorange', linestyle='--', linewidth=1,
    marker='o', markersize=2, label=" Amplitude")
mpl.xlabel('Time [ms]')
mpl.ylabel('Error [V]')
mpl.title(' AGC (I)')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(234)
mpl.stem([i/Rs*ScFct for i in range(Nsy)], ErrPosA.real, linefmt ='b-', markerfmt='bx', basefmt='C7-', use_line_collection=False, label=" I")
mpl.stem([i/Rs*ScFct for i in range(Nsy)], ErrPosA.imag, linefmt ='r:', markerfmt='rx', basefmt='C7-', use_line_collection=False, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('SYMBOL ERRORS')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(235)
mpl.plot([i*ScFct for i in Time], RxSgnA.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" I")
mpl.plot([i*ScFct for i in Time], RxSgnA.imag, color='red', linestyle='-.', linewidth=1,
    marker='o', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('OUTPUT SIGNAL')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(236)
mpl.plot([i*WinSz/Fs*ScFct for i in range(NcagcA)], OfsXvA.imag, color='black', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" DC offset")
mpl.plot([i*WinSz/Fs*ScFct for i in range(NcagcA)], AmpXvA.imag, color='darkorange', linestyle='--', linewidth=1,
    marker='o', markersize=2, label=" Amplitude")
mpl.xlabel('Time [ms]')
mpl.ylabel('Error [V]')
mpl.title(' AGC (Q)')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)


Fig_2 = mpl.figure(num='AGC-PSK #B (AGC+SRRC)')
Fig_2.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(231)
mpl.plot([i*ScFct for i in Time], TxSgn.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" I")
mpl.plot([i*ScFct for i in Time], TxSgn.imag, color='red', linestyle='-.', linewidth=1,
    marker='o', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('TX SIGNAL')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(232)
mpl.plot([i*ScFct for i in Time], ChSgn.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" I")
mpl.plot([i*ScFct for i in Time], ChSgn.imag, color='red', linestyle='-.', linewidth=1,
    marker='o', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('CHANNEL SIGNAL')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(233)
mpl.plot([i*WinSz/Fs*ScFct for i in range(NcagcB)], OfsXvB.real, color='black', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" DC offset")
mpl.plot([i*WinSz/Fs*ScFct for i in range(NcagcB)], AmpXvB.real, color='darkorange', linestyle='--', linewidth=1,
    marker='o', markersize=2, label=" Amplitude")
mpl.xlabel('Time [ms]')
mpl.ylabel('Error [V]')
mpl.title(' AGC (I)')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(234)
mpl.stem([i/Rs*ScFct for i in range(Nsy)], ErrPosB.real, linefmt ='b-', markerfmt='bx', basefmt='C7-', use_line_collection=False, label=" I")
mpl.stem([i/Rs*ScFct for i in range(Nsy)], ErrPosB.imag, linefmt ='r:', markerfmt='rx', basefmt='C7-', use_line_collection=False, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('SYMBOL ERRORS')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(235)
mpl.plot([i*ScFct for i in Time], RxSgnB.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" I")
mpl.plot([i*ScFct for i in Time], RxSgnB.imag, color='red', linestyle='-.', linewidth=1,
    marker='o', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('OUTPUT SIGNAL')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(236)
mpl.plot([i*WinSz/Fs*ScFct for i in range(NcagcB)], OfsXvB.imag, color='black', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" DC offset")
mpl.plot([i*WinSz/Fs*ScFct for i in range(NcagcB)], AmpXvB.imag, color='darkorange', linestyle='--', linewidth=1,
    marker='o', markersize=2, label=" Amplitude")
mpl.xlabel('Time [ms]')
mpl.ylabel('Error [V]')
mpl.title(' AGC (Q)')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.show(block=False)                                                           # Show plots
mpl.pause(0.001)                                                                # Pause execution for 1 ms
input("\nPress ENTER to exit")                                                  # Ask closing plots on terminal
mpl.close('all')                                                                # Close all plots



### NOTES ###

# 0. In real communication chains the DC-cutting operation in RX is essentially performed by RF hardware filters before the analog-to-
#    digital conversion (also because a modulated signal at baseband can have not exact 0 mean, e.g. in case of consecutive PSK '1's). 

# 1. The channel noise has been expressed in terms of power (N0 is just a more recognizable name, but that's actually N) and not of
#    Eb/N0 since the presence of DC offsets would make impossible to apply a meaningful "measured" noise (the latter would be too
#    strong). Moreover, note the value of the "N0" parameter is related to the "Avar" setting. For example, N0 = -30 dbW = 1 mW means
#    the equivalent noise amplitude (assuming that has sinusoidal shape) would be V = sqrt(2*N0) = 45 mV. Thus, for instance, setting
#    an amplitude of 20 mV in "Avar" would cause the signal to be completely overwhelmed by AWGN.

# 2. On the RX side x2 scenarios have been simulated. In the 1st one the AGC is placed after the SRRC filter, whereas in the 2nd one
#    before the latter (i.e. just after the channel). As can be seen from the results, the performce are quite similar. However, looking
#    at the 4th plot of scenario A it can be seen how the output signal experiences an erroneous final spike. This is related to the SRRC
#    filter in case the input signal presents a non-null DC offset (since the final null delay samples processed creates a DC discontinuity.
#    To counteract this issue, "NdumF" parameter can be increased (or, more in general, any kind of postamble inserted).
