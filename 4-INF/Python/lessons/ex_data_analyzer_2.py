
'''
' Script showing how to import population data from .json file and plot result using the maps/world module in Pygal.
'''


### LIBRARIES ###

from json import load
from pygal.maps.world import COUNTRIES, World                                   # requires "pip install pygal_maps_world"
from pygal.style import Style



### PARAMETERS ###

fname = 'population_data.json'                                                  # .jspn file to load [DO NOT CHANGE]
Year = '1977'                                                                   # year of interest [CHOOSE WITHIN RANGE 1960-2010]



### FUNCTIONS ###

def get_country_code( in_name ) :
    """ Return Pygal 2-digit country code for given country name """
    ret = None
    for code, name in COUNTRIES.items():
        if name == in_name:
            ret = code
            break
    return ret



### PROCESSING ###

with open(fname) as fid :
    pop_data = load(fid)                                                        # load data from .json

popul_list = {}                                                                 # population list (according to country codes)
for popul_dict in pop_data :
    if popul_dict['Year'] == Year :
        country_name = popul_dict['Country Name']
        country_code = get_country_code(country_name)
        country_popul = int(float(popul_dict['Value']))
        if country_code :
            popul_list[country_code] = round(country_popul/1e6,3)               # express population in millions (and keep only 3 decimal digitas)

popul_bin_1, popul_bin_2, popul_bin_3, popul_bin_4 = {}, {}, {}, {}             # define population bins
for idx, pop in popul_list.items():
    if pop < 10:                                                                # POP < 10M
        popul_bin_1[idx] = pop
    elif pop < 100:                                                             # 10M < POP < 100M
        popul_bin_2[idx] = pop
    elif pop < 1000:                                                            # 100M < POP < 1000M
        popul_bin_3[idx] = pop
    else:                                                                       # X > 1B = 1000M
        popul_bin_4[idx] = pop



### RESULTSS ###

cst_style = Style(tooltip_font_size = 8)                                        # customize Pygal style to set mouseover-tooltip size
wm = World(style=cst_style)                                                     # create Pygal world map
wm.title = 'World population by country (in millions) - ' + Year
wm.add('0-10M', popul_bin_1)
wm.add('10M-100M', popul_bin_2)
wm.add('100M-1B', popul_bin_3)
wm.add('>1B', popul_bin_4)
wm.render_to_file('ex_data_analyzer_2.svg')
