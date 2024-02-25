
'''
' Title: SPOTIFY TRACKLIST EXPORTER
' Author: Filippo Valmori
' Date: 17/12/2023
' Description: Script for exporting Spotify playlist from server to .txt file.
'''

## LIBRARIES ##

from datetime import datetime
from re import match
from spotipy import Spotify                                                         # requires "pip install spotipy"
from spotipy.oauth2 import SpotifyClientCredentials
from sys import argv



### CONSTANTS ###

USERNAME = 'filippo.valmori'                                                        # Spotify user ID
CLIENT_ID = 'f19afe5942e54a58b97a0a6aa0ac2f63'                                      # Spotify developer client ID (see "export_spotify_to_csv.pdf") 
CLIENT_SECRET ='d1c21a071d314ae9bcadc4fd5783bee4'                                   # Spotify developer client secret (see "export_spotify_to_csv.pdf") 
Nf = "%4d"                                                                          # index print-format
path = "H:/MUSIC/"                                                                  # output folder path (use '.' for current folder)
csep = ' || '



### FUNCTIONS ###

def get_playlist_link( argv ) :
    LenArg = len(argv)-1                                                            # number of extra input arguments
    if LenArg != 1 :
        raise Exception("Invalid number of input arguments provided.")
    else :
        name = str(argv[1])
        if name == 'athena' :
            name = '1_athena'
            link = "https://open.spotify.com/playlist/6PgP1gPFnN3Jk83kSsaCFE?si=cb2d99e5e2714e83"
        elif name == 'ulysses' :
            name = '2_ulysses'
            link = "https://open.spotify.com/playlist/2za8W48Yx9LvWKTO2dtenk?si=b83862898ecf4385"
        elif name == 'phoenix' :
            name = '3_phoenix'
            link = "https://open.spotify.com/playlist/2hmOHLiNa7kWFwF9088c0T?si=b399b9b999ea41bc"
        elif name == 'tartaros' :
            name = '4_tartaros'
            link = "https://open.spotify.com/playlist/0d3feOw4hmOBM2CxqeT3tT?si=5961409b97df4479"
        elif name == 'map' :
            name = '5_map'
            link = "https://open.spotify.com/playlist/6t1HCTWFhwO5vTBGCCaXom?si=73ec4a65cd3b45e8"
        else :
            raise Exception("Invalid playlist ID.")
        return name, link


def get_playlist_tracks( username, playlist_id ):
    results = session.user_playlist_tracks(username,playlist_id)
    tracks = results['items']
    while results['next']:
        results = session.next(results)
        tracks.extend(results['items'])
    return tracks



### PROCESSING ###

ccd = SpotifyClientCredentials(
    client_id=CLIENT_ID,client_secret=CLIENT_SECRET)                                # authenticate session
session = Spotify(client_credentials_manager=ccd)                                   # create spotify session object
PLAYLIST_ID, PLAYLIST_LINK = get_playlist_link(argv)                                # retrieve playlist link from input argument
if match := match(r"https://open.spotify.com/playlist/(.*)\?",PLAYLIST_LINK) :
    playlist_uri = match.groups()[0]                                                # get playlist URI from link
else :
    raise ValueError("Expected format: https://open.spotify.com/playlist/...")
tracklist = get_playlist_tracks(USERNAME,PLAYLIST_LINK)                             # retrieve playlist tracklist
dt = datetime.now()                                                                 # get current time/date
fid = open(path+'spotify_'+PLAYLIST_ID+'.txt','w',encoding='utf-8')
fid.write(' >> '+PLAYLIST_ID.upper()+' @ '+dt.strftime("%d-%b-%Y %H:%M:%S")+' <<\n\n')
for j, track in enumerate(tracklist):
    name = track["track"]["name"]
    artist = ", ".join([artist["name"] for artist in track["track"]["artists"]])
    album = track["track"]["album"]["name"]
    year = track["track"]["album"]["release_date"]
    fid.write(Nf%(j+1)+': '+name+csep+artist+csep+album+csep+year+'\n')
    #print(str(j+1)+': '+name+' | '+artist)
fid.close()
print(" >> Execution completed : "+str(j+1)+" files listed")



### NOTES ###

# 1. Use the script by runnig:
#    - python spotify_exporter.py athena
#    - python spotify_exporter.py ulysses
#    - python spotify_exporter.py phoenix
#    - python spotify_exporter.py tartaros
#    - python spotify_exporter.py map

# 2. The .cache file generated after executingthe script can be canceled with ho harm.