#! /bin/bash

#
# Wrap mplayer to make it "just play" what I tell it to play.
#
# Will play "music files" under a directory, a playlist or a single file.
# To see which files are considered a "music file" see the FORMATS variable.
#

set -e

ME=$(basename $0)
TARGET=$1

FORMATS="*.ogg *.mp3 *.aac *.OGG *.MP3 *.AAC"
HINTS="Ogg MPEG"

[ "-h" = "${TARGET}" ] || [ "--help" = "${TARGET}" ] || [ -z "${TARGET}" ] && echo "Usage: ${ME} [ playlist | song file | directory ]"

if [ -d "${TARGET}" ]; then
    # The target is a directory: play all "music" files in it, if there are any.
    cd "${TARGET}"
    (( $(ls ${FORMATS} 2>/dev/null | wc -l) > 0 )) && mplayer -quiet ${FORMATS}
else
    if [ -f "${TARGET}" ]; then
        # The file might be a music file of a list.
        TARGET_IS_MUSICFILE=false
        for HINT in ${HINTS}; do
            (( $(file "${TARGET}" | grep ${HINT} | wc -l) > 0 )) && TARGET_IS_MUSICFILE=true
        done

        if ${TARGET_IS_MUSICFILE} ; then
            # The target is a file: play it.
            mplayer -quiet ${TARGET}
        else
            # The target could still be a playlist... try to play it.
            mplayer -quiet -playlist "${TARGET}"
        fi
    fi
fi
