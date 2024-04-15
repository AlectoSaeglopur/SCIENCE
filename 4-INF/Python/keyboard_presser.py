
## LIBRARIES ##

from datetime import datetime
from keyboard import press, release, \
  press_and_release                                 # requires "pip install keyboard"
from sys import argv
from time import sleep, time


## PARAMETERS ##

prt_info = True                                     # flag to enable/disable printing of info on terminal
sequence = [
  {'key': 'up arrow',     'duration': 5},
  {'key': 'down arrow',   'duration': 5},
  {'key': 'Esc',          'duration': 0}]


## PROCESSING ##

arg_len = len(argv)-1                               # number of input argument retrieved from command line
if arg_len != 1 :
  raise Exception("Invalid number of input arguments provided.")
else :
  exe_timeout = int(argv[1])                        # execution timeout [min] (NB: use 0 for endless execution)
  if prt_info :
    print(' ExeTO >> '+str(exe_timeout)+' min')
    dt = datetime.now()
    print(' Start >> '+dt.strftime("%d-%b-%Y %H:%M:%S"))
  loop_flag = True
  start_time = time()
  while( loop_flag ) :
    try:
      for j in range(len(sequence)) :
        if sequence[j]['duration'] > 0 :
          press(sequence[j]['key'])
          sleep(sequence[j]['duration'])
          release(sequence[j]['key'])
        else :
          press_and_release(sequence[j]['key'])
      if exe_timeout > 0 :
        end_time = time()
        if end_time-start_time > exe_timeout*60 :
          loop_flag = False

    except KeyboardInterrupt :
      for j in range(len(sequence)) :
        release(sequence[j]['key'])
      exit()
  if prt_info :
    dt = datetime.now()
    print(' Final >> '+dt.strftime("%d-%b-%Y %H:%M:%S"))
  exit()


  ## NOTES ##

# 1. For example, type "cls && python keyboard_presser.py 30" to execute the script for 30 minutes,
#    or "cls && python keyboard_presser.py 0" to execute it endlessly.
