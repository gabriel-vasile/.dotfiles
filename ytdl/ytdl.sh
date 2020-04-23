#!/usr/bin/env bash

set -u
set -e
set -o xtrace

dstFolder="ytdl-storage"

# playlists to backup
declare -a audios=(
    "https://www.youtube.com/playlist?list=PLf19ZF7ZhHCnve9ZWYsaPqf5V0ofIZCZy"
    "https://www.youtube.com/playlist?list=PLf19ZF7ZhHClBz87aTcOL5giblzAIxUFh"
    "https://www.youtube.com/playlist?list=PLf19ZF7ZhHCmQmscjN_zJL1WHg2KCc0ef"
    "https://www.youtube.com/playlist?list=PLf19ZF7ZhHCnsuXsDtIpGqulMXa7zflk3"
    "https://www.youtube.com/playlist?list=PLf19ZF7ZhHCnh0UuG-SjyYakO9RxE0DiI"
    "https://www.youtube.com/playlist?list=PLf19ZF7ZhHCnUO6WIBWzAgE64zYzN9_Xh"

)
declare -a videos=(
    "https://www.youtube.com/playlist?list=PLf19ZF7ZhHCkXtr-BkD6RuPtC74eTw2Q4"
)

for i in "${audios[@]}"
do
    youtube-dl --download-archive "archive-audio.log" \
        --ignore-errors \
        --extract-audio \
        --audio-format mp3 \
        --xattrs \
        --yes-playlist \
        -o "$dstFolder/%(playlist)s/%(title)s.%(ext)s" \
        "$i"
done

for i in "${videos[@]}"
do
    youtube-dl --download-archive "archive-video.log" \
        --ignore-errors \
        --xattrs \
        --yes-playlist \
        -f "best[height<=720]" \
        -o "$dstFolder/%(playlist)s/%(title)s.%(ext)s" \
        "$i"
done

# For some reason, even if the liked videos are in a playlist just like the
# other playlists above, youtube-dl refuses to download them, saying the
# playlist does not exist.
# This code calls the YT data API in order to retrieve the liked videos and then
# iterateѕ over them and downloads them.
justStarted="1"
nextPageToken=""
while [ $justStarted -gt 0 ] || ! [ $nextPageToken == 'null' ]; do
    sleep 1
    justStarted="0"
    curl -X GET \
      --compressed -s \
      "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=LL-9M-5IV4D8XwUs4ne15H-w&maxResults=50&pageToken=$nextPageToken" \
      -H "authorization: Bearer $YTAPIKEY" \
      -H 'Cache-Control: no-cache' \
      -H 'accept: application/json' \
      -H 'accept-encoding: gzip, deflate, br' \
      -H 'accept-language: ro-RO,ro;q=0.9,en-US;q=0.8,en;q=0.7' \
      -H 'authority: content.googleapis.com' \
      -H 'pragma: no-cache' \
      -H 'referer: https://content.googleapis.com/static/proxy.html?usegapi=1&jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.ro.4t_fny0jeRk.O%2Fam%3DAQc%2Fd%3D1%2Fct%3Dzgms%2Frs%3DAGLTcCOlhX81xMI7fKXIGMrilMpg_q9TkQ%2Fm%3D__features__' \
      -H 'sec-fetch-mode: cors' \
      -H 'sec-fetch-site: same-origin' \
      -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' \
      -H 'x-client-data: CIW2yQEIpbbJAQipncoBCPmfygEIqKPKAQjiqMoBCK+sygEIl63KAQjNrcoBCMuuygEIyq/KAQj3tMoB' \
      -H 'x-clientdetails: appVersion=5.0%20(X11%3B%20Linux%20x86_64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F76.0.3809.100%20Safari%2F537.36&platform=Linux%20x86_64&userAgent=Mozilla%2F5.0%20(X11%3B%20Linux%20x86_64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F76.0.3809.100%20Safari%2F537.36' \
      -H 'x-goog-encode-response-if-executable: base64' \
      -H 'x-javascript-user-agent: apix/3.0.0 google-api-javascript-client/1.1.0' \
      -H 'x-origin: https://explorer.apis.google.com' \
      -H 'x-referer: https://explorer.apis.google.com' \
      -H 'x-requested-with: XMLHttpRequest' > /tmp/liked.json

    cat /tmp/liked.json | jq -r '.items[].snippet.resourceId.videoId' >> /tmp/videoIds
    nextPageToken=$(cat /tmp/liked.json | jq -r '.nextPageToken')
done

while read v; do
    youtube-dl --download-archive "archive-liked.log" \
        --verbose \
        --ignore-errors \
        --extract-audio \
        --audio-format mp3 \
        --xattrs \
        -o "$dstFolder/liked/%(title)s.%(ext)s" \
        "https://www.youtube.com/watch?v=$v"
done </tmp/videoIds
