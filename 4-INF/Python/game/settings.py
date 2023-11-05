
'''
' File containing all game settings configurable by user.
'''

## CLASSES ##

class Settings( ):
    """ Settings class """

    def __init__( self ):
        """Initialize game parameters """
        # Screen settings
        self.title = 'Alien Invasion'
        self.screen_width = 1200                                    # main window width
        self.screen_height = 800                                    # main window height
        self.bg_color = 'lightcyan'                                 # main window color (e.g. 'white' equals (255,255,255) in RGB)
        # Ship settings
        self.ship_image = 'images/s2.png'
        self.ship_speed = 1.0                                       # ship speed factor (see NOTE#3 in "main_game.c" for details)
        # Bullet settings
        self.bullet_speed = 1.0                                     # bullet speed factor
        self.bullet_width = 3                                       # bullet width [px]
        self.bullet_height = 15                                     # bullet height [px]
        self.bullet_color = 'darkorange'                            # bullet color
        self.bullet_max_no = 6                                      # maximum number of bullets that can be present on screen at a time
