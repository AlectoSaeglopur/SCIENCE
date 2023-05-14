#!/usr/bin/env python3


### LIBRARIES ###

import RPi.GPIO as GPIO
import numpy, time, spidev, webbrowser, os



### PARMETERS ####

xLED = 4                                                    # LED GPIO number
xEXTI = 17                                                  # External interrupt GPIO number
BT = 1000                                                   # Bounce time (minimum time between two consecutive callbacks) [ms]
Dly = [0.4, 0.8]                                            # Blinking delays array [s]



### CONSTANTS AND VARIABLES ####

BUS = 0                                                     # Select SPI0 bus [DO NOT CHANGE]
CS = 1                                                      # SPI chip-select ID (depending on actual physical connection) [NOT USED] -> see NOTE#2
BrwSt = ''                                                  # Browser state [DO NOT CHANGE]

MsPos = dict([ \
            ('CENTER',[1000, 600]), \
            ('OP_KT',[1200, 500]), \
            ('OP_PRL',[760, 560]), \
            ('FS_KT5',[1480, 768]), \
            ('FS_KT6',[1480, 658]), \
            ('FS_7DR',[1555, 922]), \
            ('FS_PRL',[1442, 896]), \
            ('UM_KT5',[920, 768]), \
            ('UM_KT6',[920, 658]), \
            ('UM_7DR',[399, 922]), \
            ('UM_PRL',[513, 896]) ])                          # Mouse positions mapping table

CmdLen = 32                                                 # Commands length [b] (fixed by IR-protocol) [FIXED]
Map_Table = dict([ \
            ('KEY_PWR',b'\x00\xFF\xA2\x5D'), \
            ('KEY_PLAY',b'\x00\xFF\x02\xFD'), \
            ('KEY_FRW',b'\x00\xFF\xC2\x3D'), \
            ('KEY_RWD',b'\x00\xFF\x22\xDD'), \
            ('KEY_VOL+',b'\x00\xFF\x62\x9D'), \
            ('KEY_VOL-',b'\x00\xFF\xA8\x57'), \
            ('KEY_FUNC',b'\x00\xFF\xE2\x1D'), \
            ('KEY_UP',b'\x00\xFF\x90\x6F'), \
            ('KEY_DOWN',b'\x00\xFF\xE0\x1F'), \
            ('KEY_EQ',b'\x00\xFF\x98\x67'), \
            ('KEY_REPT',b'\x00\xFF\xB0\x4F'), \
            ('KEY_0',b'\x00\xFF\x68\x97'), \
            ('KEY_1',b'\x00\xFF\x30\xCF'), \
            ('KEY_2',b'\x00\xFF\x18\xE7'), \
            ('KEY_3',b'\x00\xFF\x7A\x85'), \
            ('KEY_4',b'\x00\xFF\x10\xEF'), \
            ('KEY_5',b'\x00\xFF\x38\xC7'), \
            ('KEY_6',b'\x00\xFF\x5A\xA5'), \
            ('KEY_7',b'\x00\xFF\x42\xBD'), \
            ('KEY_8',b'\x00\xFF\x4A\xB5'), \
            ('KEY_9',b'\x00\xFF\x52\xAD') ])                # Keys mapping table



### FUNCTIONS ####

"""
" Function to toggle LED state.
"""
def Toggle_LED( ) :
    if GPIO.input(xLED) :
        GPIO.output(xLED,GPIO.LOW)                          # If LED is on, then switch it off
    else :
        GPIO.output(xLED,GPIO.HIGH)                         # If LED is off, then switch it on


"""
" Function to convert a bit-stream string into the corresponding hex-bytes stream.
"""
def Conv_bi2hex( BitStr ) :
    LenBi = len(BitStr)
    LenBy = LenBi >> 3
    HexBy = b''
    if LenBi&7 != 0 :
        raise ValueError('\nBit-string length must be multiple of 8!\n')
    else :
        for j in range(LenBy) :
            HexBy += (int(BitStr[8*j:8*(j+1)],2)).to_bytes(1,'big')
    return HexBy


"""
" Function to start SPI reception upon the detection of a line falling edge.
"""
def ISR_EXTI( channel ) :
    #print('Falling edge detected!')
    T0 = time.time()                                        # Get current time [s]                  
    RxMsg = spi.xfer3(160*[0xAA])                           # Send data to trigger reception (minimum length is already used)
    #print(RxMsg)                                            # print RX SPI samples 
    Decode_Msg(RxMsg) 
    #print(time.time()-T0)                                   # print elapsed time for decoding [s]


"""
" Function to extract data bits from IR-encoded-signal samples.
"""
def Decode_Msg( RxMsg ) :
    global DecKey
    ThrIL = 50                                              # Counter threshold for initial low state (INIT_L) -> see NOTE#3
    ThrIH = 25                                              # Counter threshold for initial low state (INIT_L)
    ThrDT = 4                                               # Counter threshold for thin data state (DATA_L/DATA_H)
    ThrDW = 14                                              # Counter threshold for wide data state (DATA_H)
    St = 'INIT_L'                                           # Detection state
    LsVal = 0                                               # Latest level detected (1=high/0=low)
    LsCnt = 0                                               # Consecutive same-level counter
    LenBy = len(RxMsg)                                      # Rx message byte-length
    LenBi = 8*LenBy                                         # Rx message bit-length
    DecBits = ''                                            # Decoded bit-stream
    DecIdx = 0                                              # Index over decoded bit-stream
    for i in range(1,LenBi) :                               # Skip 1st bit to be sure falling transition of the line is over [NOT ESSENTIAL] 
        IdxBy = i>>3                                        # Retrive byte index at i-th cycle
        IdxBi = 7-(i&7)                                     # Retrive bit index at i-th cycle
        InBit = (RxMsg[IdxBy]>>IdxBi)&1                     # Retrive i-th bit of Rx message
        if St == 'INIT_L' :                                 # 1. INITIAL LOW STATE (about 9 ms)
            if InBit == LsVal :                             # If line is still low...
                LsCnt = LsCnt+1                             # Increase counter
            elif LsCnt >= ThrIL :                           # If line had a rising edge and previous low state was long enough...
                #print('IL-'+str(LsVal)+'-'+str(LsCnt))
                St = 'INIT_H'                               # Move to next state
                LsVal = LsVal^1                             # Invert latest bit flag
                LsCnt = 0                                   # Reset counter
            else :
                print('\n >> ERROR: Invalid sequence (IL)\n')
                break
        elif St == 'INIT_H' :                               # 2. INITIAL HIGH STATE (about 4.4 ms)
            if InBit == LsVal :                             # If line is still high...
                LsCnt = LsCnt+1                             # Increase counter
            elif LsCnt >= ThrIH :                           # If line had a falling edge and previous high state was long enough...
                #print('IH-'+str(LsVal)+'-'+str(LsCnt))
                St = 'DATA_L'                               # Move to next state
                LsVal = LsVal^1                             # Invert latest bit flag
                LsCnt = 0                                   # Reset counter
            else :
                print('\n >> ERROR: Invalid sequence (IH)\n')
                break
        elif St == 'DATA_L' :                               # 3a. DATA LOW STATE (about 562.5 us)
            if InBit == LsVal :                             # If line is still low...
                LsCnt = LsCnt+1                             # Increase counter
            elif LsCnt >= ThrDT :                           # If line had a rising edge and previous low state was long enough...
                #print('DL-'+str(LsVal)+'-'+str(LsCnt))
                St = 'DATA_H'                               # Move to next state
                LsVal = LsVal^1                             # Invert latest bit flag
                LsCnt = 0                                   # Reset counter
            else :
                print('\n >> ERROR: Invalid sequence (DL)\n')
                break
        elif St == 'DATA_H' :                               # 3b. DATA HIGH STATE (about 562.5 us or 3 x 562.5 = 1687.5 us)
            if InBit == LsVal :                             # If line is still high...
                LsCnt = LsCnt+1                             # Increase counter
            elif LsCnt >= ThrDW :                           # If line had a falling edge and previous high state was long enough to be a '1'...
                #print('DHW-'+str(LsVal)+'-'+str(LsCnt))
                St = 'DATA_L'                               # Move to next state
                LsVal = LsVal^1                             # Invert latest bit flag
                LsCnt = 0                                   # Reset counter
                DecBits = DecBits+'1'                       # Add '1'-bit to detected stream list
                DecIdx = DecIdx+1
            elif LsCnt >= ThrDT :                           # If line had a falling edge and previous high state was long enough to be a '0'...
                #print('DHT-'+str(LsVal)+'-'+str(LsCnt))
                St = 'DATA_L'                               # Move to next state
                LsVal = LsVal^1                             # Invert latest bit flag
                LsCnt = 0                                   # Reset counter
                DecBits = DecBits+'0'                       # Add '0'-bit to detected stream list
                DecIdx = DecIdx+1
            else :
                print('\n >> ERROR: Invalid sequence (DH)\n')
                break
        else :
            print('\n >> ERROR: Unknown state\n')
            break
        if DecIdx >= CmdLen :                               # Check condition of successful conversion
            #print('\n Message decoded!')
            break
    #print('LastCnt = '+str(LsCnt))
    #print('DECBITS = '+DecBits)
    HexBy = Conv_bi2hex(DecBits)                            # Convert bit-stream string into hex-bytes stream
    if HexBy in Map_Table.values() :
        DecKey = list(Map_Table.keys())[list(Map_Table.values()).index(HexBy)]
        print(DecKey)
    else :
        print('\n >> ERROR: Unknown command\n')



"""
" Function to parse the received command and execute related action.
"""
def Cmd_Parser( Key ):
    global BrwSt, MsPos
    if Key == 'KEY_PWR' :                                   # SHUTDOWN/REBOOT RASPBERRY
        if BrwSt != '' :
            os.system('xdotool key Alt+F4')
            time.sleep(1)
        #os.system('reboot')
        os.system('shutdown -h now')
        
    if Key == 'KEY_PLAY' :                                  # PLAY/PAUSE BROWSER
        os.system('xdotool mousemove '+str(MsPos['CENTER'][0])+' '+str(MsPos['CENTER'][1]))
        os.system('xdotool key space')
        
    elif Key == 'KEY_REPT' :                                # SET BROWSER IN FULL-SCREEN
        if BrwSt == 'KT_CAN5'  :
            os.system('xdotool mousemove '+str(MsPos['FS_KT5'][0])+' '+str(MsPos['FS_KT5'][1]))
        elif BrwSt == 'KT_ITA1'  :
            os.system('xdotool mousemove '+str(MsPos['FS_KT6'][0])+' '+str(MsPos['FS_KT6'][1]))
        elif BrwSt == 'LA7-DIR' :
            os.system('xdotool mousemove '+str(MsPos['FS_7DR'][0])+' '+str(MsPos['FS_7DR'][1]))
        elif BrwSt == 'PRL-RPL' :
            os.system('xdotool mousemove '+str(MsPos['FS_PRL'][0])+' '+str(MsPos['FS_PRL'][1]))
        time.sleep(1)
        os.system('xdotool click 1')
            
    elif Key == 'KEY_EQ' :                                  # UNMUTE BROWSER
        if BrwSt == 'KT_CAN5'  :
            os.system('xdotool mousemove '+str(MsPos['UM_KT5'][0])+' '+str(MsPos['UM_KT5'][1]))
        elif BrwSt == 'KT_ITA1'  :
            os.system('xdotool mousemove '+str(MsPos['UM_KT6'][0])+' '+str(MsPos['UM_KT6'][1]))
        elif BrwSt == 'LA7-DIR' :
            os.system('xdotool mousemove '+str(MsPos['UM_7DR'][0])+' '+str(MsPos['UM_7DR'][1]))
        elif BrwSt == 'PRL-RPL' :
            os.system('xdotool mousemove '+str(MsPos['UM_PRL'][0])+' '+str(MsPos['UM_PRL'][1]))
        time.sleep(1)
        os.system('xdotool click 1')
        
    elif Key == 'KEY_FUNC' :                                # REFRESH WEBPAGE (F5)
        os.system('xdotool key F5')
        
    elif Key == 'KEY_3' :                                   # OPEN RAI3 WEBPAGE
        if BrwSt != '' :
            os.system('xdotool key Alt+F4')
            time.sleep(2)
        BrwSt = 'KT_CAN5'
        webbrowser.open("https://webtvhd.com/rai-3-hd-live-stream-online.php")   
        time.sleep(4)
        #os.system('xdotool mousemove 472 50')
        #time.sleep(1)
        #os.system('xdotool click 1')
        os.system('xdotool mousemove 700 800')
        os.system('xdotool click 1')
        time.sleep(15)
        os.system('xdotool click 1')
        time.sleep(2)
        os.system('xdotool mousemove 460 560')
        os.system('xdotool click 1')
        os.system('xdotool click 1')
        os.system('xdotool mousemove 1100 917')
        time.sleep(1)
        os.system('xdotool click 1')
        time.sleep(1)
        os.system('xdotool mousemove 1 1')
        
        
        
        
    elif Key == 'KEY_5' :                                   # OPEN CANALE5 WEBPAGE
        if BrwSt != '' :
            os.system('xdotool key Alt+F4')
            time.sleep(2)
        BrwSt = 'KT_CAN5'
        webbrowser.open("https://www.kritere.com/p/canale-5-in-diretta-streaming-dallestero.html")   
        time.sleep(6)
        os.system('xdotool click --repeat 25 5')
        time.sleep(1)
        os.system('xdotool mousemove '+str(MsPos['OP_KT'][0])+' '+str(MsPos['OP_KT'][1]))
        os.system('xdotool click 1')
        
        
    elif Key == 'KEY_6' :                                   # OPEN ITALIA1 WEBPAGE
        if BrwSt != '' :
            os.system('xdotool key Alt+F4')
            time.sleep(2)
        BrwSt = 'KT_ITA1'
        webbrowser.open("https://www.kritere.com/p/italia-1-in-diretta-streaming-dallestero.html")   
        time.sleep(6)
        os.system('xdotool click --repeat 25 5')
        time.sleep(1)
        os.system('xdotool mousemove '+str(MsPos['OP_KT'][0])+' '+str(MsPos['OP_KT'][1]))
        os.system('xdotool click 1')
        
    elif Key == 'KEY_7' :                                   # OPEN LA7 WEBPAGE
        if BrwSt != '' :
            os.system('xdotool key Alt+F4')
            time.sleep(2)
        BrwSt = 'LA7-DIR'
        webbrowser.open("https://www.la7.it/dirette-tv")
        
    elif Key == 'KEY_8' :                                   # OPEN PROPAGANDA LIVE REPLAY
        if BrwSt != '' :
            os.system('xdotool key Alt+F4')
            time.sleep(2)
        BrwSt = 'PRL-RPL'
        webbrowser.open_new("https://www.la7.it/propagandalive/rivedila7")
        time.sleep(5)
        os.system('xdotool mousemove '+str(MsPos['OP_PRL'][0])+' '+str(MsPos['OP_PRL'][1]))
        os.system('xdotool click 1')
        
    elif Key == 'KEY_9' :                                   # OPEN LA9 REPLAY
        if BrwSt != '' :
            os.system('xdotool key Alt+F4')
            time.sleep(2)
        BrwSt = 'KT_LA9'
        webbrowser.open_new("https://www.kritere.com/p/nove-in-diretta-streaming.html")
        
        

        
### MAIN ###
    
GPIO.setmode(GPIO.BCM)                                      # Use BCM mode for global pin numbering (i.e. red GPIOx assignment in datasheet)
GPIO.setup(xLED,GPIO.OUT)                                   # Set xLED pin as output
GPIO.setup(xEXTI,GPIO.IN,GPIO.PUD_UP)                       # Set xEXTI pin as input with internal pull-up -> see NOTE#1
GPIO.add_event_detect(xEXTI,GPIO.FALLING,
    callback=ISR_EXTI,bouncetime=BT)                        # Link falling edges on xEXTI line to ISR function
spi = spidev.SpiDev()                                       # Create SPI instance
spi.open(BUS,CS)                                            # Open SPI connection
spi.max_speed_hz = 17778                                    # Set SPI baud rate [b/s] -> see NOTE#2
spi.mode = 0                                                # Set SCLK polarity and phase [NOT ESSENTIAL] -> see NOTE#2
BlkDly = Dly[0]                                             # Initialize blinking rate
DecKey = ''                                                 # Initialize decoding key

while 1 :
    try:
        if DecKey != '' :
            Cmd_Parser(DecKey)
            if BlkDly == Dly[0]  :                          # Change LED blinking rate to signal a command has been correctly detected
                BlkDly = Dly[1] 
            else :
                BlkDly = Dly[0]
            DecKey = ''
        time.sleep(BlkDly)                                  # Pause execution [s]
        Toggle_LED()
    except KeyboardInterrupt:                               # Abort execution when CTRL+C is pressed    
        print('\n >> Aborted!')
        spi.close()                                         # Close SPI connection
        GPIO.cleanup()                                      # Release all pins
        exit()                                              # Quit execution



### NOTES ###

# 0. Hardware setup :
#    - IR RX CHIP -> R = VDD | G = GND | Y = shared node (XX),
#    - LED -> [+] = GPIO4 | [-] = R1,
#    - RASPBERRY -> GPIO4 (xLED) = LED+ |  GPIO17 (xEXTI) = XX | GPIO9 (MISO) = XX
#    - Resistors -> R1 (LED) = Resistance between LED- and GND (220 Ohm) | R2 = Resistance between XX and VDD (1k Ohm)
#    - Supply -> VDD from pin #17 (3.3V) | GND from pin #39 (ground).

# 1. MISO pull-up : Before running the script be sure the Raspberry MISO-0 line is pulled-up with the command
#    "raspi-gpio get" (in case not, type "raspi-gpio set 9 pu"). Moreover, since the Raspberry internal pull-
#    up/down networks are really poor, remember to place always an external pull-up/down resistor in addition.

# 2. SPI details : Experimentally Raspberry SPI interfaces cannot work with a baud rate slower than 10 kHz.
#    That's why, even though the IR-encoded signal has a maximum rate of about 1777.8 Hz (i.e. T = 562.5 us),
#    the SPI baud rate is set x10 times faster (so theoretically there should be roughly 10 samples for each
#    thin signal level). Moreover, note in this project the use of an SPI communication is just a work-around
#    to sample the IR-receiver output line, but actually the SCLK, MOSI nd CS lines are not used (and left
#    unconnected). Finally, remember the "spi.mode" function allows to set SCLK line polarity and phase by
#    setting the x2 bits CPOL|CPHA :
#    a. MODE = 0 -> clock idle low | data sampled on rising edge | output data updated on falling edge,
#    b. MODE = 1 -> clock idle low | data sampled on falling edge | output data updated on rising edge,
#    c. MODE = 2 -> clock idle high | data sampled on falling edge | output data updated on rising edge,
#    d. MODE = 3 -> clock idle high | data sampled on rising edge | output data updated on falling edge.

# 3. All the detection thresholds (i.e. ThrIL, ThrIH, ThrDT and ThrDW) have been set experimentally (but
#    anyway related to IR-protocol maximum rate and SPI clock frequency).

# 4. Mouse and keyboard are controlled via "xdotool" :
#    - use "sudo apt-get install xdotool" to install the package,
#    - use "xdotool click [--repeat <nrep>] <btn>" to click or scroll (where <nrep> is the optional number
#      of repetions and <btn> can be "1" for left-clicking, "2" for middle-clicking, "3" for right-clicking,
#      "4" for scrolling-up or "5" for scrolling down.

# 5. Various :
#    - "os.system('<cmd>')"" can be used to execute a terminal-like command inside a Python script,
#    - Pressing "Alt+F4" closes the window (browser, terminal or else) currently running in the foreground.
