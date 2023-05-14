
### LIBRARIES ###

import numpy as np
import matplotlib.pyplot as plt
import subprocess
import time



### PROCESSING ###

sub1 =subprocess.Popen('python multiprocess_sub1.py', 
    creationflags=subprocess.CREATE_NEW_CONSOLE)            # open subprocess invoking "multiprocess_sub1.py"

RdIdx = 0

f = open("history_of_commands.txt", "w")                    # open file in wite-overwrite moed to cancel all file content (remove previous historys)                                          
f.close()
f = open("pending_commands.txt", "w")                    # open file in wite-overwrite moed to cancel all file content (remove previous historys)                                          
f.close()

i = 0
while 1 :

    try :
        print('* main cycle #',str(i))
        i += 1

        f = open("pending_commands.txt", "r")
        rd = f.readlines()
        f.close()
        Nrows = len(rd)
        if Nrows > RdIdx :
            NewCmd = rd[RdIdx]
            NewCmd = NewCmd[:-1]    # remove final '\n'
            print('>> NEW COMMAND READ :',str(NewCmd))
            RdIdx += 1
        else :
            f = open("pending_commands.txt", "w")                    # cancel file content (since already executed)m to avoid reading huge content in case of history with several commands!                                         
            f.close()
            RdIdx = 0

        time.sleep(0.5)                                         # wait 250 ms before new cycle

    except KeyboardInterrupt:                           # enter here if CTRL+C is pressed in main process terminal
        sub1.kill()                                     # close subprocess
        exit()                                          # close main process
    