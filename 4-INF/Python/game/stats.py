
'''
' File handling statistics object initialization and methods.
'''


## CLASSES ##

class Stats( ) :
    """ Stats class """

    def __init__( self, params ) :
        """ Initialize stats object """
        self.params = params
        self.game_state = 'INACTIVE'                                        # current gamestate (can be RUNNING, PAUSED or INACTIVE)
        self.clevel = 0                                                     # current level (related to speed-up increments)
        self.cscore = 0                                                     # player current score
        self.hscore = 0                                                     # highest score reached
        self.ships_left = self.params.ship_lives-1
        self.level = 0
        self.cscore = 0

    def reset_stats( self ) :
        """ Method to reset statistics for each new player """
        self.ships_left = self.params.ship_lives-1
        self.clevel = 0                                                     # reset level
        self.cscore = 0
    
    def increase_level( self ) :
        """ Method to increase the speed-up counter """
        self.clevel += 1