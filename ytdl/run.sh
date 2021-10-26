#!/usr/bin/env bash

# mkdir -p $HOME/Downloads/ytdl-storage
# ln -fsn $HOME/Downloads/ytdl-storage ./ytdl-storage
# cat << EOF > ytdl-storage/.gitignore
# *
# !.gitignore
# EOF

set -u
set -e

docker build -t ytdl .
google-chrome --new-window \
    https://developers.google.com/youtube/v3/docs/playlists/list?apix=true

echo "complete login in yt demo and copy auth bearer token here"
read YTAPIKEY

docker run --network=host \
    --env YTAPIKEY=$YTAPIKEY \
    --mount type=bind,source="$(pwd)",dst=/home/ytdl ytdl
sudo chown -R gabriel:gabriel ytdl-storage
