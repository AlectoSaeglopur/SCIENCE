
"""
" Title: AUTOMATIC GAIN CONTROL (TESTED WITH CARRIER WAVE)
" Author: Filippo Valmori
" Date: 19/08/2022
" Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.13)
"""


### LIBRARIES ###

from numpy import zeros, pi, sin, cos, sqrt, log2, floor, asarray, \
    copy, array
from numpy.random import normal
from statistics import mean
import matplotlib.pyplot as mpl



### PARAMETERS ###

Ncyc = 2000                                             # Number of sinusoidal cycles to be simulated
Fc = 10e3                                               # Sinusoide frequency
osf = 20                                                # Oversampling factor
N0 = -10                                                # Channel noise power [dBW] (on both I and Q via)
Fs = osf*Fc                                             # Sample rate [Sa/s]
ScFct = 1e3                                             # Scaling factor for time graphs

OfsRef = 4-5j                                           # AGC signal DC-offset reference [V]
AmpRef = 1.9+0.2j                                           # AGC signal amplitude reference [V]
WinSz = 8*osf                                           # AGC window size [Sa] -> NB: higher "WinSz" means better accuracy (since better noise filtering) but more convergence delay
OfsGain = 0.85                                          # AGC DC-offset loop gain -> NB: use values between 0 and 1, otherwise AGC is unstable + lower "OfsGain" means better accuracy but more convergence delay
AmpGain = 0.45                                          # AGC amplitude loop gain -> NB: use values between 0 and 1, otherwise AGC is unstable + lower "AmpGain" means better accuracy but more convergence delay

Tvar = [[0, 0.3, 0.6],
        [0, 0.2, 0.5]]                                  # Variation times (I+Q) -> NB: expressed as fractions of the overall waveform length
Ovar = [[2.3, -1, 0.2],
        [-0.45, 3.5, 2.2]]                              # DC offset variations (I+Q) [V]
Avar = [[0.08, 0.25, 2.7],
        [0.58, 3.7, 0.02]]                              # Amplitude variations (I+Q) [V]

InfAgc = dict([('WinSz',WinSz),('OfsRef',OfsRef),
    ('OfsGain',OfsGain),('AmpRef',AmpRef),('AmpGain',AmpGain)])



### FUNCTIONS ###

"""
" Function to generate the carrier wave (CW) and apply DC offset plus amplitude varitions.
"""
def GetTxSgn( ) :
    Sgn = cos(2*pi*Fc*Time)+1j*sin(2*pi*Fc*Time)
    LenT = osf*Ncyc                                                             # Total signal length [Sa]
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
def Agc( InSgn, InfAgc ) :
    OfsRef = InfAgc['OfsRef']
    AmpRef = InfAgc['AmpRef']
    WinSz = InfAgc['WinSz']
    OfsGain = InfAgc['OfsGain']
    AmpGain = InfAgc['AmpGain']
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



### PROCESSING ###

Time = asarray([i/Fs for i in range(int(Ncyc*Fs/Fc))],dtype=float)
Sgn1 = GetTxSgn()
Sgn2 = AwgnChan(Sgn1,N0,Fs)
[Sgn3,Ncagc,OfsXv,AmpXv] = Agc(Sgn2,InfAgc)

print('\n >> AGC (CW) <<\n')
print(' * Reference :')
print('   - Offset = '+str(OfsRef)+' Vdc')
print('   - Amplit = '+str(AmpRef)+' Vac')
print(' * Settings :')
print('   - WinSize = '+str(int(WinSz/osf))+' Sy')
print('   - OfsGain = '+str(OfsGain))
print('   - OfsGain = '+str(AmpGain))



### PLOTS ###

Fig_1 = mpl.figure(num='AGC-CW')
Fig_1.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(221)
mpl.plot([i*ScFct for i in Time], Sgn1.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" I")
mpl.plot([i*ScFct for i in Time], Sgn1.imag, color='red', linestyle='-.', linewidth=1,
    marker='o', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title('INPUT SIGNAL')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(222)
mpl.plot([i*WinSz/Fs*ScFct for i in range(Ncagc)], OfsXv.real, color='black', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" DC offset")
mpl.plot([i*WinSz/Fs*ScFct for i in range(Ncagc)], AmpXv.real, color='darkorange', linestyle='--', linewidth=1,
    marker='o', markersize=2, label=" Amplitude")
mpl.xlabel('Time [ms]')
mpl.ylabel('Error [V]')
mpl.title(' AGC (I)')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(223)
mpl.plot([i*ScFct for i in Time], Sgn3.real, color='blue', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" I")
mpl.plot([i*ScFct for i in Time], Sgn3.imag, color='red', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" Q")
mpl.xlabel('Time [ms]')
mpl.ylabel('Amplitude [V]')
mpl.title(' OUTPUT SIGNAL')
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(224)
mpl.plot([i*WinSz/Fs*ScFct for i in range(Ncagc)], OfsXv.imag, color='black', linestyle='-', linewidth=1,
    marker='o', markersize=2, label=" DC offset")
mpl.plot([i*WinSz/Fs*ScFct for i in range(Ncagc)], AmpXv.imag, color='darkorange', linestyle='--', linewidth=1,
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
