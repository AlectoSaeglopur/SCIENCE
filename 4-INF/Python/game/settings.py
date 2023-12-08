
'''
' File containing all game settings configurable by user.
'''

## LIBRARIES ##

from numpy import inf


## CLASSES ##

class Settings( ) :
    """ Settings class """

    def __init__( self ):
        """Initialize game parameters """
        # Screen settings
        self.title = 'Alien Invasion'
        self.screen_width = 1200                                            # main window width
        self.screen_height = 800                                            # main window height
        self.bg_color = 'lightcyan'                                         # main window color (e.g. 'white' equals (255,255,255) in RGB)
        # Ship settings
        self.ship_image = 'images/spaceship1.png'
        self.ship_speed = 1.0                                               # ship speed factor (see NOTE#3 in "main_game.c" for details)
        self.ship_speedup = 1.1                                             # ship speed-up factor each time entire fleet is killed
        # Bullet settings
        self.bullet_speed = 2.0                                             # bullet speed factor
        self.bullet_speedup = 1.4                                           # bullet speed-up factor each time entire fleet is killed
        self.bullet_width = 5                                               # bullet width [px]
        self.bullet_height = 15                                             # bullet height [px]
        self.bullet_color = 'darkorange'                                    # bullet color
        self.bullet_max_no = 6                                              # maximum number of bullets that can be present on screen at a time
        # Alien Settings
        self.alien_image = 'images/alien1.png'
        self.alien_xspeed = 1.0                                             # alien speed factor on X axis
        self.alien_yspeed = 10                                              # alien speed factor on Y axis (aka drop speed)
        self.alien_speedup = 1.2                                            # alien speed-up factor each time entire fleet is killed
        self.alien_direct = 1                                               # alien moving direction (+/-1 = right/left)
        self.alien_xnum_max = 7                                             # maximum number of aliens on X axis (use "inf" for no limit)
        self.alien_ynum_max = 2                                             # maximum number of aliens on Y axis (use "inf" for no limit)
        # Gameplay
        self.ship_lives = 3                                                 # overall number of ship lives per player