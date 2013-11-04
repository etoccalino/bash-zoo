#! /bin/bash

set -e

#
# install.sh
#
# Meant to run from the root of the zoo.
#

#
# Install the ~/bin programs; this will be added to the PATH
#
if [ -d ~/bin ] ; then
    echo "skipping the ~/bin directory (you'll have to copy it manually)"
else
    echo -n "copying to ~/bin... "
    cp -r bin ~/bin
    echo "done."
fi

#
# Install the dot-files, appending to existing files
#
ls -a env | tail -n +3 | grep -v \~ | while read dotfile; do

    if [ -e ~/$dotfile ] ; then
        # If it exists already, append if there's something different, skip otherwise
        if [ -n "$(diff --brief env/$dotfile ~/$dotfile)" ]; then
            echo -n "~/$dotfile exists but differs, appending (you should take a look at it)... "
            cat env/$dotfile >> ~/$dotfile
        else
            echo -n "skipping ~/$dotfile..."
        fi
    else
        # If it does not exist, copy it
        echo -n "copying to ~/$dotfile... "
        cp -f env/$dotfile ~/$dotfile
    fi
    echo "done."

done

#
# TODO: Install the emacs configs
#

#
# Final messages
#
echo ""
echo "NOTES:"
find messages -type f | grep -v \~ | xargs cat
