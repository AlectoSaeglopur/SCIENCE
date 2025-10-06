
### LIBRARIES ###

from datetime import datetime
from glob import glob
from os import path, remove
from platform import system
from random import randrange, seed
from re import search, IGNORECASE
from subprocess import call
from sys import argv
from time import sleep



### PARAMETERS ###

path_to_songs_win = 'C:\\Users\\VKN\\Music\\'                   # absolute or relative path to songs folder for Windows OS
path_to_songs_lnx = '/home/vkn/Music/'                          # absolute or relative path to songs folder for Linux OS
songs_extens = '.mp3'                                           # songs extension to be filtered



### CONSTANTS ###

size_type = "--size"                                            # type id for random fixed-sized playlist
pattern_type = "--pattern"                                      # type id for string pattern playlist
playlist_name = 'vkn_playlist.m3u'                              # name of temporary .m3u playlist
expected_os = 'Linux'                                           # expected OS
remove_delay = 0.2                                              # delay between playlist launch an removal



### PROCESSING ###

# set variables and load additional libraries according to detected OS
detected_os = system()
print(detected_os)
if detected_os == 'Linux' :
  path_to_songs = path_to_songs_lnx
  from subprocess import call
elif detected_os == 'Windows' :
  path_to_songs = path_to_songs_win
  from os import startfile
else :
  err_msg = 'Invalid OS detected: ' + detected_os
  raise Exception(err_msg)
# retrieve playlist type from 1st terminal argument
if len(argv)-1 < 2:
  error_msg = "Invalid number of input arguments provided"
  raise Exception(error_msg)
else :
  playlist_type = argv[1]
# get list of all songs with specific extension within specified folder
all_songs_list = glob(path_to_songs + '*' + songs_extens)
playlist_songs = []
# 1. case for size playlist
if playlist_type == size_type :
  # retrieve playlist size from 2nd terminal argument
  playlist_len = int(argv[2])
  # link random seed to current date-time
  seed(datetime.now().timestamp())
  # randomly pick songs from list
  cnt = 0
  all_songs_len = len(all_songs_list)
  while cnt < playlist_len :
    idx = randrange(all_songs_len)
    new_song = all_songs_list[idx]
    if new_song not in playlist_songs :
      playlist_songs.append(new_song)
      cnt += 1
# 2. case for pattern-playlist
elif playlist_type == pattern_type :
  # retrieve pattern string 2nd+ arguments
  pattern_string = ' '.join(argv[2:])
  for new_song in all_songs_list:
    # search pattern string within current song title ("IGNORECASE" = case-insensitive)
    if search(pattern_string, new_song[len(path_to_songs) : -len(songs_extens)], IGNORECASE) :
      playlist_songs.append(new_song)
else :
  error_msg = 'Invalid playlist type (' + pattern_type + ')'
  raise Exception(error_msg)
# generate .m3u playlist file
playlist_text = ''
playlist_recap = '\n'
for idx, song in enumerate(playlist_songs) :
  playlist_text += str(song) + '\n'
  playlist_recap += ' ' + str(idx+1) + '. ' + str(song[len(path_to_songs):-len(songs_extens)]) + '\n'
with open(playlist_name, 'w') as fid:
  fid.write(playlist_text)
# print playlist recap on terminal 
print(playlist_recap)
# start playlist with predefined app (e.g. MediaPlayer or Celluloid)
if detected_os == 'Windows' :
  startfile(playlist_name)
else :
  call(['open', playlist_name])
# delete playlist after launching
if path.exists(playlist_name) :
  sleep(remove_delay)
  remove(playlist_name)



### NOTES ###

# 1. How to use this script:
#    - to create and launch a random playlist of specified size >>
#       "python playlist_launcher.py --size SIZE" (e.g. SIZE = 20);
#    - to create and lauch a playlist with all songs whose title matches a specified patter >>
#       "python playlist_launcher.py --pattern STRING" (e.g. STRING = red hot).
