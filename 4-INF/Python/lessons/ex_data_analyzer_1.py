
'''
' Script showing an example of .csv file interpretation and visualization.
'''


### LIBRARIES ###

from csv import reader
from datetime import datetime
from matplotlib import pyplot as mpl
from numpy import arange



### PROCESSING ###

fname = 'sitka_weather_2014.csv'                                            # .csv file name

with open(fname) as fid:
    data = reader(fid)                                                      # extract data
    header_row = next(data)
    for idx,val in enumerate(header_row):
        print(idx,val)                                                      # print each header field with corresponding index
    dates, highs, lows = [], [], []
    for row in data:
        highs.append((int(row[1])-32)*5/9)                                  # read daily high temperature (converting from Fahrenheit to Celsius degrees)
        lows.append((int(row[3])-32)*5/9)                                   # read daily low temperature (converting from Fahrenheit to Celsius degrees)
        date = datetime.strptime(row[0], "%Y-%m-%d")                        # read date (YYYY-MM-DD format)
        date = date.strftime('%d')+'-'+date.strftime('%b')                  # convert date format (DD-M_NAME)
        dates.append(date)



### RESULTS ###

entry_span = 31                                                             # day-span for visualization on X-axis
fig = mpl.figure(dpi=100,figsize=(10,8))                                    # set plot dimensions
mpl.plot(dates,highs,c='red',alpha=0.6)                                     # plot high measures ("alpha" controls the color intensity)
mpl.plot(dates, lows, c='blue', alpha=0.6)                                  # plot low measures ("alpha" controls the color intensity)
mpl.fill_between(dates,highs,lows,facecolor='green',alpha=0.2)              # color area between curves
mpl.title("Daily high/low temperatures (2014)",fontsize=24)
mpl.xlabel('',fontsize=16)
mpl.ylabel("Temperature [C]", fontsize=16)
fig.autofmt_xdate()                                                         # format X-axis for better visualization
mpl.xticks(arange(0,len(dates),entry_span),rotation=45,size=16)             # set span resolution on X-axis
mpl.grid(color='silver',linestyle='--',linewidth=1)
mpl.savefig('ex_data_analyzer_1.png', bbox_inches='tight')
mpl.show()
