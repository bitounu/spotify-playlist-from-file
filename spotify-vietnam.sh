#!/bin/bash

# check if credentials file is in same folder
# if yes, read it
if [ ! -f ./creds ]; then
        echo "Ceredentials not found!"
else
        . ./creds
fi

PLAYLIST_NAME="Vietnam Soundtrack"
# make playlist public
PLAYLIST_PUBLIC="true"


# --------------------------------
# ADD PLAYLIST
PLAYLIST_ID=`curl -s -X POST "https://api.spotify.com/v1/users/$USER/playlists" -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" --data "{\"name\":\"$PLAYLIST_NAME\", \"public\":$PLAYLIST_PUBLIC}" | grep -m1 id | cut -d: -f2 | tr -d [:punct:]`

# --------------------------------
# ADD SONG TO PLAYLIST
# Parameters:
# uris: 
#   coma separated list of songs in following format: spotify:track:id,spotify:track:id
#   colon in url is iencoded as %3A
#   no more than 100 songs in one request
#   better call once when list of songs is ready
# position
#   position for the song on playlist
#   song is APPENDED if this parameter is ommitted

echo "PLAYLIST_NAME: $PLAYLIST_NAME"
echo "PLAYLIST_ID: $PLAYLIST_ID"

curl -s -X "POST" "https://api.spotify.com/v1/users/$USER/playlists/$PLAYLIST_ID/tracks?uris=spotify%3Atrack%3A5FQ7JGp1moW918V80hUGfK" -H "Content-Length: 0" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN"
