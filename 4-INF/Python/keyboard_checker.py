"""
"Script where keyboard inputs are detected and stores within main loop operation without halting that.
"""

### LIBRARIES ###

import keyboard
import time



### PROCESSING ###

Idx = 0
TxMsg = ""                                                      # message written so far
Debc = False                                                    # debouncer flag
def  check_keyboard() :
    global TxMsg, Idx, Debc
    if keyboard.is_pressed('a') :
        if not(Debc) :
            Idx += 1
            TxMsg += 'A'
            Debc = True
            print(TxMsg)                                        # print input messageso far
    elif keyboard.is_pressed('b') :
        if not(Debc) :
            TxMsg += 'B'
            Idx += 1
            Debc = True
            print(TxMsg)
    elif keyboard.is_pressed('c') :
        if not(Debc) :
            TxMsg += 'C'
            Idx += 1
            Debc = True
            print(TxMsg)
    elif keyboard.is_pressed('enter') :
        if not(Debc) :
            print('>> TX!')
            Idx = 0
            TxMsg = ""
            Debc = True
    # here the "elif" case shouldbe extended to the whole alphabet...

    else :
        Debc = False


RdIdx = 0


i = 0
while 1 :
    print('* cycle #',str(i))                               # print needed to prove the code keeps running while listening to keyboard inputs
    i += 1
    check_keyboard()                                        # check if new key has been pressed
    time.sleep(0.1)                                         # wait 250 ms before new cycle