#!/bin/sh

COMBO=$1
echo received $COMBO
number=$(echo $COMBO | tr -cd '[[:digit:]]')
letter=$(echo $COMBO | tr -d '[[:digit:]]')
url=http://localhost/api/jukebox/tracks/$letter/$number/play
echo calling $url
curl -X POST -s $url
echo
