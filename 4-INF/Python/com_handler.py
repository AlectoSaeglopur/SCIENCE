
"""
" Script for handling PC's COM ports for TX/RX through Python.
" Filippo Valmori
" 16/05/2022
"""

### LIBRARIES ###

import serial                                                           # pip install serial && pip install pyserial



### PARAMETERS ###

ComId = 'COM6'                                                          # COM ID
Rb = 1e6                                                                # baud rate [b/s]
Ndb = 8                                                                 # number of data bits
Par = serial.PARITY_NONE                                                # parity check (NB: use PARITY_NONE, PARITY_EVEN or PARITY_ODD)
To = 2                                                                  # timeout [s]

Mode = 'ASCII'                                                          # Communication mode ('BYTES' or 'ASCII') [see NOTE#1]

if Mode == 'BYTES' :
    TerX = b'\r\n'                                                      # termination sequence in 'BYTES' mode
    DataLen = 2                                                         # message data length in RX (e.g. 2 if a single UINT16 is expected to be received) [B] 
    ExpLen = DataLen+len(TerX)                                          # expected overall message length in RX (including termination sequence) [B]
elif Mode == 'ASCII' :
    TerX = b'\n'
    DataLen = 4
    ExpLen = DataLen+len(TerX)



### PROCESING ###

Ser = serial.Serial()                                                   # create new port handler
Ser.port = ComId                                                        # set COM ID
Ser.baudrate = Rb                                                       # set baud rate
Ser.bytesize = Ndb                                                      # set number of data bits
Ser.parity = Par                                                        # set parity
Ser.timeout = To                                                        # set timeout
Ser.open()                                                              # open port

print(' >> INFO : ',Ser,'\n')

while 1 :

    if Ser.in_waiting != 0 :                                            # if data has been received...

        if Mode == 'BYTES' :
            # RdVect = Ser.read(size=5)                                   # read bytes until the expected number is received (e.g. 5 B here) or timeout (from 1st byte received) expires
            RdVect = Ser.read_until(expected=TerX)                      # read bytes until the termination sequence is detected or timeout (from 1st byte reception) expires
            LenRx = len(RdVect)
            if (RdVect[-len(TerX):] != TerX) or (LenRx != ExpLen) :
                print(' >> INVALID RX -> Len =',str(LenRx),':',str(RdVect),'\n')
            else :
                RdVect = RdVect[:-len(TerX)]
                RdVal = int.from_bytes(RdVect, "big")
                print(' >> RX : -> Len =',str(LenRx),':',str(RdVect),':',str(RdVal),'\n')

        elif Mode == 'ASCII' :
            RdVect = Ser.read_until(expected=TerX)                      # read bytes until the termination sequence is detected or timeout (from 1st byte reception) expires
            LenRx = len(RdVect)
            if (RdVect[-len(TerX):] != TerX) or (LenRx != ExpLen) :
                print(' >> INVALID RX -> Len =',str(LenRx),':',str(RdVect),'\n')
            else :
                RdVect = RdVect[:-len(TerX)]
                RdVal = int(RdVect.decode(),16)                         # retrive UINT16 value by converting byte-to-string/hex and then string/hex-to-int
                print(' >> RX : -> Len =',str(LenRx),':',str(RdVect),':',str(RdVal),'\n')

        else :
            print(' >> ERROR : INVALID MODE!')
            exit()


    #Ser.write(b'a')

Ser.close()                                                     # close port



### NOTES ###

# 1. For the RX, assuming the MCU is transmitting a single UINT16 every 500 ms, in 'BYTES' mode the message consists of
#    2 bytes containing simply the lower and upper part of the UINT16 plus the termination sequence. In this case the
#    throughput is optimized, but it might happen that the UINT16 value contains itself the termination sequence causing
#    the message to be misreceived. Of course, this problem is even more evident and critical in case a longer data
#    message is expected (e.g. a sequence of x10 UINT16). To avoid this issue the 'ASCII' mode can be used, since in
#    this case each 4-bit block of the data message is mapped into the corresponding 8-bit ASCII character in hexadecimal
#    format (i.e. only from '0' to '9' or from 'A' to 'F'). Thus, using any other character (e.g. '\n') used as termination
#    sequence can now never appear as part of the data message. However, this clearly causes a loss in terms of throughput
#    (since now each original UINT16 is mapped into 32 bits).
