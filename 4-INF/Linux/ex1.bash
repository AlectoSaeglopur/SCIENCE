#!/bin/bash
echo "Enter modulation : "
read KEY				# waiting for input key				
case $KEY in
1 | F )  echo "FSK selected!";;   	# both "1" or "F" is valid for this entry
2 | P )  echo "PSK selected!";;
3 | A )  echo "ASK selected!";;
*) echo "Invalid modulation, try again.";;
esac
