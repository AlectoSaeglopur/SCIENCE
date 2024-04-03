
## LIBRARIES ##

from datetime import datetime
from mouse import click, move                 # requires "pip install mouse"
from time import sleep, time


## PARAMETERS ##

step_delay = 5                                # step_delay between each change [sec] (NB: do not decrease too much, otherwise it's difficult to stop the execution)
trans_time = 0.2                              # transition time [sec]
tot_time = 30                                 # total execution time [min] (NB: use 'inf' for endless execution)
points = [                                    # X-Y coordinates of all points to be covered sequentially [px] (NB: to be adjusted in reference to display resolution)
  {'x': 160,  'y': 840},
  {'x': 210,  'y': 840}]


## PROCESSING ##

dt = datetime.now()
print(' Start >> '+dt.strftime("%d-%b-%Y %H:%M:%S"))
loop_flag = True
start_time = time()
while( loop_flag ) :
    for j in range(len(points)) :
      move(points[j]['x'],points[j]['y'],absolute=True,duration=trans_time)
      sleep(step_delay)
      click('left')
    if tot_time != 'inf' :
      end_time = time()
      if end_time-start_time > tot_time*60 :
         loop_flag = False
dt = datetime.now()
print(' Final >> '+dt.strftime("%d-%b-%Y %H:%M:%S"))
exit()
