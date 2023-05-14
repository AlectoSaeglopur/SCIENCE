
"""
" Title: DIGITAL PHASE MODULATORS
" Author: Filippo Valmori
" Date: 15/06/2022
" Reference: [1] https://en.wikipedia.org/wiki/Phase-shift_keying
"""

### LIBRARIES ###

from numpy import zeros, log2, flipud, linspace, multiply, \
    pi, sin, cos, repeat, float32, copy
from numpy.random import normal
from numpy.fft import fft, fftshift
from random import randint
from math import floor, log, log10, exp, sqrt
from scipy.interpolate import interp1d
from time import time
import matplotlib.pyplot as mpl



## PARAMETERS AND CONSTANTS ###

Nbits = 240                                             # Number of bits to be simulated
Rb = 10e3                                               # Bit rate [b/s]
Fc = 1e6                                                # Carrier frequency [Hz]
M = 4                                                   # Modulation order
EbN0 = 10                                               # Energy-per-bit-to-noise-power-spectral-density ratio (Eb/N0) [dB]
osfBB = 8                                               # BB oversampling factor (and also sps factor for RCC filter design)
osfRF = 12                                              # RF oversampling factor (referred to Fc)
span = 8                                                # Span for RRC filter representation [S]
beta = 0.5                                              # Roll-off factor for RRC filter representation
InterpMeth = 'LIN'                                      # Interpolating method (LIN or CUB) to pass from BB to RF signal
ScFct = 1e3                                             # Baseband scaling factor (e.g. 1e3 means ms/kHz)
TextX = -0.20                                           # Shift on X-axis for constellation plot text
TextY = 0.20                                            # Shift on Y-axis for constellation plot text
WaveBBxlim = 10e-3                                      # Limit on X-axis for BB and RF waveform plot [s]
SpectBBylim = -100                                      # Limit on Y-axis for BB spectrum plot [dBW]
SpectRFylim = -150                                      # Limit on Y-axis for RF spectrum plot [dBW]

Rs = Rb/log2(M)                                         # Symbol rate [S/s]
ConstOfs = (1-M)*pi/M                                   # Constellation phase offset [rad]
FsBB = osfBB*Rs                                         # Baseband sample rate [Sa/s]
TsBB = 1/FsBB                                           # Baseband sample period [s]
FsRF = FsBB*round(osfRF*Fc/FsBB)                        # RF sample rate [Sa/s]
osfRF = FsRF/Rs                                         # Update RF oversampling factor (referred to Rs now)



## FUNCTIONS ###

"""
" Function for converting an input binary array into the corresponding decimal
" value.
"""
def bi2de( InBin ) :
    OutDe = str(InBin).replace(' ','').replace(',','')                          # Convert array into a string
    OutDe = OutDe.replace(']','').replace('[','')                               # Remove useless characters from string
    return int(OutDe,2)


"""
" Function for generating random bits and mapping them into phase symbols as
" a function of the selected modulation order and according to Gray coding
"""
def GetSymbs( Nbits, M, PhOfs ) :
    # rnd.seed(76)                                                              # Set specific random seed
    TxBits = [randint(0,1) for j in range(Nbits)]                               # Random source bits generation
    L = int(log2(M))                                                            # Number of bits per symbol
    GrayMtx = zeros((M,L),dtype=int)
    LastCell = [[0],[1]]
    GrayMtx[0:2,-1:] = LastCell                                                 # Gray matrix
    for j in range(1,L) :
        GrayMtx[2**j:2**(j+1),-j:] = flipud(LastCell)
        GrayMtx[2**j:2**(j+1),-j-1] = 1
        LastCell = GrayMtx[0:2**(j+1),-j-1:]
    GrayMap = zeros(M,dtype=int)                                                # Gray map
    for i in range(M) :
        j = 0
        while j < M :
            if j == bi2de(GrayMtx[i,:]) :
                GrayMap[i] = j
                break
            else :
                j += 1
    Nsymb = int(Nbits/L)                                                        # Number of symbols [S]
    OutSymbs = zeros(Nsymb,dtype=complex)                                       # Symbol stream
    AngStep = 2*pi/M                                                            # Angle distance between two consecutive points in constellation
    Angles = PhOfs+multiply(range(M),AngStep)
    Const = cos(Angles)+1j*sin(Angles)                                          # Complex PSK constellation   
    Mapping = [Const,GrayMtx]
    for i in range(Nsymb) :
        OutSymbs[i] = Const[GrayMap[bi2de(TxBits[i*L:(i+1)*L])]]                # Bits-to-symbol mapping
    # Npad = 3                                                                    # Block for padding N zero-symbols at the beginning and end of stream
    # OutSymbs = concatenate((zeros(Npad,dtype=complex),OutSymbs,zeros(Npad,dtype=complex)))
    # Nsymb = len(OutSymbs)
    return OutSymbs, Nsymb, Mapping


"""
" Function for getting the power spectrum of the input waveform.
"""
def GetSpect( Sgn, Fs ) :
    Ns = len(Sgn)                                       # Length (in samples) of the input waveform
    dF = Fs/Ns                                          # Discretization step for frequency axis
    CpxSpect = [i/Ns for i in fftshift(fft(Sgn))]       # Complex spectrum
    PwrSpect = zeros(len(CpxSpect),dtype=float)
    for j in range(len(CpxSpect)) :
        if abs(CpxSpect[j]) == 0 :
            CpxSpect[j] = 1e-20
        PwrSpect[j] = 20*(log10(abs(CpxSpect[j]))).real                             # Power spectrum (in dBW)
    # OvPwrF = 10*log10(sum([(abs(CpxSpect[j]))**2 for j in range(len(CpxSpect))]))   # Overall signal power estimated in frequency [dBW] (NB: do NOT multiply by dF, that's wrong for this descrete representation!)                                         # Overall signal power [dBW]
    FreqAx = [(-Fs/2+i*dF) for i in range(len(CpxSpect))]                           # Frequency axis for spectrum plot
    # SumT = 0                                                                        
    # for i in range(len(Sgn)) :
    #     SumT += abs(Sgn[i])**2                                                      # use RMS formula to estimate Vrms (simplified since P = Vrms^2/R, with unitary-R assumed)
    # OvPwrT = (10*log10(SumT/len(Sgn))).real
    # print('>> OvPwrT = '+str(round(OvPwrT,2))+' dBW')                               # Overall power estimated in time [dBW] (NB: shall match "OvPwrF")
    return FreqAx, PwrSpect


"""
" Function for interpolating (with linear or cubic method) the baseband signal
" to get the bandpass equivalent.
"""
def InterpRF( TimeBB, SgnBB, FsRF, Mth ) :
    # T1 = time()
    if Mth == 'LIN' :
        Freal = interp1d(TimeBB,SgnBB.real,kind='linear')                       # In-phase part interpolating function
        Fimag = interp1d(TimeBB,SgnBB.imag,kind='linear')                       # Quadrature part interpolating function
        TimeRF = linspace(0,TimeBB[-1],floor(TimeBB[-1]*FsRF))                  # Time axis for RF waveform
        SgnRF = [x-y for x,y in zip(multiply(Freal(TimeRF),                     # Radio-frequency signal
            cos([i*2*pi*Fc for i in TimeRF])), multiply(
            Fimag(TimeRF),sin([i*2*pi*Fc for i in TimeRF])))]
    elif Mth == 'CUB' :
        Freal = interp1d(TimeBB,SgnBB.real,kind='cubic')
        Fimag = interp1d(TimeBB,SgnBB.imag,kind='cubic')
        TimeRF = linspace(0,TimeBB[-1],floor(TimeBB[-1]*FsRF))                  # Time axis for RF waveform 
        SgnRF = [x-y for x,y in zip(multiply(Freal(TimeRF),                     # Radio-frequency signal
            cos([i*2*pi*Fc for i in TimeRF])),multiply(
            Fimag(TimeRF),sin([i*2*pi*Fc for i in TimeRF])))]
    elif Mth == 'NUL' :
        TimeRF = [0,1]
        SgnRF = [0,1]
    # T2 = time()
    # print(T2/T1)                                                              # Estimate elapsed time [s] 
    return TimeRF, SgnRF


"""
" Function to retrieve SRRC filter taps for specific design parameters.
"""
def GetSrrcTaps( beta, span, sps ) :
    Ntaps = sps*span+1
    Taps = zeros(Ntaps,dtype=float)
    epsilon = 1e-30
    ZeroVal = 1/(2*pi*sps)*(pi*(beta+1)*sin(pi*(beta+1)/(4*beta))-
        4*beta*sin(pi*(beta-1)/(4*beta))+pi*(beta-1)*cos(pi*(beta-1)/(4*beta)))
    for j in range(Ntaps) :
        if j == int(sps*span/2) :
            Taps[j] = -1/(pi*sps)*(pi*(beta-1)-4*beta)
        else :
            Time = (j-sps*span/2)/sps
            if abs(abs(4*beta*Time)-1) < epsilon :
                Taps[j] = ZeroVal
            else :
                Taps[j] = -4*beta/sps*(cos((1+beta)*pi*Time)+sin((1-beta)*pi*Time)/
                    (4*beta*Time))/(pi*((4*beta*Time)**2-1))
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
" Function to upsample input stream with zero-repetitions.
"""
def Upsample( InVect, sps ) :
    LenIn = len(InVect)
    OutVect = zeros(sps*LenIn,dtype=complex)
    for i in range(LenIn) :
        OutVect[i*sps] = InVect[i]                                              # Upsample input vector
    return OutVect


"""
" Function for applying root-raised-cosine filtering on the input symbol stream.
"""
def RccFilter( InVect, beta, span, sps ) :
    RccTaps = GetSrrcTaps(beta,span,sps)                                        # Retrieve SRCC filter taps
    OutVect = FirFilter(InVect,RccTaps)                                         # Apply SRRC filtering
    # RccDelay = int(span*sps/2)
    # OutVect = OutVect[RccDelay:]
    return OutVect


"""
" Function for applying AWGN specifying the Eb/N0 parameter. Noise samples are
" applied estimating the power of the input waveform.
"""
def AwgnChan( InVect, EbN0 ) :
    SNR = 10**(EbN0/10.0)*log2(M)/osfBB                                         # Signal-to-noise ratio (S/N) [lin] (NB: 1/SNR can properly represent the noise power only if signal has a power of 1 W)
    Pwr = 0                                                                     # Power of the input waveform [dbW]
    for j in range(len(InVect)) :
        Pwr += InVect[j].real**2+InVect[j].imag**2                              # Calculate complex power (assuming calculated for a unitary load resistor)
    Pwr = Pwr/2/len(InVect)                                                     # Average power (also between real and imaginary vias)
    Noise = normal(0,sqrt(1/SNR*Pwr),len(InVect))+ \
        1j*normal(0,sqrt(1/SNR*Pwr),len(InVect))                                # Get complex AWGN samples (specifying mean value and standard deviation)
    OutVect = copy(InVect)
    OutVect += Noise                                                            # Add noise
    return OutVect



### 1. PROCESSING WITHOUT FILTERING (TX ONLY) ###

TxSymbs,Nsymbs,Map = GetSymbs(Nbits,M,ConstOfs)                                 # Generation of random Tx symbols and mapping constellation
PskWaveI = [i for i in list(repeat(TxSymbs.real,osfBB))]                        # In-phase baseband signal (after symbol-to-samples oversampling)
PskWaveQ = [i for i in list(repeat(TxSymbs.imag,osfBB))]                        # Quadrature baseband signal (after symbol-to-samples oversampling)
TimeBB = [i*TsBB for i in range(Nsymbs*osfBB)]                                  # Time axis for baseband waveform
PskSgnBB = PskWaveI+multiply(1j,PskWaveQ)
[PskFreqBB,PskSpectBB] = GetSpect(PskSgnBB,FsBB)                                # FSK baseband signal power spectrum 
[TimeRF,PskSgnRF] = InterpRF(TimeBB,PskSgnBB,FsRF,InterpMeth)                   # FSK radio-frequency signal
[PskFreqRF,PskSpectRF] = GetSpect(PskSgnRF,FsRF)                                # FSK radio-frequency signal power spectrum



### 2. PROCESSING WITH SRRC FILTERING (TX+RX) ###

TxPskRccSgnBB = RccFilter(Upsample(TxSymbs,osfBB),beta,span,osfBB)              # Root-raised-cosine filtering
[TxPskRccFreqBB,TxPskRccSpectBB] = GetSpect(TxPskRccSgnBB,FsBB);                # Complex baseband spectrum
[TimeRccRF,TxPskRccSgnRF] = InterpRF(TimeBB,TxPskRccSgnBB,FsRF,InterpMeth)      # Radio-frequency signal
[TxPskRccFreqRF,TxPskRccSpectRF] = GetSpect(TxPskRccSgnRF,FsRF);                # Complex bandpass spectrum
ChanSgnBB = AwgnChan(TxPskRccSgnBB,EbN0)                                        # Noisy baseband signal after channel
RxPskRccSgnBB = RccFilter(ChanSgnBB,beta,span,osfBB);                           # Rx baseband signal after matched SRRC filtering
TimeSy = [i*(1/Rs) for i in range(Nsymbs)]                                      # Time axis for symbol stream



### PLOTS ###

Fig_1 = mpl.figure(num='PSK #1 - TX WITHOUT FILTERING')
Fig_1.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(221)
mpl.scatter(Map[0].real, Map[0].imag, color='deepskyblue', marker='o',s=30, label="In-phase")
for j in range(M) :
    mpl.text((Map[0].real)[j]+TextX,(Map[0].imag)[j]+TextY,str(Map[1][j]))
mpl.xlabel('In-phase') 
mpl.ylabel('Quadrature')
mpl.title('CONSTELLATION')
mpl.xlim(-1.5, 1.5)
mpl.ylim(-1.5, 1.5)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(222)
mpl.plot([i*ScFct for i in TimeRF], PskSgnRF, color='orange', linestyle='-.', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="Bandpass")
mpl.plot([i*ScFct for i in TimeBB], PskWaveI, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="Baseband (I)")
mpl.plot([i*ScFct for i in TimeBB], PskWaveQ, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label="Baseband (Q)")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('WAVEFORMS')
mpl.xlim(0, WaveBBxlim*ScFct)
mpl.ylim(-1.2, 1.2)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(223)
mpl.plot([i/1e3 for i in PskFreqBB], PskSpectBB, color='limegreen', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [kHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BASEBAND SPECTRUM')
mpl.ylim(SpectBBylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(224)
mpl.plot([i/1e6 for i in PskFreqRF], PskSpectRF, color='darkviolet', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [MHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BANDPASS SPECTRUM')
mpl.ylim(SpectRFylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)


Fig_2a = mpl.figure(num='PSK #2a - TX WITH SRRC FILTERING')
Fig_2a.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(221)
mpl.scatter(Map[0].real, Map[0].imag, color='deepskyblue', marker='o',s=30, label="In-phase")
for j in range(M) :
    mpl.text((Map[0].real)[j]+TextX,(Map[0].imag)[j]+TextY,str(Map[1][j]))
mpl.xlabel('In-phase') 
mpl.ylabel('Quadrature')
mpl.title('CONSTELLATION')
mpl.xlim(-1.5, 1.5)
mpl.ylim(-1.5, 1.5)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(222)
mpl.plot([i*ScFct for i in TimeRccRF], TxPskRccSgnRF, color='orange', linestyle='-.', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="Bandpass")
mpl.plot([i*ScFct for i in TimeBB], TxPskRccSgnBB.real, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="Baseband (I)")
mpl.plot([i*ScFct for i in TimeBB], TxPskRccSgnBB.imag, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label="Baseband (Q)")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('WAVEFORMS')
mpl.xlim(0, WaveBBxlim*ScFct)
mpl.ylim(-.75, .75)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(223)
mpl.plot([i/1e3 for i in TxPskRccFreqBB], TxPskRccSpectBB, color='limegreen', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [kHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BASEBAND SPECTRUM')
mpl.ylim(SpectBBylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(224)
mpl.plot([i/1e6 for i in TxPskRccFreqRF], TxPskRccSpectRF, color='darkviolet', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [MHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BANDPASS SPECTRUM')
mpl.ylim(SpectRFylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)

Fig_2b = mpl.figure(num='PSK #2b - RX WITH SRRC MATCHED FILTERING')
mpl.plot([i*ScFct for i in TimeBB], RxPskRccSgnBB.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markerfacecolor='r', markersize=2, label=" Rx waveform (I)")
mpl.plot([i*ScFct for i in TimeBB], RxPskRccSgnBB.imag, color='red', linestyle='-.', linewidth=1,
    marker='o', markerfacecolor='r', markersize=2, label=" Rx waveform (Q)")
mpl.stem([i*ScFct for i in TimeSy], TxSymbs.real,  linefmt ='b:',
    markerfmt='bx', basefmt='C7-', use_line_collection=False, label=" Tx symbols (I)")
mpl.stem([i*ScFct for i in TimeSy], TxSymbs.imag,  linefmt ='r:',
    markerfmt='rx', basefmt='k-', use_line_collection=True, label=" Tx symbols (Q)")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('BASEBAND WAVEFORMS')
mpl.xlim(0, WaveBBxlim*ScFct)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.show(block=False)                                                           # Show plots
mpl.pause(0.001)                                                                # Pause execution for 1 ms
input("\nPress ENTER to exit")                                                  # Ask closing plots on terminal
mpl.close('all')                                                                # Close all plots