# mkdir -p $HOME/Downloads/ytdl-storage
# ln -fsn $HOME/Downloads/ytdl-storage ./ytdl-storage
# cat << EOF > ytdl-storage/.gitignore
# *
# !.gitignore
# EOF

set -u
set -e

docker build --no-cache -t ytdl .
google-chrome --new-window \
    https://developers.google.com/youtube/v3/docs/playlists/list?apix=true

echo "complete login in yt demo and copy auth bearer token here"
read YTBEARERTOKEN

docker run \
    --env YTBEARERTOKEN=$YTBEARERTOKEN \
    --mount type=bind,source="$(pwd)",dst=/home/ytdl ytdl > \
    logs/$(date '+%Y-%m-%d') 2>&1
sudo chown -R gabriel:gabriel ytdl-storage
