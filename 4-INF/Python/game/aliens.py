
'''
' File handling alien objects initialization and run-time update.
'''


## LIBRARIES ##

from pygame.image import load
from pygame.mouse import set_visible
from pygame.sprite import Sprite, spritecollideany
from time import sleep



## CLASSES ##

class Alien( Sprite ) :
    """ Alien class """

    def __init__( self, params, screen ) :
        """ Initialize alien object """
        super(Alien, self).__init__()
        self.screen = screen
        self.params = params                                                # retrieve settings
        self.image = load(params.alien_image)                               # load alien image
        self.rect = self.image.get_rect()                                   # get ship position/dimensions handler
        self.rect.x = self.rect.width                                       # initialize alien x-position on the left of the screen
        self.rect.y = self.rect.height                                      # initialize alien y-position on the top of the screen
        self.x = float(self.rect.x)                                         # store alien float position (thus more accurate, since "self.rect.x" is an integer value)

    def check_edges( self ) :
        """ Function returning True if alien is at screen edge """
        screen_rect = self.screen.get_rect()
        Ret = False
        if self.rect.right >= screen_rect.right or self.rect.left <= 0 :
            Ret = True
        return Ret

    def update( self, speedup_fct ):
        """ Move alien to right or left """
        self.x += self.params.alien_direct*self.params.alien_xspeed*speedup_fct
        self.rect.x = self.x

    def blitme(self):
        """ Draw alien at its current location """
        self.screen.blit(self.image,self.rect)



## FUNCTIONS ##

def get_aliens_xnum( params, al_width ) :
    """ Function to calculate the number of aliens fitting in a single row on X axis """
    av_xspace = params.screen_width-2*al_width                              # available screaan space on X axis for aliens placement
    al_xnum = int(av_xspace/(2*al_width))                                   # maximum number of aliens that can be placed on a single row
    if al_xnum > params.alien_xnum_max :
        al_xnum = params.alien_xnum_max
    return al_xnum


def get_aliens_ynum( params, ship_height, al_height ) :
    """ Function to calculate the number of alien rows fitting the screen on Y axis """
    av_yspace = (params.screen_height-(3*al_height)-ship_height)
    al_ynum = int(av_yspace/(2*al_height))
    if al_ynum > params.alien_ynum_max :
        al_ynum = params.alien_ynum_max
    return al_ynum


def create_alien( args, al_xcnt, al_ycnt ) :
    """ Create an alien and place it into row """
    alien = Alien(args['params'],args['screen'])
    al_width = alien.rect.width
    alien.x = al_width+2*al_width*al_xcnt
    alien.rect.x = alien.x
    alien.rect.y = alien.rect.height+2*alien.rect.height*al_ycnt
    args['aliens'].add(alien)


def create_fleet( args ) :
    """ Function to create an alien fleet on XY-axes """
    alien = Alien(args['params'],args['screen'])                            # create a single alien instance
    al_width = alien.rect.width                                             # get alien object width
    al_xnum = get_aliens_xnum(args['params'],al_width)
    al_ynum = get_aliens_ynum(args['params'], \
        args['ship'].rect.height,alien.rect.height)
    for al_ycnt in range(al_ynum) :
        for al_xcnt in range(al_xnum) :                                     # create the first row of aliens
            create_alien(args,al_xcnt,al_ycnt)


def check_fleet_edges( params, aliens ) :
    """ Function to check if any aliens have reached an edge in order to change fleetdirection """
    for alien in aliens.sprites() :
        if alien.check_edges() :
            change_fleet_direction(params,aliens)
            break


def change_fleet_direction( params, aliens ) :
    """ Function to drop the fleet and change its direction on X axis """
    for alien in aliens.sprites():
        alien.rect.y += params.alien_yspeed
    params.alien_direct *= -1


def update_aliens( args ) :
    """ Function to update all aliens position within the fleet and detect collisions """
    check_fleet_edges(args['params'],args['aliens'])
    check_hit_failure(args)
    args['aliens'].update(args['params'].alien_speedup** \
        args['stats'].clevel)
    

def reset_screen( args ) :
    """ Function to clear screen and redraw new ship and alien fleet """
    args['aliens'].empty()                                                  # empty aliens group
    args['bullets'].empty()                                                 # empty bullets group
    create_fleet(args)                                                      # create a new alien fleet
    args['ship'].center_ship() 
    sleep(0.5)


def ship_hit( args ) :
    """ Function invoked when ship is hit by aliens """
    if args['stats'].ships_left > 0 :
        args['stats'].ships_left -= 1                                       # decrease ship lives
        reset_screen(args)                                                  # pause game for 500 ms
        args['liv_lev'].update()
    else :
        args['stats'].game_state = 'INACTIVE'                               # set game state as INACTIVE if no lives left
        if args['stats'].cscore > args['stats'].hscore :
            args['stats'].hscore = args['stats'].cscore                     # update highest score
            args['hscore'].update()
        set_visible(True)                                                   # make mouse visible again when game is inactive


def check_bottom_hit( screen, aliens ) :
    """ Function to check if any alien has reached the screen bottom """
    flag = False
    screen_rect = screen.get_rect()
    for alien in aliens.sprites():
        if alien.rect.bottom >= screen_rect.bottom :
            flag = True
            break
    return flag


def check_hit_failure( args ) :
    """ Function to check if any failure condition occurred """
    if spritecollideany(args['ship'],args['aliens']) or \
        check_bottom_hit(args['screen'],args['aliens']) :                   # check for alien-ship collisions or if aliens have reached the screen bottom
        ship_hit(args)
