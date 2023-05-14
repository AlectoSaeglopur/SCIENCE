""" 
" Example about how to refresh a plot inside a loop
"""


### LIBRARIES ###

import numpy as np
import matplotlib.pyplot as plt
import time



### PROCESSING ###

x = np.linspace(0, 10, 100)                                 # create X vector
y = np.sin(x)                                               # create Y vector
 
plt.ion()                                                   # enable plot interactive mode
fig1, (sp1,sp2) = plt.subplots(2,figsize=(10, 8))           # generate figure with 2 subplots

crv1, = sp1.plot(x,y)                                       # assign curve to 1st subplot
plt.title("Interactive GUI example #1", fontsize=20)        # add plot t
plt.xlabel("Amplitude")                                     # add plot X-label
plt.ylabel("Time")                                          # add plot Y-label

crv2, = sp2.plot(x,y)                                       # assign curve to 2nd subplot
plt.title("Interactive GUI example #2", fontsize=20)        # add plot title
plt.xlabel("Amplitude")                                     # add plot X-label
plt.ylabel("Time")                                          # add plot Y-label

i = 0
while 1 :

    y1 = np.sin(x+0.5*i)                                    # calculate sp1 new Y vector
    y2 = np.sin(x+0.5*i*10)                                 # calculate sp1 new Y vector
    i += 1                                                  # increase cycle index

    crv1.set_xdata(x)                                       # set sp1 new X-axis (NB: not necessary if doesn't change!)
    crv1.set_ydata(y1)                                      # set sp1 new Y-axis
    crv2.set_ydata(-y2)                                     # set sp2 new Y-axis

    fig1.canvas.draw()                                      # update figure
    fig1.canvas.flush_events()                              # refresh figure
    
    time.sleep(0.1)                                         # wait 100 ms before new cycle