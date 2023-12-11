
'''
' File handling display board object initialization and run-time update.
'''


## LIBRARIES ##

import pygame.font



## CLASSES ##

class Board( ) :
    """ Board class """

    def __init__( self, params, screen, stats, type ) :
        """ Initialize board object """
        self.screen = screen
        self.screen_rect = screen.get_rect()
        self.params = params
        self.stats = stats
        self.type = type
        self.text_color = 'black'
        self.font = pygame.font.SysFont(None,48)                            # set text-board font and size
        self.update()

    def update( self ) :
        """ Turn the score into a rendered image """
        if self.type == 'cscore' :
            rounded_score = int(round(self.stats.cscore,-1))
            text_str = "SC: {:,}".format(rounded_score)                     # to place "," every thousand
        elif self.type == 'hscore' :
            rounded_score = int(round(self.stats.hscore,-1))
            text_str = "HC: {:,}".format(rounded_score)
        elif self.type == 'liv_lev' :
            text_str = "UP: " + str(self.stats.ships_left) + \
                " | LV: " + str(self.stats.clevel+1)
        self.text_image = self.font.render(text_str,True, \
            self.text_color,self.params.bg_color)
        self.text_rect = self.text_image.get_rect()
        self.text_rect.top = 10                                             # set text-board y-coordinate
        if self.type == 'hscore' :
            self.text_rect.right = self.screen_rect.right-20                # display current score at the top-right of screen
        elif self.type == 'cscore' :
            self.text_rect.left = self.screen_rect.left+20                  # display highest score at the top-left of screen
        elif self.type == 'liv_lev' :                 
            self.text_rect.left = self.screen_rect.centerx-100
                          # display level+lives at the top-center of screen

    def show( self ) :
        """ Draw board into the screen """
        self.screen.blit(self.text_image,self.text_rect)