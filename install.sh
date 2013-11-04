#! /bin/bash

#
# install.sh
#
# Meant to run from the root of the zoo.
#

set -x
set -e

#
# Install the ~/bin programs; this will be added to the PATH
#
if [ -d ~/bin ] ; then
    echo -n "copying to ~/bin... "
    cp -r bin ~/bin
    echo "done."
else
    echo "skipping the ~/bin directory (you'll have to copy it manually)"
fi

#
# Install the dot-files, appending to existing files
#
ls -a env | tail -n +3 | while read dotfile; do

    if [ -n "$(diff --brief env/$dotfile ~/$dotfile)" ]; then
        echo -n "~/$dotfile exists, appending (you should take a look at it)... "
        cat env/$dotfile >> ~/$dotfile
    else
        echo -n "copying to ~/$dotfile... "
        cp -f env/$dotfile ~/$dotfile
    fi
    echo "done."

done

#
# TODO: Install the emacs configs
#
