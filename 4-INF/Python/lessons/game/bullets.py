
'''
' File handling bullet objects (fired by ship) initialization and run-time update.
'''


## LIBRARIES ##

import pygame
from pygame.sprite import Sprite
from aliens import create_fleet



## CLASSES ##

class Bullet( Sprite ):
    """ Bullet class """

    def __init__( self, params, screen, ship ) :
        """ Initialize bullet object """
        super(Bullet, self).__init__()                                      # (see NOTE#4 in "main_game.c" for details)
        self.screen = screen                                                # store screen info into class
        self.rect = pygame.Rect(ship.rect.centerx,ship.rect.top,
            params.bullet_width,params.bullet_height)                       # create bullet object specifying starting X-Y coordinates and dimensions
        self.y = float(self.rect.y)                                         # store accurate bullet Y-position (NB: X-coordinate does not change after initialization)
        self.color = params.bullet_color                                    # set bullet color
        self.speed_factor = params.bullet_speed                             # set bullet speed

    def update( self, speedup_fct ) :
        """ Method to move the bullet up the screen """
        self.y -= self.speed_factor*speedup_fct                             # update position variable
        self.rect.y = self.y                                                # update actual position

    def draw_bullet( self ) :
        """ Method to draw bullet on screen """
        pygame.draw.rect(self.screen,self.color,self.rect)



## FUNCTIONS ##

""" Function check collisions between bullets and aliens """
def check_collisions( args ) :
    collisions = pygame.sprite.groupcollide(
        args['bullets'],args['aliens'],True,True)                           # check if any bullets has hit any aliens (and, if so, get rid of both of them)
    if collisions :
        for aliens in collisions.values():
            args['stats'].cscore += args['params'].alien_points*len(aliens)* \
                (args['params'].points_speedup**args['stats'].clevel)
            args['cscore'].update()
    if len(args['aliens']) == 0 :                                           # if previous alien fleet has been all destroyed...
        args['bullets'].empty()                                             # destroy all remaining bullets
        args['stats'].increase_level()
        args['liv_lev'].update()
        create_fleet(args)                                                  # create a new fleet


def update_bullets( args ) :
    """ Function to update bullets position """
    args['bullets'].update(args['params'].alien_speedup** \
        args['stats'].clevel)                                               # update bullets position
    for blt in args['bullets'].copy() :                                     # (since items could be removed from the group, iteration is done over a copy of the actual group)
        if blt.rect.bottom <= 0 :                                           # if bottom part of the bullet is above upper limit of screen...
            args['bullets'].remove(blt)                                     # delete bullets disappeared from screen
    check_collisions(args)                                                  # check collisionsbetween bullets and aliens