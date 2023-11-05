
'''
' File handling bullet objects (fired by ship) initialization and run-time update.
'''

## LIBRARIES ##

import pygame
from pygame.sprite import Sprite


## CLASSES ##

class Bullet( Sprite ):
    """ Bullet class """

    def __init__( self, params, screen, ship ) :
        """ Initialize bullet object """
        super(Bullet, self).__init__()                              # (see NOTE#4 in "main_game.c" for details)
        self.screen = screen                                        # store screen info into class
        self.rect = pygame.Rect(ship.pos.centerx,ship.pos.top,
            params.bullet_width,params.bullet_height)               # create bullet object specifying starting X-Y coordinates and dimensions
        self.y = float(self.rect.y)                                 # store accurate bullet Y-position (NB: X-coordinate does not change after initialization)
        self.color = params.bullet_color                            # set bullet color
        self.speed_factor = params.bullet_speed                     # set bullet speed

    def update( self ) :
        """ Method to move the bullet up the screen """
        self.y -= self.speed_factor                                 # update position variable
        self.rect.y = self.y                                        # update actual position

    def draw_bullet( self ) :
        """ Method to draw bullet on screen """
        pygame.draw.rect(self.screen,self.color,self.rect)


## FUNCTIONS ##

def update_bullets( bullets ) :
    """ Function to update bullets position and get rid of those out-of-range """
    bullets.update()                                                # update bullets position
    for item in bullets.copy() :                                    # (since items could be removed from the group, iteration is done over a copy of the actual group)
        if item.rect.bottom <= 0 :                                  # if bottom part of the bullet is above upper limit of screen...
            bullets.remove(item)                                    # delete bullets disappeared from screen