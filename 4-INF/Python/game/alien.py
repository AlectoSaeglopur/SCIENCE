
'''
' File handling alien objects initialization and run-time update.
'''

## LIBRARIES ##

import pygame
from pygame.sprite import Sprite


## CLASSES ##

class Alien( Sprite ) :
    """ Alien class """

    def __init__( self, params, screen ) :
        """ Initialize alien object """
        super(Alien, self).__init__()
        self.screen = screen
        self.params = params                                                # retrieve settings
        self.image = pygame.image.load(params.alien_image)                  # load alien image
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

    def update( self ):
        """ Move alien to right or left """
        self.x += self.params.alien_direct*self.params.alien_xspeed
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

def create_alien( params, screen, aliens, al_xcnt, al_ycnt ) :
    """ Create an alien and place it into row """
    alien = Alien(params,screen)
    al_width = alien.rect.width
    alien.x = al_width+2*al_width*al_xcnt
    alien.rect.x = alien.x
    alien.rect.y = alien.rect.height+2*alien.rect.height*al_ycnt
    aliens.add(alien)

def create_fleet( params, screen, aliens, ship ) :
    """ Function to create an alien fleet on XY-axes """
    alien = Alien(params,screen)                                            # create a single alien instance
    al_width = alien.rect.width                                             # get alien object width
    al_xnum = get_aliens_xnum(params,al_width)
    al_ynum = get_aliens_ynum(params,ship.pos.height,alien.rect.height)
    for al_ycnt in range(al_ynum) :
        for al_xcnt in range(al_xnum) :                                     # create the first row of aliens
            create_alien(params,screen,aliens,al_xcnt,al_ycnt)

def check_fleet_edges( params, aliens ) :
    """ Function to check if any aliens have reached an edge in order to change fleetdirection """
    for alien in aliens.sprites() :
        if alien.check_edges() :
            change_fleet_direction(params,aliens)
            break

def change_fleet_direction(params, aliens) :
    """Function to drop the fleet and change its direction on X axis """
    for alien in aliens.sprites():
        alien.rect.y += params.alien_yspeed
    params.alien_direct *= -1

def update_aliens( params, aliens ) :
    """ Function to update all aliens position within the fleet """
    check_fleet_edges(params,aliens)
    aliens.update()