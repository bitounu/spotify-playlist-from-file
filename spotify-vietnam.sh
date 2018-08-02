#!/bin/bash

if [ ! -f ./creds ]; then
        echo "Ceredentials not found!"
else
        . ./creds
fi

PLAYLIST="Vietnam Soundtrack"

# --------------------------------
# ADD PLAYLIST
#curl -X POST "https://api.spotify.com/v1/users/$USER/playlists" -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" --data "{\"name\":\"$PLAYLIST\", \"public\":false}"

PLAYLIST_ID=""
# --------------------------------
# ADD SONG TO PLAYLIST
# Parameters:
# uris: 
#   coma separated list of songs in following format: spotify:track:id,spotify:track:id
#   colon in url is iencoded as %3A
#   nie wiecej niz 100 piosenek w jednym wywolaniu
#   najlepiej wiec wywolac po stworzeniu listy piosenek
# position
    pozycja na ktorej ma sie pojawic piosenka na playliście
    jeśli parametr jest pominiety

#curl -X "POST" "https://api.spotify.com/v1/users/$USER/playlists/$PLAYLIST_ID/tracks?position=$i&uris=spotify%3Atrack%3A4iV5W9uYEdYUVa79Axb7Rh%2Cspotify%3Atrack%3A1301WleyT98MSxVHPZCA6M" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN"
