
'''
' File containing functions to handle events and update screen.
'''

## LIBRARIES ##

import sys
import pygame
from bullet import Bullet


## FUNCTIONS ##

def check_key_press( params, event, screen, ship, bullets ) :
    """ Function to check which keyboard button has been pressed and take actions """
    if event.key == pygame.K_LEFT :                                 # if left-arrow key pressed to move ship...
        if ship.moving_right == True and \
            ship.moving_left == False :
            ship.moving_invert = True
        ship.moving_left = True
    elif event.key == pygame.K_RIGHT :                              # if right-arrow key pressed to move ship...
        ship.moving_right = True
    elif event.key == pygame.K_SPACE :                              # if spacebar key pressed to fire bullet...
        if len(bullets) < params.bullet_max_no :
            new_bullet = Bullet(params, screen, ship)               # create new bullet instance
            bullets.add(new_bullet)                                 # addn ew bullet to group


def check_key_release( ship, event ) :
    """ Function to check which keyboard button has been released and take actions """
    if event.key == pygame.K_RIGHT :
        ship.moving_right = False
    elif event.key == pygame.K_LEFT :
        ship.moving_left = False
    ship.moving_invert = False


def check_events( params, screen, ship, bullets ):
    """ Function to check keyboard and mouse edge-events """
    for event in pygame.event.get() :                               # take actions for all new events occurred...
        if event.type == pygame.QUIT :                              # if EXIT button has been clicked via mouse...
            sys.exit()
        elif event.type == pygame.KEYDOWN :                         # if any keyboard button has been pressed...
            check_key_press(params,event,screen,ship,bullets)
        elif event.type == pygame.KEYUP:                            # if any keyboard button has been released...
            check_key_release( ship, event )


def refresh_screen( params, screen, ship, bullets ) :
    """ Function to refresh screen and objects (at each loop iteration) """
    screen.fill(params.bg_color)                                   # re-draw main window 
    ship.blitme()                                                   # re-draw ship object
    for bullet in bullets.sprites():
        bullet.draw_bullet()
    pygame.display.flip()                                           # make the most recently drawn screen visible
