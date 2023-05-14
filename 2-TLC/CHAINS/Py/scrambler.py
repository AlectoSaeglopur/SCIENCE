
"""
" Title: Title: ADDITIVE AND MULTIPLICATIVE SCRAMBLING
" Author: Filippo Valmori
" Date: 16/11/2018
" Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Scrambler
"""


### FUNCTIONS ###

"""
" Function for implementing an additive scrambler (aka synchronous or
" linear-feedback shift register scrambler) and descrambler.
"""
def AddScramb( InBytes, ConVect, InitState ) :
    InBits = Byte2BitConv(InBytes)
    BitLen = len(InBits)
    RegState = InitState[:]
    OutBits = [0]*BitLen
    for j in range(BitLen) :
        RegBit = (sum([v1*v2 for v1,v2 in zip(RegState,ConVect)])%2)
        OutBits[j] = InBits[j]^RegBit
        RegState[1:] = RegState[:-1]
        RegState[0] = RegBit
    return Bit2ByteConv(OutBits)


"""
" Function for implementing a multiplicative (aka self-synchronizing) scrambler.
"""
def MultScramb( InBytes, ConVect, InitState ) :
    InBits = Byte2BitConv(InBytes)
    BitLen = len(InBits)
    RegState = InitState[:]
    OutBits = [0]*BitLen
    for j in range(BitLen) :
        RegBit = (sum([v1*v2 for v1,v2 in zip(RegState,ConVect)])%2)
        OutBits[j] = InBits[j]^RegBit
        RegState[1:] = RegState[:-1]
        RegState[0] = OutBits[j]
    return Bit2ByteConv(OutBits)


"""
" Function for implementing a multiplicative (aka self-synchronizing) descrambler.
"""
def MultDescramb( InBytes, ConVect, InitState ) :
    InBits = Byte2BitConv(InBytes)
    BitLen = len(InBits)
    RegState = InitState[:]
    OutBits = [0]*BitLen
    for j in range(BitLen) :
        RegBit = (sum([v1*v2 for v1,v2 in zip(RegState,ConVect)])%2)
        OutBits[j] = InBits[j]^RegBit
        RegState[1:] = RegState[:-1]
        RegState[0] = InBits[j]
    return Bit2ByteConv(OutBits)


"""
" Function for converting a byte stream into the corresponding bit stream.
"""
def Byte2BitConv( InBytes ) :
    InLen = len(InBytes)
    OutLen = (InLen<<3)
    OutBits = [0]*OutLen
    for j in range(OutLen) :
        ByteIdx = (j>>3)
        BitIdx = 7-(j%8)
        if (InBytes[ByteIdx] >>BitIdx)%2 :
            OutBits[j] = 1
    return OutBits


"""
" Function for converting a bit stream into the corresponding byte stream.
"""
def Bit2ByteConv( InBits ) :
    InLen = len(InBits)
    OutLen = (InLen>>3)
    OutBytes = [0]*OutLen
    for j in range(InLen) :
        if InBits[j] :
            ByteIdx = (j>>3)
            BitIdx = 7-(j%8)
            OutBytes[ByteIdx] += (1<<BitIdx)
    return OutBytes
