#!/usr/bin/env python
 
from socket import socket, AF_INET, SOCK_STREAM, SOCK_DGRAM
from numpy import zeros, float32
from time import sleep
from sys import exit
from optparse import OptionParser


IP = '127.0.0.1'							                # destination TCP/UDP server IP address
PORT = 52001								                # destination TCP/UDP server port
parser = OptionParser("%prog PARAM VALUE")	 			    # to show help message when typing ./send_TCP_UDP_msg_v2.sh -h"
(options, args) = parser.parse_args()					    # function for getting function arguments (IP_ADDRESS and PORT)
PARAM = str(args[0])							            # parse and store 1st argument (PSK mapper parameter to be modified)
VALUE = str(args[1])							            # parse and store 2nd argument (new parameter value of PSK mapper)
msg = PARAM + " " + VALUE					                # create message by concatenating strings
#print(msg)
s = socket(AF_INET,SOCK_STREAM)  					        # open socket (NB: use SOCK_STREAM for TCP or SOCK_DGRAM for UDP connection)
s.connect((IP,PORT))							            # bind IP address and port
s.send(msg)							                        # transmit message
s.close()								                    # release socket

# NB: to modify a parameter of "psk_mapper_c_bc" block call this script from command line by typing "./send_TCP_UDP_msg.sh PARAM VALUE",
# where PARAM can be "M" (modulation order), "O" (constellation offset) or "R" (constellation rotation).
# For example, "./send_TCP_UDP_msg_v2.sh M 8", "./send_TCP_UDP_msg_v2.sh O 120" or "./send_TCP_UDP_msg_v2.sh R 0". 
