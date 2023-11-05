
'''
' File handling ship object initialization and run-time update.
'''

## LIBRARIES ##

import pygame


## CLASSES ##

class Ship( ):
    """ Ship class """

    def __init__( self, params, screen ):
        """ Initialize ship object """
        self.screen = screen                                        # copy and store main window info inside class
        self.params = params                                        # copy and store game parameters inside class
        # Load ship image and set its initial position
        self.image = pygame.image.load(params.ship_image)           # load ship image
        self.pos = self.image.get_rect()                            # get ship position/dimensions handler
        self.screen_dim = self.screen.get_rect()                    # get main window position/dimensions handler
        self.pos.centerx = self.screen_dim.centerx                  # initialize ship position to screen center on X-axis
        self.pos.bottom = self.screen_dim.bottom                    # initialize ship position to screen bottom on Y-axis
        self.apos = float(self.pos.centerx)                         # store ship float position (thus more accurate, since "self.pos.centerx" has an integer value)
        # Initialize movement flags
        self.moving_right = False
        self.moving_left = False
        self.moving_invert = False                                  # (see NOTE#2 in "main_game.py" for details)

    def update( self ):
        """ Update ship (center) position according to movement flag """
        if not(self.moving_invert) and self.moving_right \
            and self.pos.right < self.screen_dim.right :
            self.apos += self.params.ship_speed
        elif self.moving_left and self.pos.left > 0 :               # if ship is moving left and its previous position is still above minumum screen limit...
            self.apos -= self.params.ship_speed                     # decrease ship internal position (float value) on X-axis by the step defined in "settings.c"
        self.pos.centerx = self.apos                                # update ship actual position (integer value)
        
    def blitme( self ):
        """ Draw ship object at its current location """
        self.screen.blit(self.image, self.pos)