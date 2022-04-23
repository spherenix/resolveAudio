#!/bin/bash

## Author: Tito Valentin
## Date: 20220423
## Title: resolveAudio.sh
## Description: This script is used to convert AAC audio from MP4 videos \
##              to PCM format in order for resolve to be able to work with \
##              the audio

mkdir tmpTrash

for v in *.MP4
do
    ffmpeg -i "$v" -c:v copy -c:a pcm_s32le "$(basename -- "$v" .MP4).mov"
done

mv -- *.MP4 tmpTrash
