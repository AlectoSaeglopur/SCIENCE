
from time import sleep
from datetime import datetime

while 1 :
    Time1 = datetime.now().strftime('%H:%M:%S.%f')[:-3]                             # retrieve machine time (hours, minutes, seconds and milliseconds)
    Time2 = datetime.utcnow().strftime('%Y-%m-%d | %H:%M:%S.%f')[:-3]               # retrieve UTC data and time (year, month and day | hours, minutes, seconds and milliseconds
    print(Time2+Time1)
    sleep(0.5)