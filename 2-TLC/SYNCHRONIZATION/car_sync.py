
"""
" Title: CARRIER SYNCHRONIZER
" Author: Filippo Valmori
" Date: 08/12/2022
" Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.10)
"""


### LIBRARIES ###

from numpy import zeros, log2, pi, flipud, append, sin, cos, sqrt, \
    argmin, concatenate, floor, multiply, sign
from numpy.fft import fft, fftshift
from cmath import exp, log10
from random import randint
from numpy.random import normal
import matplotlib.pyplot as mpl
from math import nan, isnan



### PARAMETERS ###

Nbits = 60                                                                      # Number of source bits to be simulated
Rb = 20e3                                                                       # Bit rate [b/s]
M = 4                                                                           # Modulation order
Nprb = 16                                                                       # Preamble length [Sy]
EbN0 = 15                                                                       # Energy-per-bit-to-noise-power-spectral-density ratio [dB]
Ndly = 127                                                                       # Channel sample delay [Sa]
PhDly = 66.0                                                                    # Channel phase shift [deg]
osf = 8                                                                         # Baseband oversampling factor (and sps factor for RCC filter design as well)
span = 8                                                                        # Span of RRC filter [S]
beta = 0.5                                                                      # Roll-off factor of RRC filter



### CONSTANTS ###

Ndummy = 0                                                                      # Number of dummy zero-symbols to be appended at the beginning and end of Tx stream [S]
Rs = Rb/log2(M)                                                                 # Symbol rate [S/s]
PhOfs = (1-M)*pi/M                                                              # PSK constellation phase offset [rad]
Fs = osf*Rs                                                                     # Sample rate [Sa/s]
ScFct = 1e3                                                                     # Scaling factor for graphs (e.g. 1e3 corresponds to ms and kHz)
InfCha = dict([('EbN0',EbN0),('Ndly',Ndly),('PhDly',PhDly)])
InfRcc = dict([('osf',osf),('span',span),('beta',beta)])



### FUNCTIONS ###

"""
" Function to append preamble symbols to Tx stream.
"""
def AppendPrb( InSy, Nprb ) :
    if Nprb%4 != 0 :
        raise Exception("Nprb shall be a multiple of 4!")
    Val = 1/sqrt(2)
    PrSy = int(Nprb/4)*[Val+1j*Val,-Val+1j*Val,Val-1j*Val,-Val-1j*Val]
    OutSy = concatenate((PrSy,InSy))                                            # Append preamble symbols at the beginning
    return OutSy


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
    return OutSymbs


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
    FreqAx = [(-Fs/2+i*dF) for i in range(len(CpxSpect))]                       # Frequency axis for spectrum plot
    return FreqAx, PwrSpect


"""
" Function for applying AWGN specifying the Eb/N0 parameter. Noise samples are
" applied estimating the power of the input waveform.
"""
def ChanAwgnDly( InSgn, InfCha ) :
    PhDly = InfCha['PhDly']
    EbN0 = InfCha['EbN0']
    Ndly = InfCha['Ndly']
    SNR = 10**(EbN0/10.0)*log2(M)/osf                                           # Signal-to-noise ratio (S/N) [lin]
    Pwr = 0                                                                     # Power of the input waveform [dbW]
    for j in range(len(InSgn)) :
        Pwr += InSgn[j].real**2+InSgn[j].imag**2                                # Calculate complex power (assuming calculated for a unitary load resistor)
    Pwr = Pwr/2/len(InSgn)                                                      # Average power (also between real and imaginary vias)
    Noise = normal(0,sqrt(1/SNR*Pwr),len(InSgn)+Ndly)+ \
        1j*normal(0,sqrt(1/SNR*Pwr),len(InSgn)+Ndly)                            # Get complex AWGN samples (specifying mean value and standard deviation)
    alpha = 2*pi*PhDly/360                                                      # Covert channel phase shift from [deg] to [rad]
    OutSgn = multiply(InSgn.real,cos(alpha))+multiply(InSgn.imag,sin(alpha))+ \
        1j*(multiply(InSgn.real,-sin(alpha))+multiply(InSgn.imag,cos(alpha)))
    OutSgn = concatenate((zeros(Ndly,dtype=complex),OutSgn))
    OutSgn += Noise                                                             # Add AWGN noise
    Time = [i/Fs for i in range(len(OutSgn))]
    return OutSgn, Time


"""
" Function to apply carrier synchronization to input signal and estimate its phase delay.
"""
def CarSync( RxSgn ) :
    # PARAMETERS #
    StepC = 5*(2*pi/360)                                                        # Coarse phase shift step increment (fixed) [rad]
    StepF = 1*(2*pi/360)                                                        # Fine phase shift step increment [rad]
    ThrPwrC = 37                                                                # Course sync power threshold [dBW]
    WinSz = 4*osf                                                               # Observation window size [Sa]
    WinSp = 1                                                                   # Window update step (number of new RxSgn samples into window buffer per cycle) [Sa]
    TlrPh = 8*(2*pi/360)                                                        # Phase repetition tolerance among consecutive peaks detected [rad]
    ThrCntF = int(3*(StepC/StepF))                                              # Fine sync range (to stop CntF interations) [DO NOT CHANGE]
    # INITIALIZATION #
    SyncSt = 'COARSE'                                                           # Carrier synchronizer state
    Npkd = 0                                                                    # Number of peaks detected
    PhSh = 0                                                                    # Phase shift currently under test [rad]
    ePhSh = nan                                                                 # Phase delay corresponding to current spectrum peak estimated [rad]
    Ncyc = int(1+floor((len(RxSgn)-WinSz)/WinSp))                               # Number of cycle to cover the entire input signal
    FrPk_0 = int(WinSz/2)+1                                                     # Inner frequecy index for I/Q spectrum peaks comparison (Rs/4)
    FrPk_1 = int(WinSz/2)+2                                                     # Outer frequecy index for I/Q spectrum peaks comparison (Rs/2)
    Mlkl = zeros((2,Ncyc),dtype=float)                                          # Likelihood matrix (X = phase shifts tested [deg], Y = spectrum difference estimated [dBW]) [DEBUG ONLY]
    PkBuf = zeros(10,dtype=float)                                               # Phase shift correspond to detected peaks peak vector (make circular index with NPkd)
    # PROCESSING #
    for j in range(Ncyc):
        #StepC = randint(1,10)*(2*pi/360)                                        # Coarse phase shift step increment (random, here between 1 and 10 deg) [rad] (NB: uncommenting this line makes the above fixed definition of StepC unused!)
        ScSgn = RxSgn[j*WinSp:j*WinSp+WinSz]                                    # Update window samples
        RecSgn = multiply(ScSgn.real,cos(PhSh))-multiply(ScSgn.imag,sin(PhSh))+\
            1j*(multiply(ScSgn.real,sin(PhSh))+multiply(ScSgn.imag,cos(PhSh)))  # Compensate window-signal with current phase shift
        [AxFreq,ScSpecI,] = GetSpect(RecSgn.real,Fs)                            # Get new I window-signal spectrum (expected to oscillate faster at Rs/2)
        [_,ScSpecQ,] = GetSpect(RecSgn.imag,Fs)                                 # Get new Q window-signal spectrum (expected to oscillate slower at Rs/4)
        F0_I = ScSpecI[FrPk_0]                                                  # I-spectrum amplitude at Rs/4 (inner frequency)
        F0_Q = ScSpecQ[FrPk_0]                                                  # Q-spectrum amplitude at Rs/4 (inner frequency)
        F1_I = ScSpecI[FrPk_1]                                                  # I-spectrum amplitude at Rs/2 (outer frequency)
        F1_Q = ScSpecQ[FrPk_1]                                                  # Q-spectrum amplitude at Rs/2 (outer frequency)
        CycDif = (F0_Q-F0_I)+(F1_I-F1_Q)                                        # Calculate spectrum I-Q difference (I+Q together) [dBW]
        Mlkl[0,j] = PhSh*360/(2*pi)                                             # Save j-th phase shift [DEBUG ONLY]
        Mlkl[1,j] = CycDif                                                      # Save j-th spectrum difference [DEBUG ONLY]
        # COARSE SYNC #
        if SyncSt == 'COARSE' :
            if (CycDif > ThrPwrC) or (CycDif < -ThrPwrC) :                      
                if sign(CycDif-ThrPwrC) == 1 :                                  # Case corresponding to 0-180 deg detection, i.e. positive peak (CycDif > ThrPwrC)
                    LastDec = 'POS'                                             # Save detected peak sign for next FINE SYNC step
                    ePhSh = PhSh%(2*pi)                                         # Save phase shift corresponding to coarse positive peak detected
                    #print('C+ '+str(round(PhSh*360/(2*pi),1)))
                else :                                                          # Case corresponding to 90-270 deg detection, i.e. negative peak (CycDif < -ThrPwrC)
                    LastDec = 'NEG'
                    ePhSh = (PhSh+pi/2)%(2*pi)                                  # Save phase shift corresponding to coarse negative peak detected (and already scaled for the 90 deg error!)
                    #print('C- '+str(round(PhSh*360/(2*pi),1)))
                MaxDif = CycDif                                                 # Save coarse spectum difference [dBW]
                SyncSt = 'FINE'                                                 # Move to FINE SYNC state to exactly locate the peak
                PhSh -= (StepC-StepF)                                           # Move back on phase axis to start fine sync (related to ThrCntF) [DO NOT CHANGE]
                CntF = 0                                                        # Initialize/reset fine sync counter
            else :
                PhSh += StepC                                                   # If no peak detected, increase phase shift by course step
        # FINE SYNC #
        elif SyncSt == 'FINE' :
            if CntF < ThrCntF :                                                 # If fine sync still ongoing...
                if (LastDec == 'POS') and (CycDif > MaxDif) :                   # Check condition to refine positive peak detected
                    MaxDif = CycDif
                    ePhSh = PhSh%(2*pi)                                         # Update phase shift corresponding to coarse peak refinemente
                elif (LastDec == 'NEG') and (CycDif < MaxDif) :                 # Check condition to refine negative peak detected
                    MaxDif = CycDif
                    ePhSh = (PhSh+pi/2)%(2*pi)
                PhSh += StepF                                                   # Increase phase shift by fine step
                CntF += 1                                                       # Increase fine sync counter
            else :                                                              # If fine since on current peak is over...
                #print('Fx '+str(round(ePhSh*360/(2*pi),1)))
                PkBuf[Npkd] = ePhSh                                             # Store the refined peak into buffer
                ePhSh = nan                                                     # Reset phase delay corresponding to latest peak detected
                Npkd += 1                                                       # Increase detectedpeaks counter
                if Npkd > 1 :                                                   # If at least x2 peaks have been already detected...
                    Lock = False                                                # Carrier sync lock flag
                    for i in range(Npkd-1) :
                        AbsDiff = abs(PkBuf[Npkd-1]-PkBuf[i])                   # Check the phase distance between latest peak detected and all others stored before
                        if AbsDiff < TlrPh :                                    # If distance between latest peak and i-th is 360 deg (+/- tolerance)...
                            ePhSh = (PkBuf[Npkd-1]+PkBuf[i])/2                  # Calculate final phase delay estimate (as the mean between latest and i-th peaks)
                            Lock = True                                         # Assert locking condition
                            #print(' -> '+str(round(PkBuf[Npkd-1]*360/(2*pi),1))+' & '+str(round(PkBuf[i]*360/(2*pi),1))+' | '+str(Npkd))
                            break
                        elif (AbsDiff > pi-TlrPh) and (AbsDiff < pi+TlrPh) :    # If distance between latest peak and i-th is 180 deg (+/- tolerance)...
                            ePhSh = (PkBuf[Npkd-1]+PkBuf[i]-pi)/2
                            #print(' --> '+str(round(PkBuf[Npkd-1]*360/(2*pi),1))+' & '+str(round(PkBuf[i]*360/(2*pi),1))+' | '+str(Npkd))
                            Lock = True
                            break
                    if Lock == True :
                        break                                                   # Exit since sync successfully completed
                PhSh += StepC                                                   # If no locking condition not fulfilled yet, increase phase shift by course step
                SyncSt = 'COARSE'                                               # If no locking condition not fulfilled yet, move back to COARSE SYNC state to find new peaks

        else :
            raise Exception("Unknown sync state!")
        """
        mpl.figure(num='DEBUG')
        mpl.plot([i/ScFct for i in AxFreq], ScSpecI, color='red', linestyle='-', linewidth=1, 
            marker='o', markerfacecolor='r', markersize=2)
        mpl.plot([i/ScFct for i in AxFreq], ScSpecQ, color='blue', linestyle='-', linewidth=1, 
            marker='o', markerfacecolor='r', markersize=2)
        mpl.xlabel('Frequency [kHz]') 
        mpl.title('PhSh = '+str(round(PhSh*360/(2*pi),1))+' deg')
        mpl.grid(color='silver', linestyle='--', linewidth=1)
        mpl.show(block=False)
        mpl.pause(0.001)
        xx = input("\n>> Type 'c' to exit or ENTER to continue : ")
        if xx == 'c' :
            exit()
        else :
            mpl.close('all')
        """
    return ePhSh, Mlkl[:,:j]



### PROCESSING (BASEBAND ONLY) ###

TxBits = [randint(0,1) for j in range(Nbits)]                                   # Random info bits generation
PskTable = GetPskTable(M,PhOfs)                                                 # Retrieve PSK constellation table
TxSy = Mapper(TxBits,PskTable,Ndummy,Rs)                                        # Bit-to-symbol mapping
TxSyPrb = AppendPrb(TxSy,Nprb)                                                  # Append preamble
[TxSgn,TimeTx] = PulseShaper(TxSyPrb,InfRcc,Rs)                                 # Tx SRRC pulse shaping
[ChanSgn,TimeRx] = ChanAwgnDly(TxSgn,InfCha)                                    # Apply AWGN channel with phase and sample delay
RxSgn = RccFilter(ChanSgn,InfRcc,'RX')                                          # Rx SRRC filtering
[ePhDlyR,Mlkl] = CarSync(RxSgn)                                                        # Estimate phase offset [rad] after carrier synchronization
if isnan(ePhDlyR) :
    print(' >> Synchronization failed!')
    exit()
else :
    ePhlyD = round(ePhDlyR*360/(2*pi),1)
    print(' >> Dedected phase shift = '+str(ePhlyD)+' ('+str(round((ePhlyD+180)%360,1))+') deg')
    TxSgn = RccFilter(TxSgn,InfRcc,'RX')                                        # just to make the plot comparison between TX and RX easier [NOT ESSENTIAL]
    RecSgn = multiply(RxSgn.real,cos(ePhDlyR))-multiply(RxSgn.imag,sin(ePhDlyR)) \
        +1j*(multiply(RxSgn.real,sin(ePhDlyR))+multiply(RxSgn.imag,cos(ePhDlyR))) # Recover Rx signal



### RESULTS ###

Fig_0 = mpl.figure(num='CARRIER SYNCHRONIZER')
Fig_0.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(221)
mpl.plot([i*ScFct for i in TimeTx], TxSgn.real, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label=" I")
mpl.plot([i*ScFct for i in TimeTx], TxSgn.imag, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label=" Q")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('TX-REFERENCE')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(222)
mpl.plot([i*ScFct for i in TimeRx], RxSgn.real, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label=" I")
mpl.plot([i*ScFct for i in TimeRx], RxSgn.imag, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label=" Q")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('CHANNEL ('+str(PhDly)+' deg)')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(223)
mpl.plot([i*ScFct for i in TimeRx], RecSgn.real, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label=" I")
mpl.plot([i*ScFct for i in TimeRx], RecSgn.imag, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label=" Q")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('RX-RECOVERED ('+str(ePhlyD)+' deg)')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(224)
mpl.plot(Mlkl[0,:], Mlkl[1,:], color='limegreen', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2,)
mpl.xlabel('Phase shift [deg]') 
mpl.ylabel('Spectrum difference [dBW]')
mpl.title('FREQUENCY LIKELIHOOD')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.show(block=False)                                                           # Show plots
mpl.pause(0.001)                                                                # Pause execution for 1 ms
input("\nPress ENTER to exit")                                                  # Ask closing plots on terminal
mpl.close('all')                                                                # Close all plots



### NOTES ###

# 0. The carrier sync (CS) algorithm is based on the following assumptions :
#    - PSK modulation (regardless of M);
#    - Complex preamble with I-part oscillating at maximum frequency (Rs/2, aka outer frequency) and Q-part
#      at half frequency (Rs/4, aka inner frequency);
#    - Channel phase-shift model (simulating carrier phase mismatch between TX and RX) is specified in
#      "cs_formulas.png".

# 1. CS algorithm operation :
#    - Each cycle the window is updated with new samples of the input signal, the phase shift (PhSh) updated
#      by coarse step (wide to make it fast), and the windowed-signal scaled by the current value of
#      the latter;
#    - Then I/Q spectra of the windowed signal are calculated to check their values at Rs/2 and Rs/4. In fact,
#      when signal is in lock I(Rs/2) has a maximum and Q(R/2) a minimum, whereas I(Rs/4) has a minimum and
#      Q(R/4) a maximum, generating a "peak" (see Mlkl plot);
#    - When a peak is detected in COARSE state (at PhSh'), the algorithm moves to FINE state, PhSh is decreased
#      and then increased each cycle by fine step (small to make it accurate) to cover the phase range from
#      PhSh'-StepC to PhSh'+2*StepC (through CntF) and refine the estimate;
#    - Then the algorithm moves back to COARSE state to detect other peaks;
#    - Whenever a new peak is detected, the phase distance between the latter and all other peaks previously
#      detected is checked, and if there's one at about 360 or 180 deg distant (plus tolerance) the lock condition
#      is fulfilled. Thus, two successive (but not necessarily consecutive) peaks shall be detected to complete
#      the sync procedure (making the algorithm more robust against noise).
#    - In COARSE state also the inverse (aka negative) condition is checked, which corresponds to the a 90 deg
#      peak (and if detected is automatically converted to the positive phase by adding 90 deg to the estimate).

# 2. CS algorithm parameters :
#    - StepC = to be chosen big enough to make algorithm faster, but not too much otherwise peaks could be not detected;
#              moreover, this can be set as fixed or random;
#    - WinSz = to be not smaller than 4*osf, since the preamble period is x4 symbols;
#    - WinSp = to be kept low (e.g. 1 or 2 deg);

# 3. Test results :
#    - The algorithm proves to work correctly for EBN0 down to 7-10 dB.
#    - For lower EbN0 increase Nprb and decrease ThrPwrC.

# 4. Extra :
#    - The I-Q preamble waveform is always the same reagardless of M, thus always a sequence of +/- 1/sqrt(2) symbols.
#    - The algorithm experiences a possible phase slip of 180 deg (regardless of M) which shall be check during the
#      successive sync word detection phase.
#    - In terms of Rx waveform recovery an error of +/- 5 deg is actually not so damaging (see plots).
#    - While debugging with plot sequence inside the CarSync function set Ndly=0 for simplicity's sake (in order not
#      to wait too long for the Rx waveform to come).

# 5. @todo :
#    - For a more efficient implementation the FFT should be calculated only on the x2 frequencies of interest (i.e.
#      Rs/4 and Rs/2), not on the overall windowed-signal.
#    - Add sync word appending/detection and comparison between Tx and Rx bits for BER estimate.
