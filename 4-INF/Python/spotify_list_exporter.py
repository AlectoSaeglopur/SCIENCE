
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
from tabulate import tabulate                                                               # requires "pip install tabulate"



### CONSTANTS ###

USER_NAME = 'filippo.valmori'                                                               # spotify user ID
CLIENT_ID = 'f19afe5942e54a58b97a0a6aa0ac2f63'                                              # spotify developer client ID (see "export_spotify_to_csv.pdf") 
CLIENT_SECRET ='d1c21a071d314ae9bcadc4fd5783bee4'                                           # spotify developer client secret (see "export_spotify_to_csv.pdf") 
max_tab_width = 50                                                                          # threshold number of title/artist characters for truncation
out_path = "H:/MUSIC/"                                                                      # output folder path where to save .log file (use '.' for current folder)


### FUNCTIONS ###

def get_playlist_link( argv ) :
    LenArg = len(argv)-1                                                                    # number of extra input arguments
    if LenArg != 1 :
        raise Exception("Invalid number of input arguments provided.")
    else :
        nldict = dict([ \
                ('1_athena',"https://open.spotify.com/playlist/6PgP1gPFnN3Jk83kSsaCFE?si=cb2d99e5e2714e83"), \
                ('2_ulysses',"https://open.spotify.com/playlist/2za8W48Yx9LvWKTO2dtenk?si=b83862898ecf4385"), \
                ('3_phoenix',"https://open.spotify.com/playlist/2hmOHLiNa7kWFwF9088c0T?si=b399b9b999ea41bc"), \
                ('4_tartaros',"https://open.spotify.com/playlist/0d3feOw4hmOBM2CxqeT3tT?si=5961409b97df4479"), \
                ('5_map',"https://open.spotify.com/playlist/6t1HCTWFhwO5vTBGCCaXom?si=73ec4a65cd3b45e8"), \
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

# retrieve playlists links from input argument
playlist_dict = get_playlist_link(argv)       
# loop over each playlist requested by user                                              
for playlist_name, playlist_link in playlist_dict.items() :
    # authenticate session
    ccd = SpotifyClientCredentials(client_id=CLIENT_ID,client_secret=CLIENT_SECRET)
    # create spotify session object
    session = Spotify(client_credentials_manager=ccd)
    if playlist_match := match(r"https://open.spotify.com/playlist/(.*)\?",playlist_link) :
        # get playlist URI from link
        playlist_uri = playlist_match.groups()[0]
    else :
        raise ValueError("Expected format: https://open.spotify.com/playlist/...")
    # retrieve playlist tracklist
    tracklist = get_playlist_tracks(USER_NAME,playlist_link)
    # get current time/date
    date_time = datetime.now()
    info_list = []
    # retrieve fields for each track
    for j, track in enumerate(tracklist):
        title = track["track"]["name"]
        artist = ", ".join([artist["name"] for artist in track["track"]["artists"]])
        album = track["track"]["album"]["name"]
        year = track["track"]["album"]["release_date"]
        info_list.append([j+1, title, artist, album, year])
    # save playlist info in to .log file
    with open(out_path + playlist_name + '.log', 'w', encoding='utf-8') as fid :
      fid.write('\n>> Spotify "' + playlist_name.upper() + '" playlist: ' + str(j+1) + " tracks")
      fid.write("\n>> Generation date/time: " + date_time.strftime("%d-%b-%Y @ %H:%M:%S") + '\n\n')
      list_headers = ["Index", "Title", "Artist", "Album", "Year"]
      list_text = tabulate(info_list, headers=list_headers, tablefmt="grid",
        maxcolwidths=[max_tab_width for _ in range(len(list_headers))])
      fid.write(list_text)
    # print on terminal the playlist exporting outcome 
    print('\n >> Execution completed for "'+playlist_name.upper()+'" playlist:')
    print('    - '+str(j+1)+' files listed')



### NOTES ###

# 1. Use the script by runnig:
#    - "python spotify_exporter.py 1_athena"
#    - "python spotify_exporter.py 2_ulysses"
#    - "python spotify_exporter.py 3_phoenix"
#    - "python spotify_exporter.py 4_tartaros"
#    - "python spotify_exporter.py 5_map"
#    Or all at once with:
#    - "python spotify_exporter.py all"

# 2. The .cache file generated after executing the script can be canceled with ho harm.
    