
'''
' File handling statistics object initialization and methods.
'''


## CLASSES ##

class Stats( ) :
    """ Stats class """

    def __init__( self, params ):
        """ Initialize stats object """
        self.params = params
        self.reset_stats()
        self.game_state = 'INACTIVE'                                        # current gamestate (can be RUNNING, PAUSED or INACTIVE)
        self.speedup_cnt = 0                                                # speed-up counter (number of times alien fleet has been completely killed)

    def reset_stats( self ) :
        """ Method to reset statistics for each new player """
        self.ships_left = self.params.ship_lives-1
        self.speedup_cnt = 0                                                # reset speed-up counter
    
    def increase_speedup( self ) :
        """ Method to increase the speed-up counter """
        self.speedup_cnt += 1