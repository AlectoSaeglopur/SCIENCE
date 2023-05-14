
import mouse                    # pip install mouse
import time

Xpos = [160, 210]               # X positions [px] (NB: to be adjusted in reference to display resolution!)
Ypos = [840, 840]             # Y positions [px]
Delay = 5                       # delay between each change [s]
Trans = 0.5                     # transition time [s]

while( True ) :
    mouse.move(Xpos[0],Ypos[0],absolute=True,duration=Trans)
    time.sleep(Delay)
    mouse.click('left')
    mouse.move(Xpos[1],Ypos[1],absolute=True,duration=Trans)
    time.sleep(Delay)
    mouse.click('left')
    