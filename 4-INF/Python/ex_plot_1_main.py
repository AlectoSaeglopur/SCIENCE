
'''
' Script showing how to fade plot colors and automatically save image thoruhg a random-walk example.
'''


### LIBRARIES ###

from ex_plot_1_class import RandomWalk                          
from matplotlib.pyplot import scatter, xticks, yticks, \
    savefig, show                                                           # requires "pip install matplotlib"
import matplotlib.pyplot as mpl


### PROCESSING ###

rw = RandomWalk()                                                           # generate RW
rw.fill_walk()



### RESULTS ###

scatter(rw.x, rw.y, c=list(range(rw.num_points)), \
    cmap=mpl.cm.Blues, edgecolor='none', s=15)                              # plot RW sequence with cmap color progression/fading
scatter(0, 0, c='green', edgecolors='none', s=20)                           # plot starting point of RW
scatter(rw.x[-1], rw.y[-1], c='red', edgecolors='none',s=10)                # plot final point of RW
xticks([])                                                                  # remove ticks and labels on X-axis
yticks([])                                                                  # remove ticks and labels on Y-axis

savefig('ex_plot_1.png', bbox_inches='tight')                               # save automatically image
show()                                                                      # show image