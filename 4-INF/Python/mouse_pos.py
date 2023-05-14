
from pynput.mouse import Controller
from time import sleep

while 1 :
    mouse = Controller()
    print(mouse.position)                   # get current mouse X-Y position in pixels over screen
    sleep(0.5)


