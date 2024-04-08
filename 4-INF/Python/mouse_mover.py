
## LIBRARIES ##

from datetime import datetime
from mouse import click, move                   # requires "pip install mouse"
from time import sleep, time


## PARAMETERS ##

step_delay = 5                                  # step_delay between each change [sec] (NB: do not decrease too much, otherwise it's difficult to stop the execution)
trans_time = 0.2                                # transition time [sec]
exe_timeout = 45                                # execution timeout [min] (NB: use 0 for endless execution)
prt_info = False                                # flag to enable/disable printing of info on terminal
points = [                                      # X-Y coordinates of all points to be covered sequentially [px] (NB: to be adjusted in reference to display resolution)
  {'x': 160,  'y': 1050},
  {'x': 210,  'y': 1050}]


## PROCESSING ##

if prt_info :
  print(' ExeTo >> '+str(exe_timeout)+' min')
  dt = datetime.now()
  print(' Start >> '+dt.strftime("%d-%b-%Y %H:%M:%S"))
loop_flag = True
start_time = time()
while( loop_flag ) :
    for j in range(len(points)) :
      move(points[j]['x'],points[j]['y'],absolute=True,duration=trans_time)
      sleep(step_delay)
      click('left')
    if exe_timeout != 'inf' :
      end_time = time()
      if end_time-start_time > exe_timeout*60 :
         loop_flag = False
if prt_info :
  dt = datetime.now()
  print(' Final >> '+dt.strftime("%d-%b-%Y %H:%M:%S"))
exit()