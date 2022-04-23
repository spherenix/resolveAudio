# README

### NOTE

This script is very, very limited. This is my initial commit and I needed to solve this issue quickly for a deadline. Having said that, it has PLENTY of room for improvement to remove a lot of the limitations.

```
   1   │ #!/bin/bash
   2   │ 
   3   │ ## Author: Tito Valentin
   4   │ ## Date: 20220423
   5   │ ## Title: resolveAudio.sh
   6   │ ## Description: This script is used to convert AAC audio from MP4 videos \
   7   │ ##              to PCM format in order for resolve to be able to work with \
   8   │ ##              the audio
   9   │ 
  10   │ mkdir tmpTrash
  11   │ 
  12   │ for v in *.MP4
  13   │ do
  14   │     ffmpeg -i "$v" -c:v copy -c:a pcm_s32le "$(basename -- "$v" .MP4).mov"
  15   │ done
  16   │ 
  17   │ mv -- *.MP4 tmpTrash
```

Here is a list of limitations:
- The script expects your files to all end in .MP4 filenames. Yes, that is case sensitive
- If your files end in a different format, you must manually change that file extension from line 12, 14 and line 17 (*.MP4) to *.WHATEVER
- Since `ffmpeg` is only doing a copy, your existing *.MP4 files and the new *.mov files will take up double the space. I wrote a simple command on line 17 to move those to a folder called `tmpTrash` that's created in the same location the files are renamed. If the copied files look good after testing, you can remove that `tmpTrash` directory altogether to consolidate.
- If you DO NOT have enough space for duplicate files, you may want to add a new line in the `for loop` that removes the duplate *.MP4 file as it converts it.

There are probably more limitations but I am pressed for time at the moment and just want to share this for now.

## Usage 

To use this script, you must first make it executable:

`chmod +x resolveAudio.sh`

Once the script is executable, you can run it two different ways:

- Run the script from within the same location of all your *.MP4's. For example, if your files are in /home/user/videos, then copy the script there

OR

- Place the script in an executable location that your env $PATH recognizes. I placed mine in `/usr/local/bin` as this is the standard location in *NIX* environments.

## Improvements:

For my sanity, here are some obvious and quick improvements I'll add later:
- account for case insensitive filename extensions
- account for additional filename extensions
- clean up duplicate files
- add support for different audio/video formats


