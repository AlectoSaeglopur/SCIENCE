
### LIBRARIES ###

from datetime import datetime
from glob import glob
from os import path, remove, startfile
from random import randrange, seed
from sys import argv


### PARAMETERS ###

path_to_songs = 'H:\\MUSIC\\'
songs_extens = '.mp3'


### PROCESSING ###

# retrieve playlist length from provided terminal argumnet
if len(argv)-1 != 1:
  error_msg = "Invalid number of input arguments provided (expected x1)."
  raise Exception(error_msg)
else :
  playlist_len = int(argv[1])
# link random seed to current date-time
seed(datetime.now().timestamp())
# get list of all songs with specific extension within specified folder
all_songs_list = glob(path_to_songs + '*' + songs_extens)
all_songs_len = len(all_songs_list)
# randomly pick songs from list
cnt = 0
playlist_songs = []
while cnt < playlist_len :
  idx = randrange(all_songs_len)
  new_song = all_songs_list[idx]
  if new_song not in playlist_songs :
    playlist_songs.append(new_song)
    cnt += 1
# generate .m3u playlist file
playlist_text = ''
playlist_recap = '\n'
for idx, song in enumerate(playlist_songs) :
  playlist_text += str(song) + '\n'
  playlist_recap += ' ' + str(idx+1) + '. ' + str(song[len(path_to_songs):-len(songs_extens)]) + '\n'
playlist_name = 'vkn_playlist.m3u'
with open(playlist_name, 'w') as fid:
  fid.write(playlist_text)
# print playlist recap on terminal 
print(playlist_recap)
# start playlist with predefined app (e.g. Windows Media Player)
startfile(playlist_name)
# delete playlist after launching
if path.exists(playlist_name):
  remove(playlist_name)


### NOTES ###

# 1. To run the script:
#    - open a terminal window;
#    - type "cls && python playlist_launcher.py SIZE" (e.g. SIZE = 10).
