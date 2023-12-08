
'''
' File handling ship object initialization and run-time update.
'''

## LIBRARIES ##

import pygame



## CLASSES ##

class Ship( pygame.sprite.Sprite ):
    """ Ship class """

    def __init__( self, params, screen ):
        """ Initialize ship object """
        super().__init__()
        self.screen = screen                                                # copy and store main window info inside class
        self.params = params                                                # copy and store game parameters inside class
        self.image = pygame.image.load(params.ship_image)                   # load ship image
        self.rect = self.image.get_rect()                                   # get ship position/dimensions handler
        self.screen_dim = self.screen.get_rect()                            # get main window position/dimensions handler
        self.rect.centerx = self.screen_dim.centerx                         # initialize ship position to screen center on X-axis
        self.rect.bottom = self.screen_dim.bottom                           # initialize ship position to screen bottom on Y-axis
        self.apos = float(self.rect.centerx)                                # store ship float position (thus more accurate, since "self.pos.centerx" is an integer value)
        self.moving_right = False                                           # initialize right-moving flag
        self.moving_left = False                                            # initialize left-moving flag
        self.moving_invert = False                                          # (see NOTE#2 in "main_game.py" for details)

    def update( self, speedup_fct ):
        """ Update ship (center) position according to movement flag """
        if not(self.moving_invert) and self.moving_right \
            and self.rect.right < self.screen_dim.right :
            self.apos += self.params.ship_speed*speedup_fct
        elif self.moving_left and self.rect.left > 0 :                      # if ship is moving left and its previous position is still above minumum screen limit...
            self.apos -= self.params.ship_speed*speedup_fct                 # decrease ship internal position (float value) on X-axis by the step defined in "settings.c"
        self.rect.centerx = self.apos                                       # update ship actual position (integer value)
        
    def blitme( self ):
        """ Draw ship object at its current location """
        self.screen.blit(self.image,self.rect)

    def center_ship(self):
        """ Reset the ship at the center of X.axis """
        self.apos = self.screen_dim.centerx
