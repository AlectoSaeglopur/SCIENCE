
"""
" Title: DIRECT-SEQUENCE SPREAD SPECTRUM SYNCHRONIZATION
" Author: Filippo Valmori
" Date: 19/08/2022
" Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.12)
"""


### LIBRARIES ###

from numpy import zeros, log2, pi, flipud, append, sin, cos, sqrt, \
    linspace, copy, argmin, concatenate, argmax, conj, floor
from numpy.fft import fft, fftshift
from cmath import exp, log10
from random import randint
from numpy.random import normal
from scipy.signal import correlate
import matplotlib.pyplot as mpl



### PARAMETERS ###

Nsbits = 120                                            # Number of source bits to be simulated
Rb = 10e3                                               # Bit rate [b/s]
Xc = 11                                                 # Chip factor (NB: shall be not larger than LenPN) [C/b]
M = 4                                                   # Modulation order
LenPr = 500                                             # Length of binary pseudo-random sequence [b] -> NB: advised to keep it larger than Xc*Nsbits
EbJ0 = 5                                                # Energy-per-bit-to-jamming-power-spectral-density ratio [dB]
Ndly = 337                                              # Channel delay [Sa]
osf = 8                                                 # BB oversampling factor (and also sps factor for RCC filter design)
span = 8                                                # Span for RRC filter representation [S]
beta = 0.5                                              # Roll-off factor for RRC filter representation
SwVal = b'\xD3\x91\x2E'                                 # Sync Word binary value -> NB: its bit-length shall be divisible by log2(M)
SwIdx = 36                                              # Sync Word position (e.g. "5" means the SW is inserted from the 6th bit of the Tx stream on) -> NB: shall be a) divisible by log2(M) and b) not larger than Nsbits
CorTlr = 20                                             # Correlation tolerance during synchronization [%] -> NB: the lower EbN0 the higher CorTlr shall be set



### CONSTANTS ###

Ndummy = 0                                              # Number of dummy zero-symbols to be appended at the beginning and end of Tx stream [S]
Rs = Rb/log2(M)                                         # Symbol rate [S/s]
Rc = Xc*Rs                                              # Chip rate [C/s]
PhOfs = (1-M)*pi/M                                      # Constellation phase offset [rad]
Fs = osf*Rs*Xc                                          # DSSS baseband sample rate [Sa/s]

ScFct = 1e3                                             # Scaling factor for graphs
WaveXlim = 2e-3                                         # Limit on X-axis for BB and RF waveform plot [s]
SpectXlim = Fs/1.5e3                                    # Limit on X-axis for BB spectrum plot [kHz]
SpectYlim1 = -100                                       # Lower limit on Y-axis for BB spectrum plot [dBW]
SpectYlim2 = -20                                        # Upper limit on Y-axis for BB spectrum plot [dBW]

InfCha = dict([('EbJ0',EbJ0),('Ndly',Ndly)])
InfDs = dict([('Xc',Xc),('Rc',Rc)])
InfSw = dict([('SwVal',SwVal),('SwIdx',SwIdx)])
InfRcc = dict([('osf',osf),('span',span),('beta',beta)])



### FUNCTIONS ###

"""
" Function to convert and append Sync Word to the Tx bit stream.
"""
def AppendSw( InfSw, InBits ) :
    SwInt = int.from_bytes(InfSw['SwVal'],byteorder='big')                      # Convert SW from bytes to single integer value
    SwBits = dec2bin(SwInt,(8*len(InfSw['SwVal'])))                             # Convert SW from integer to bits
    OutBits = concatenate(( InBits[0:InfSw['SwIdx']],
        list(map(int,SwBits)),InBits[InfSw['SwIdx']:]))                         # Append SW bits at the beginning
    return OutBits.astype(int)


"""
" Function for applying Direct-Sequence Spread Spectrum on the input bitstream on TX side.
"""
def SprDS_TX( InBits, Xc, LenPr ) :
    SeqPn = [randint(0,1) for j in range(LenPr)]                                # Retrieve pseudo-random sequence
    InLen = len(InBits)
    OutLen = Xc*InLen
    OutBits = zeros(OutLen,dtype=int)
    for j in range(OutLen) :
        InIdx = int(j/Xc)
        ChIdx = j%len(SeqPn)
        OutBits[j] = InBits[InIdx]^SeqPn[ChIdx]                                 # Apply XOR operation
    return OutBits, SeqPn


"""
" Function for de-applying Direct-Sequence Spread Spectrum on the input bitstream on RX side.
"""
def SprDS_RX( InBits, Xc, PrSeq ) :
    InLen = len(InBits)
    OutLen = int(InLen/Xc)
    OutBits = zeros(OutLen,dtype=int)
    Sum = 0
    for j in range(InLen) :
        ChIdx = j%len(PrSeq)
        Sum = Sum+(InBits[j]^PrSeq[ChIdx])
        if (j%Xc) == Xc-1 :
            if Sum > Xc-Sum :                                                   # Apply maximum likelihood criteria
                OutBits[int(j/Xc)] = 1
            else :
                OutBits[int(j/Xc)] = 0
            Sum = 0
    return OutBits


"""
" Function for getting the power spectrum of the input waveform.
"""
def GetSpect( Sgn, Fs ) :
    Ns = len(Sgn)                                                               # Length (in samples) of the input waveform
    dF = Fs/Ns                                                                  # Discretization step for frequency axis
    CpxSpect = [i/Ns for i in fftshift(fft(Sgn))]                               # Complex spectrum
    PwrSpect = zeros(len(CpxSpect),dtype=float)
    for j in range(len(CpxSpect)) :
        if abs(CpxSpect[j]) == 0 :
            CpxSpect[j] = 1e-20
        PwrSpect[j] = 20*(log10(abs(CpxSpect[j]))).real                         # Power spectrum (in dBW)
    OvPwrF = 10*log10(sum([(abs(CpxSpect[j]))**2
        for j in range(len(CpxSpect))]))                                        # Overall signal power estimated in frequency [dBW] (NB: do NOT multiply by dF, that's wrong for this descrete representation!)                                         # Overall signal power [dBW]
    FreqAx = [(-Fs/2+i*dF) for i in range(len(CpxSpect))]                       # Frequency axis for spectrum plot
    # SumT = 0                                                                        
    # for i in range(len(Sgn)) :
    #     SumT += abs(Sgn[i])**2                                                  # use RMS formula to estimate Vrms (simplified since P = Vrms^2/R, with unitary-R assumed)
    # OvPwrT = (10*log10(SumT/len(Sgn))).real
    # print('>> OvPwrT = '+str(round(OvPwrT,2))+' dBW')                           # Overall power estimated in time [dBW] (NB: shall match "OvPwrF")
    return FreqAx, PwrSpect, OvPwrF.real


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
    return Taps


"""
" Function for performing finite impulse response (FIR) filtering according
" to the specified taps on the input sample stream.
"""
def FirFilter( InSamps, Taps ) :
    Ntaps = len(Taps)
    FirDelay = int((Ntaps-1)/2)
    SyncStReg = zeros(Ntaps-1,dtype=complex)
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
                OutValue += Taps[j]*SyncStReg[j-1]
            OutSamps[i-FirDelay] = OutValue
        for j in range(Ntaps-2,0,-1) :
            SyncStReg[j] =  SyncStReg[j-1]
        SyncStReg[0] = InValue
    return OutSamps[:-FirDelay]


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
" Function to downsample input complex stream by a specific factor.
"""
def Downsample( InVect, sps ):
    LenOut = int(len(InVect)/sps)
    OutVect = zeros(LenOut,dtype=complex)
    for i in range(LenOut) :
        OutVect[i] = InVect[i*sps]
    return OutVect


"""
" Function for filtering the input signal by means of SRRC taps and
" adding/removing proper delay samples.
"""
def RccFilter( InVect, InfRcc, rtx ) :
    sps = InfRcc['osf']
    span = InfRcc['span']
    beta = InfRcc['beta']
    LenIn = len(InVect)
    RccTaps = GetSrrcTaps(beta,span,sps)                                        # Retrieve SRCC filter taps
    RccDelay = int(span*sps/2)
    if rtx == 'TX' :
        TmpVect = Upsample(InVect,sps)                                          # Upsample input vector
        OutVect = FirFilter(TmpVect,RccTaps)
    else :                                                                      # 'RX' case
        OutVect = FirFilter(InVect,RccTaps)                                     # do not apply upsampling in RX
    return OutVect


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
def Mapper( InBits, Table, Ndummy, Rs ) :
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
    OutSymbs = append(zeros(Ndummy,dtype=complex),OutSymbs)                     # Append initial dummy symbols
    OutSymbs = append(OutSymbs,zeros(Ndummy,dtype=complex))                     # Append final dummy symbols
    Time = [i/Rs for i in range(len(OutSymbs))]
    return OutSymbs, Time


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
" Function for pulse shaping the input complex symbols into a baseband
" waveform (upsampling + filtering + I/Q phase offset).
"""
def PulseShaper( TxSymbs, InfRcc, Rs) :
    osf = InfRcc['osf']
    Fs = Rs*osf
    Nsymbs = len(TxSymbs)
    Time = [i/Fs for i in range(Nsymbs*osf)]                                    # Time axis for baseband waveform
    TxSgn = RccFilter(TxSymbs,InfRcc,'TX')                                      # Root-raised-cosine filtering
    return TxSgn, Time


"""
" Function for applying jamming power specifying the Eb/J0 parameter. Jamming samples
" are applied estimating the power of the input waveform. [see NOTE#2]
"""
def JamChan( InVect, InfCha, Fs ) :
    EbJ0 = InfCha['EbJ0']
    Ndly = InfCha['Ndly'] 
    SNR = 10**(EbJ0/10.0)*log2(M)/osf                                           # Signal-to-noise ratio (S/J) [lin] (NB: 1/SJR can properly represent the jamming power only if signal has a power of 1 W)
    Pwr = 0                                                                     # Power of the input waveform [dbW]
    for j in range(len(InVect)) :
        Pwr += InVect[j].real**2+InVect[j].imag**2                              # Calculate complex power (assuming calculated for a unitary load resistor)
    Pwr = Pwr/(2*len(InVect))                                                   # Average power (also between real and imaginary vias)
    OutLen = len(InVect)+Ndly                                                   # Calculate output length [Sa]
    Noise = normal(0,sqrt(1/SNR*Pwr),OutLen)+ \
        1j*normal(0,sqrt(1/SNR*Pwr),OutLen)                                     # Get complex jamming samples (specifying mean value and standard deviation)
    OutVect = copy(InVect)
    OutVect = concatenate((zeros(int(Ndly),dtype=complex),OutVect))             # Append delay samples at the beginning
    OutVect = OutVect+Noise                                                     # Sum jamming interference
    Time = [i/Fs for i in range(OutLen)]                                        # Time axis for baseband waveform
    return OutVect, Time


"""
" Function for synchronizing (and estimate the sample delay of) the DSSS-PSK received signal by
" correlating the latter with a replica of the Sync Word (at waveform/sample level).
"""
def SprDS_Sync( RxSgn, SeqPn, PskTable, InfRcc ) :
    # 1. Estimate local copy of DSSS Sync Word #
    SwBits = dec2bin(int.from_bytes(SwVal,byteorder='big'),(8*len(SwVal)))      # Convert SW to bit stream
    DsSwLen = Xc*len(SwBits)                                                    # Calculate SW length after chip upsampling
    DsSwBits = zeros(DsSwLen,dtype=int)
    for j in range(DsSwLen) :                                                   # Apply bit-wise XOR operation with pseudo-random binary sequence
        InIdx = int(j/Xc)
        ChIdx = ((j+Xc*SwIdx))%len(SeqPn)
        DsSwBits[j] = SwBits[InIdx]^SeqPn[ChIdx]                                 
    [SwSy,_] = Mapper(DsSwBits,PskTable,0,Rc)                                   # Apply bit-to-symbol mapping
    [SwSgn,_] = PulseShaper(SwSy,InfRcc,Rc)                                     # Apply SRRC filtering (as on TX side)
    SwSgn = RccFilter(SwSgn,InfRcc,'RX')                                        # Apply SRRC filtering (as on RX side)
    # 2. Estimate expected SW correlation peak (Y-axis) #
    SwCorPeak = 0
    for i in range(len(SwSgn)) :
        SwCorPeak += (SwSgn[i]*conj(SwSgn[i])).real                             # Estimate expected correlation peak by executing the standard correlation formula (imag part is always null due to "conj" operator)
    CorThr = SwCorPeak*(100-CorTlr)/100                                         # Calculate correlation threshold for synchronization
    # 3. Synchronization process #
    WinSz = len(SwSgn)                                                          # Integration window size [Sa] (NB: DO NOT CHANGE, best configuration)
    WinSp = 4*osf                                                               # Integration window moving step [Sa] (e.g. 4*osf means moving by x4 symbols each cycle)
    Ncyc = int(1+floor((len(RxSgn)-WinSz)/WinSp))                               # Number of cycles needed to cover the whole RX signal
    SyncSt = 'SEARCHING'                                                        # Synchronization state
    for j in range(Ncyc):                                                       # Synchronization loop
        CorWin = correlate(RxSgn[j*WinSp:j*WinSp+WinSz],SwSgn,mode='full',
            method='auto').real                                                 # Correlation window at j-th cycle
        if SyncSt == 'SEARCHING' and max(CorWin) > CorThr :                     # Check if the peak within the current window is above the threshold (Y-axis)
            SyncSt = 'LOCKING'
            IdxSp = j                                                           # Save step (aka cycle) index of peak
            IdxSa = argmax(CorWin)                                              # Retrieve sample index of peak within j-th window (X-axis)
            MaxCor = max(CorWin)                                                # Save correlation peak so far (Y-axis)
        elif SyncSt == 'LOCKING' :
            if max(CorWin) > MaxCor :                                           # Check if correlation peak keeps increasing...
                IdxSp = j                                                       # Update step (aka cycle) index of peak
                IdxSa = argmax(CorWin)                                          # Update sample index of peak within j-th window (X-axis)
                MaxCor = max(CorWin)                                            # Update correlation peak so far (Y-axis)
            else :                                                              # When peak starts decreasing stop searching
                SyncSt = 'LOCKED'
                break
    if SyncSt != 'LOCKED' :
        Edly = -1                                                               # In case of no locking return default error value -1
    else :
        Edly = int(IdxSa+IdxSp*WinSp-WinSz-SwIdx*osf*Xc/log2(M)+1)              # Estimate RX signal delay [Sa]
    CorX = correlate(RxSgn,SwSgn,mode='full',method='auto')/SwCorPeak           # Calculate correlation over the entire RxSgn, thus no window used (just for plot/debugging purpose)
    return Edly, CorX



### PROCESSING (BASEBAND ONLY) ###

SrcBits = [randint(0,1) for j in range(Nsbits)]                         # Random info bits generation
TxBits = AppendSw(InfSw,SrcBits)                                        # Append Sync Word
PskTable = GetPskTable(M,PhOfs)                                         # Retrieve PSK constellation table
[TxDsBits,SeqPn] = SprDS_TX(TxBits,Xc,LenPr)                            # Apply DSSS spreading
[TxSy,_] = Mapper(TxDsBits,PskTable,Ndummy,Rc)                          # Bit-to-symbol mapping
[TxSgn,TimeSa] = PulseShaper(TxSy,InfRcc,Rc)                            # Tx baseband waveform after SRRC pulse shaping
[TxFreq,TxSpect,OvTxPwr] = GetSpect(TxSgn,Fs)                           # FFT for evaluating the Tx baseband power spectrum
[ChanSgn,TimeSaD] = JamChan(TxSgn,InfCha,Fs)                            # Apply channel delay and jamming
RxSgn = RccFilter(ChanSgn,InfRcc,'RX')                                  # Rx baseband waveform after matched SRRC filtering
[RxFreq,RxSpect,OvRxPwr] = GetSpect(RxSgn,Fs)                           # FFT for evaluating the Tx baseband power spectrum
[Edly,CorX] = SprDS_Sync(RxSgn,SeqPn,PskTable,InfRcc)                   # Execute DSSS synchronization to estimate channel delay
if Edly != -1 :                                                         # Check synchronization outcome
    RxSy = Downsample(RxSgn[Edly:],osf)                                 # Remove delay and down-sample from samples to symbols
    RxDsBits = Demapper(RxSy[Ndummy:len(RxSy)-Ndummy],PskTable)         # PSK hard demapping
    LenDifC = abs(len(TxDsBits)-len(RxDsBits))                          # Check some bits are missing in RX (due to imperfect sync in case of low Eb/N0)
    NerrC = (TxDsBits[:len(TxDsBits)-LenDifC]!=RxDsBits[:len(
        TxDsBits)-LenDifC]).sum()+LenDifC                               # Check number of corrupted chips
    RxBits = SprDS_RX(RxDsBits,Xc,SeqPn)                                # Apply DSSS de-spreading
    LenDifB = abs(len(TxBits)-len(RxBits))
    NerrB = (TxBits[:len(TxBits)-LenDifC]!=RxBits[:len(
        TxBits)-LenDifC]).sum()+LenDifB                                 # Check number of corrupted bits

    print('\n >> DSSS SYNC IN DELAYED AND JAMMED CHANNEL <<\n')
    print(' * Tx power = '+str(round(OvTxPwr,2))+' dBW ')
    print(' * Rx power = '+str(round(OvRxPwr,2))+' dBW ')
    print(' * Edly = '+str(Edly)+' Sa | Ndly = '+str(Ndly)+' Sa')
    print(' * Number of errors :')
    print('   - '+str(NerrC)+' out of '+str(len(TxDsBits))+' chips')
    print('   - '+str(NerrB)+' out of '+str(len(TxBits))+' bits')

else :
    print('\n >> DSSS SYNC IN DELAYED AND JAMMED CHANNEL <<\n')
    print(' * Sync failed')



### PLOTS ###

Fig_1 = mpl.figure(num='1. DSSS SYNC IN DELAYED AWGN CHANNEL')
Fig_1.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(221)
mpl.plot([i*ScFct for i in TimeSa], TxSgn.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markerfacecolor='r', markersize=2, label=" I")
mpl.plot([i*ScFct for i in TimeSa], TxSgn.imag, color='red', linestyle='-', linewidth=1,
    marker='o', markerfacecolor='r', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('TX WAVEFORMS')
mpl.xlim(0,WaveXlim*ScFct)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(222)
mpl.plot([i*ScFct for i in TimeSaD], ChanSgn.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markerfacecolor='r', markersize=2, label=" I")
mpl.plot([i*ScFct for i in TimeSaD], ChanSgn.imag, color='red', linestyle='-', linewidth=1,
    marker='o', markerfacecolor='r', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('CHANNEL WAVEFORMS')
mpl.xlim(0,WaveXlim*ScFct)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(223)
mpl.plot([i*ScFct for i in TimeSaD], RxSgn.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markerfacecolor='r', markersize=2, label=" I")
mpl.plot([i*ScFct for i in TimeSaD], RxSgn.imag, color='red', linestyle='-', linewidth=1,
    marker='o', markerfacecolor='r', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('RX WAVEFORMS')
mpl.xlim(0,WaveXlim*ScFct)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(224)
mpl.plot(range(len(CorX)),CorX.real, color='darkviolet', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" real")
mpl.plot(range(len(CorX)),CorX.imag, color='darkorange', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" imag")
mpl.xlabel('Sample # [Sa]')
mpl.ylabel('Coefficient')
mpl.title('CORRELATION')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.show(block=False)                                                           # Show plots
mpl.pause(0.001)                                                                # Pause execution for 1 ms
input("\nPress ENTER to exit")                                                  # Ask closing plots on terminal
mpl.close('all')                                                                # Close all plots



### NOTES ###

# 1. The synchronization is executed by searching a known Sync Word sequence (SwVal) in a known position of the
#    packet (SwIdx). Otherwise it would be impossible to estimate the channel delay (Ndly), since the pseudo-random
#    sequence (SeqPn) would be "mixed" with the source/info bits and thus not clearly visible by the receiver.