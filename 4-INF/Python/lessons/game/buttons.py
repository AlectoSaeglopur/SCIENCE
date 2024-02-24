
'''
' File handling buttons.
'''


## LIBRARIES ##

import pygame.font



## CLASSES ##

class Button( ) :
    """ Button class """

    def __init__( self, ai_settings, screen, msg ) :
        """ Initialize button opbject """
        self.screen = screen
        self.screen_rect = screen.get_rect()
        self.width = 200                                                    # set button width
        self.height = 50                                                    # set button height
        self.button_color = 'dodgerblue'                                    # set button background color
        self.text_color = 'ghostwhite'                                      # set button text color
        self.font = pygame.font.SysFont(None, 48)                           # set button text font and size
        self.rect = pygame.Rect(0,0,self.width,self.height)                 # create object with default coordinates
        self.rect.center = self.screen_rect.center                          # place button atthe center of screen
        self.prep_msg(msg)                                                  # set-up text to be printed on button

    def prep_msg( self, msg ) :
        """ Method to turn a message into a rendered image and center text on the button."""
        self.msg_image = self.font.render(msg, True, self.text_color, \
            self.button_color)
        self.msg_image_rect = self.msg_image.get_rect()
        self.msg_image_rect.center = self.rect.center

    def draw_button(self):
        """ Method to draw blank button and draw message """
        self.screen.fill(self.button_color, self.rect)
        self.screen.blit(self.msg_image, self.msg_image_rect)
