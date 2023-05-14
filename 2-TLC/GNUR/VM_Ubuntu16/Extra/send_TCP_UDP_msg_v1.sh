#!/usr/bin/env python
 
from socket import socket, AF_INET, SOCK_STREAM, SOCK_DGRAM
from numpy import zeros, float32
from time import sleep
from sys import exit
from optparse import OptionParser
 
Npkt = 10													# overall number of packats to be transmitted
Delay = .5 													# delay between consecutive transmitted packets [s]
Type = 'BYT'												# type of packets ('CHA' for string, 'BYT' for bytes, 'FLO' for float)

parser = OptionParser("%prog IP_ADDRESS PORT")	 			# to show help message when typing ./send_TCP_UDP_msg_v1.sh -h"
(options, args) = parser.parse_args()						# function for getting function arguments (IP_ADDRESS and PORT)
IP = str(args[0])											# parse and store 1st argument (TCP/UDP server IP address)			
PORT = int(args[1])											# parse and store 2nd argument (TCP/UDP server port)
#print(IP)
#print(PORT)
if Type == 'CHA' :											# CHAR MESSAGE
	msg = "VKN rulez!"										
elif Type == 'BYT' :										# UINT8 MESSAGE
	pkt = b'\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0A\x0B\x0C'
	msg = str(pkt)											# convert to string since the following socket block accepts only strings as input
elif Type == 'FLO' :
	msg = zeros(5,dtype=float32)							# FLOAT MESSAGE
	msg[1] = 33.3
else :
	exit('ERROR: Invalid data type!')
s = socket(AF_INET,SOCK_STREAM)  							# open socket (NB: use SOCK_STREAM for TCP or SOCK_DGRAM for UDP connection)
s.connect((IP,PORT))										# bind IP address and port
for i in range(Npkt):
	s.send(msg)												# transmimt packet
	sleep(Delay)											# wait for next packet transmission
s.close()													# release socket

# NB: call function from command line by typing, for instance, "./send_TCP_UDP_msg_v1.sh 127.0.0.1 52001"
