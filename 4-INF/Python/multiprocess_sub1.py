"""
" Subprocess invoked by "multiprocess_main.py" script.
"""

import time

i = 0
while 1 :
    i += 1
    val = input(str(i)+'. Enter commnad : ')        # wait for new command as input from user
    f = open("pending_commands.txt", "a")            # open file in append write-append mode
    f.write(val+'\n')                               # write new command into file as new line
    f.close()
    f = open("history_of_commands.txt", "a")            # open file in append write-append mode
    f.write(val+'\n')                               # write new command into file as new line
    f.close()


