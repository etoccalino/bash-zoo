#! /bin/bash

set -e

#
# install.sh
#

# Run from root of the bash-zoo
cd $(dirname ${0})

# Replace $HOME and avoid using ~ for easier debugging
HOME="$HOME"

#
# Install the $HOME/bin programs; this will be added to the PATH
#
if [ -d $HOME/bin ] ; then
    echo "skipping the $HOME/bin directory (you'll have to copy it manually)"
else
    echo -n "copying to $HOME/bin... "
    cp -r bin $HOME/bin
    echo "done."
fi

#
# Install the dot-files, appending to existing files
#
ls -a env | tail -n +3 | grep -v \~ | while read dotfile; do

    if [ -e $HOME/${dotfile} ] ; then
        # If it exists already, append if there's something different, skip otherwise
        if [ -n "$(diff --brief env/${dotfile} $HOME/${dotfile})" ]; then
            echo -n "$HOME/${dotfile} exists but differs, appending (you should take a look at it)... "
            echo -e -n "\n\n#\n#\n#\n\n" >> $HOME/${dotfile}
            cat env/${dotfile} >> $HOME/${dotfile}
        else
            echo -n "skipping $HOME/${dotfile}..."
        fi
    else
        # If it does not exist, copy it
        echo -n "copying to $HOME/${dotfile}... "
        cp -f env/${dotfile} $HOME/${dotfile}
    fi
    echo "done."

done

#
# Final messages
#
echo ""
echo "NOTES:"
find messages -type f ! -name '*~' -exec cat {} \;
