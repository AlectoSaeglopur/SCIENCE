
'''
' Main file running the game.
'''

## LIBRARIES ##

import pygame
from pygame.sprite import Group
from settings import Settings
from ship import Ship
from io_handler import check_events, refresh_screen
from bullet import update_bullets
from alien import create_fleet, update_aliens
from stats import Stats
from button import Button



## FUNCTIONS ##

def run_game( ) :
    """ Function to initialize pygame, settings, and screen object """

    # Initialization
    pygame.init()
    params = Settings()                                                     # load prameters/settings
    screen = pygame.display.set_mode(
        (params.screen_width, params.screen_height))                        # create screen object specifying its dimensions
    pygame.display.set_caption(params.title)                                # set screen title
    ship = Ship(params,screen)                                              # create ship object
    bullets = Group()                                                       # create group storing all live bullets
    aliens = Group()                                                        # create group containing all live aliens
    stats = Stats(params)                                                   # create game statistics
    playbtn = Button(params,screen,"Play")                                  # create play-button
    args = { 'params': params,
             'screen': screen,
             'ship': ship,
             'bullets': bullets,
             'aliens': aliens,
             'stats': stats,
             'playbtn': playbtn
            }                                                               # create structure/dictionary with all objects
    create_fleet(args)                                                      # create alien fleet

    # Game infinite-loop
    while True :
        check_events(args)                                                  # check for keyboard and mouse events
        if stats.game_state == 'RUNNING' :
            ship.update(params.alien_speedup**stats.speedup_cnt)            # update ship position (according to keyboard events)
            update_bullets(args)                                            # update bullets position
            update_aliens(args)                                             # update aliens position
        refresh_screen(args)                                                # update main window and objects



## MAIN ##

run_game()



## NOTES ##

# 1. For complete project material, see here:
#    https://github.com/ehmatthes/pcc/tree/master/chapter_12/restore_points/restore_point_1_ship_moves

# 2. The "moving_invert"-attribute of the ship class is needed to improve key-pressing behaviour. In particular, it
#    allows to react to and prioritize an arrow-key (left or right) pressure even if the other is already pressed,
#    and restore the previous movement if the latest key is released.

# 3. The ship-image extension can be .jpg, .png or .bmp. First resize it to the desired dimension and then remove
#    the background (i.e. making the background transparent) through "https://www.remove.bg/upload" or other websites.

# 4. "Sprite" is PyGame built-in basic graphical element. It creates a customizable rectangular element and automatically
#    provides methods to move, jump, etc at run-time. Moreover, you can group related sprites in your game and act on all
#    the grouped elements at once (as for bullets here).
