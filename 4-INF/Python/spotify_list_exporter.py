
'''
' Title: SPOTIFY TRACKLIST EXPORTER
' Author: Filippo Valmori
' Date: 17/12/2023
' Description: Script for exporting Spotify playlist from server to .txt file.
'''

## LIBRARIES ##

from datetime import datetime
from re import match
from spotipy import Spotify                                                                 # requires "pip install spotipy"
from spotipy.oauth2 import SpotifyClientCredentials
from sys import argv



### CONSTANTS ###

USER_NAME = 'filippo.valmori'                                                               # Spotify user ID
CLIENT_ID = 'f19afe5942e54a58b97a0a6aa0ac2f63'                                              # Spotify developer client ID (see "export_spotify_to_csv.pdf") 
CLIENT_SECRET ='d1c21a071d314ae9bcadc4fd5783bee4'                                           # Spotify developer client secret (see "export_spotify_to_csv.pdf") 
fidx = "%4d"                                                                                # index print-format
path = "H:/MUSIC/"                                                                          # output folder path (use '.' for current folder)
csep = ' || '                                                                               # separation characters between fields (artist, album, etc)



### FUNCTIONS ###

def get_playlist_link( argv ) :
    LenArg = len(argv)-1                                                                    # number of extra input arguments
    if LenArg != 1 :
        raise Exception("Invalid number of input arguments provided.")
    else :
        nldict = dict([ \
                ('athena',"https://open.spotify.com/playlist/6PgP1gPFnN3Jk83kSsaCFE?si=cb2d99e5e2714e83"), \
                ('ulysses',"https://open.spotify.com/playlist/2za8W48Yx9LvWKTO2dtenk?si=b83862898ecf4385"), \
                ('phoenix',"https://open.spotify.com/playlist/2hmOHLiNa7kWFwF9088c0T?si=b399b9b999ea41bc"), \
                ('tartaros',"https://open.spotify.com/playlist/0d3feOw4hmOBM2CxqeT3tT?si=5961409b97df4479"), \
                ('map',"https://open.spotify.com/playlist/6t1HCTWFhwO5vTBGCCaXom?si=73ec4a65cd3b45e8"), \
                ])
        name = str(argv[1])
        if name == 'all' :
            pldict = nldict
        elif name in nldict :
            link = nldict.pop(name)
            pldict = dict([(name,link)])
        else :
            raise Exception("Invalid playlist ID.")
        return pldict


def get_playlist_tracks( username, playlist_id ):
    results = session.user_playlist_tracks(username,playlist_id)
    tracks = results['items']
    while results['next']:
        results = session.next(results)
        tracks.extend(results['items'])
    return tracks



### PROCESSING ###

playlist_dict = get_playlist_link(argv)                                                     # retrieve playlists links from input argument
for playlist_name, playlist_link in playlist_dict.items() :
    ccd = SpotifyClientCredentials(client_id=CLIENT_ID,client_secret=CLIENT_SECRET)         # authenticate session
    session = Spotify(client_credentials_manager=ccd)                                       # create spotify session object
    if playlist_match := match(r"https://open.spotify.com/playlist/(.*)\?",playlist_link) :
        playlist_uri = playlist_match.groups()[0]                                           # get playlist URI from link
    else :
        raise ValueError("Expected format: https://open.spotify.com/playlist/...")
    tracklist = get_playlist_tracks(USER_NAME,playlist_link)                                # retrieve playlist tracklist
    dt = datetime.now()                                                                     # get current time/date
    fid = open(path+playlist_name+'.txt','w',encoding='utf-8')
    fid.write(" >> Spotify's "+playlist_name.upper()+' @ '+dt.strftime("%d-%b-%Y %H:%M:%S")+' <<\n\n')
    for j, track in enumerate(tracklist):
        name = track["track"]["name"]
        artist = ", ".join([artist["name"] for artist in track["track"]["artists"]])
        album = track["track"]["album"]["name"]
        year = track["track"]["album"]["release_date"]
        fid.write(fidx%(j+1)+': '+name+csep+artist+csep+album+csep+year+'\n')
    fid.close()
    print('\n >> Execution completed for "'+playlist_name.upper()+'" playlist:')
    print('    - '+str(j+1)+' files listed')



### NOTES ###

# 1. Use the script by runnig:
#    - "python spotify_exporter.py athena"
#    - "python spotify_exporter.py ulysses"
#    - "python spotify_exporter.py phoenix"
#    - "python spotify_exporter.py tartaros"
#    - "python spotify_exporter.py map"
#    Or all at once with:
#    - "python spotify_exporter.py all"

# 2. The .cache file generated after executing the script can be canceled with ho harm.
    