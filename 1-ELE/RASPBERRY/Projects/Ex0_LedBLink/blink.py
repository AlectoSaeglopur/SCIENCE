#!/usr/bin/python3

import RPi.GPIO as GPIO
import time

PIN = 4                              # GPIO ID (e.g. X means GPIOX from datasheet)

GPIO.setmode(GPIO.BCM)               # use BCM mode for pin numbering/assignment
GPIO.setup(PIN,GPIO.OUT)             # set PIN as output

for i in range(10):
    GPIO.output(PIN,GPIO.HIGH)
    time.sleep(0.2)
    GPIO.output(PIN,GPIO.LOW)
    time.sleep(0.2)
    
print('Done!')
GPIO.cleanup()                       # release all GPIOs
