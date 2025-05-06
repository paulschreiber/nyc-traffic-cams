#!/bin/bash
URL="https://webcams.nyctmc.org/api/cameras/f801cf2f-cd02-4077-aa53-99ee8a00e1ab/image"

while true
do
    NAME=`date +"%Y-%m-%d %H:%M:%S.jpg"`
    DATAPATH=`date +"data/%Y/%m/%d"`
    mkdir -p $DATAPATH
    curl -s -o "$DATAPATH/$NAME" $URL

    git add -A
    timestamp=$(date -u)
    git commit -m "Latest data: ${timestamp}" || exit 0
    git push
    sleep 30
done
