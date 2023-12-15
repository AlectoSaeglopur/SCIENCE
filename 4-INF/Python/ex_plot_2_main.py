
'''
' Script of how to use the Pygal module to produce scalable vector graphics files.
'''

### LIBRARIES ###

from ex_plot_2_class import Die
from pygal import Bar                                                       # requires "pip install pygal"



# create x2 six-sided dice
die_1 = Die()
die_2 = Die()

# make some rolls, and store results in a list.
results = []
for roll_num in range(800):
    result = die_1.roll()+die_2.roll()
    results.append(result)

# Analyze the results.
frequencies = []
max_result = die_1.num_sides + die_2.num_sides
for value in range(2, max_result+1):
    frequency = results.count(value)
    frequencies.append(frequency)

# Visualize the results.
hist = Bar()
hist.title = "Results for x2 D6 rolled 800 times"
hist.x_labels = []
for j in range(2,13):
    hist.x_labels.append(str(j))
hist.x_title = "Result"
hist.y_title = "Occurrences"
hist.add('D6+D6', frequencies)
hist.render_to_file('ex_plot_2.svg')