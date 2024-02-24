
'''
' File containing functions to handle events and update screen.
'''


## LIBRARIES ##

from sys import exit
import pygame
from bullets import Bullet
from aliens import reset_screen


## FUNCTIONS ##

def check_key_press( args, event ) :
    """ Function to check which keyboard button has been pressed and take actions """
    if event.key == pygame.K_q:                                             # if Q key pressed...
        exit()                                                              # close the game
    elif event.key == pygame.K_p:                                           # if P key pressed...
        if args['stats'].game_state == 'RUNNING' :
            args['stats'].game_state = 'PAUSED'
        elif args['stats'].game_state == 'PAUSED' :
            args['stats'].game_state = 'RUNNING'
    elif event.key == pygame.K_LEFT :                                       # if left-arrow key pressed to move ship...
        if args['ship'].moving_right == True and \
            args['ship'].moving_left == False :
            args['ship'].moving_invert = True
        args['ship'].moving_left = True
    elif event.key == pygame.K_RIGHT :                                      # if right-arrow key pressed to move ship...
        args['ship'].moving_right = True
    elif event.key == pygame.K_SPACE :                                      # if spacebar key pressed to fire bullet...
        if len(args['bullets']) < args['params'].bullet_max_no :
            new_bullet = Bullet(args['params'],args['screen'],args['ship']) # create new bullet instance
            args['bullets'].add(new_bullet)                                 # addn ew bullet to group


def check_key_release( ship, event ) :
    """ Function to check which keyboard button has been released and take actions """
    if event.key == pygame.K_RIGHT :
        ship.moving_right = False
    elif event.key == pygame.K_LEFT :
        ship.moving_left = False
    ship.moving_invert = False


def check_events( args ) :
    """ Function to check keyboard and mouse edge-events """
    for event in pygame.event.get() :                                       # take actions for all new events occurred...
        if event.type == pygame.QUIT :                                      # if EXIT button has been clicked via mouse...
            exit()                                                          # close the game
        elif event.type == pygame.KEYDOWN :                                 # if any keyboard button has been pressed...
            check_key_press(args,event)
        elif event.type == pygame.KEYUP :                                   # if any keyboard button has been released...
            check_key_release( args['ship'], event )
        elif event.type == pygame.MOUSEBUTTONDOWN :                         # if mouse has been clicked on any scren position...
            mouse_x, mouse_y = pygame.mouse.get_pos()
            if args['stats'].game_state == 'INACTIVE' :
                check_play_button(args,mouse_x,mouse_y)


def check_play_button( args, mouse_x, mouse_y ) :
    """ Start a new game when the player clicks Play-button """
    if args['playbtn'].rect.collidepoint(mouse_x,mouse_y) :
        args['stats'].reset_stats()
        args['cscore'].update()
        args['liv_lev'].update()
        reset_screen(args)
        args['stats'].game_state = 'RUNNING'
        pygame.mouse.set_visible(False)                                     # make mouse invisible when game is running


def refresh_screen( args ) :
    """ Function to refresh screen and objects (at each loop iteration) """
    args['screen'].fill(args['params'].bg_color)                            # re-draw main window 
    args['ship'].blitme()                                                   # re-draw ship object
    args['aliens'].draw(args['screen'])                                     # re-draw aliens fleet
    for bullet in args['bullets'].sprites():
        bullet.draw_bullet()                                                # redraw bullets
    args['cscore'].show()                                                   # redraw current score-board
    args['hscore'].show()                                                   # redraw highest score-board
    args['liv_lev'].show()                                                  # redraw highest score-board
    if args['stats'].game_state == 'INACTIVE' :
        args['playbtn'].draw_button()                                       # draw the play-button on screen
    pygame.display.flip()                                                   # make the most recently drawn screen visible
