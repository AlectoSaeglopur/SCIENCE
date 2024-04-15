
## LIBRARIES ##

from datetime import datetime
from mouse import click, move                       # requires "pip install mouse"
from sys import argv
from time import sleep, time


## PARAMETERS ##

step_delay = 5                                      # step_delay between each change [sec] (NB: do not decrease too much, otherwise it's difficult to stop the execution)
trans_time = 0.2                                    # transition time [sec]
prt_info = True                                     # flag to enable/disable printing of info on terminal
points = [                                          # X-Y coordinates of all points to be covered sequentially [px] (NB: to be adjusted in reference to display resolution)
  {'x': 250,  'y': 1050},
  {'x': 295,  'y': 1050}]


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
      for j in range(len(points)) :
        move(points[j]['x'],points[j]['y'],absolute=True,duration=trans_time)
        sleep(step_delay)
        click('left')
      if exe_timeout > 0 :
        end_time = time()
        if end_time-start_time > exe_timeout*60 :
          loop_flag = False
  if prt_info :
    dt = datetime.now()
    print(' Final >> '+dt.strftime("%d-%b-%Y %H:%M:%S"))
  exit()


## NOTES ##

# 1. For example, type "cls && python mouse_mover.py 30" to execute the script for 30 minutes,
#    or "cls && python mouse_mover.py 0" to execute it endlessly.
