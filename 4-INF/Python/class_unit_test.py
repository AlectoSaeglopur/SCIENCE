
"""
" Script for performing unit-testing on Python class.
" Filippo Valmori
" 16/05/2023
"""

import unittest                                                 # import built-in library for unit testing


class Calculator( ) :
    """ Class for calculator """
    # no need for __init__ here, since class has no members
    
    def power( self, base, exp ) :
        """ Method for calculating n-th powers """
        return base**exp

    def root( self, base, exp ) :
        """ Method for calculating n-th roots """
        return base**(1/exp)


class Test_Calculator( unittest.TestCase ) :
    """ Class for testing class 'Calculator' """
    def setUp( self ) :
        self.mycalc = Calculator()                              # create local instance used for unit testing

    def test_power( self ) :
        self.assertEqual(64,self.mycalc.power(2,6))             # verify that 2^6 returns 64
        self.assertEqual(27,self.mycalc.power(3,3))             # verify that 3^3 returns 27
    
    def test_root( self ) :
        self.assertEqual(2,self.mycalc.root(16,4))              # verify that 16^1/4 returns 2

unittest.main()                                                 # run unit testing