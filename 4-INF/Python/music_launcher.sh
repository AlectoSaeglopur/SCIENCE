#!/bin/bash

# path to script
PYSCRIPT='/home/vkn/Documents/music_launcher.py'

# script options
PYOPTION1='--size'
PYOPTION2='20'

# enter endless loop
while true
do
  # run python script with specific arguments
  python3 "${PYSCRIPT}" "${PYOPTION1}" "${PYOPTION2}"
  # print message and pause execution
  read -p "Press any key to generate a new playlist..."
  # clear shell
  clear
done

# NB #1: Make script executable via "sudo chmod +x SCRIPT.sh".
# NB #2: Run script via "./SCRIPT.sh";
# NB #3: Create a symbolic link by opening a terminal window on desktop and running 
#        "ln -s PATH_TO_SCRIPT" (e.g. PATH_TO_SCRIPT = /home/vkn/Documents/music_launcher.sh),
#        then upon launching the link select "Run in terminal".

