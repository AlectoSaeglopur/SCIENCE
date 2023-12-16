"""Get song titles and artists from Spotify playlist"""

import csv
import re

import spotipy                                                          # pip install spotipy
from spotipy.oauth2 import SpotifyClientCredentials



### PARAMETERS ###

USERNAME = 'filippo.valmori'                                                        # Spotify user ID
CLIENT_ID = 'f19afe5942e54a58b97a0a6aa0ac2f63'                                      
CLIENT_SECRET ='d1c21a071d314ae9bcadc4fd5783bee4'


OUTPUT_FILE_NAME = "track_info.csv"

# change for your target playlist
PLAYLIST_LINK = "https://open.spotify.com/playlist/6PgP1gPFnN3Jk83kSsaCFE?si=cb2d99e5e2714e83"

# authenticate session
CCD = SpotifyClientCredentials(client_id=CLIENT_ID,client_secret=CLIENT_SECRET)

# create spotify session object
session = spotipy.Spotify(client_credentials_manager=CCD)



# get uri from https link
if match := re.match(r"https://open.spotify.com/playlist/(.*)\?", PLAYLIST_LINK):
    playlist_uri = match.groups()[0]
else:
    raise ValueError("Expected format: https://open.spotify.com/playlist/...")

# get list of tracks in a given playlist (note: max playlist length 100)
tracks = session.playlist_tracks(playlist_uri)["items"]

# create csv file
with open(OUTPUT_FILE_NAME, "w", encoding="utf-8") as file:
    writer = csv.writer(file)
    
    # write header column names
    writer.writerow(["track", "artist"])

    # extract name and artist
    for track in tracks:
        name = track["track"]["name"]
        artists = ", ".join(
            [artist["name"] for artist in track["track"]["artists"]]
        )

        # write to csv
        writer.writerow([name, artists])

print(len(tracks))



def get_playlist_tracks(username,playlist_id):
    results = session.user_playlist_tracks(username,playlist_id)
    tracks = results['items']
    while results['next']:
        results = session.next(results)
        tracks.extend(results['items'])
    return tracks



track2 = get_playlist_tracks(USERNAME,PLAYLIST_LINK)
print(len(track2))

for track in track2:
    name = track["track"]["name"]
    artist = ", ".join(
            [artist["name"] for artist in track["track"]["artists"]]
        )
    print(artist)


