#! /bin/bash

#
# collect-configs.sh
#
# Copy selected config files from $HOME to $DEST for backup.
#
# Edit CONFIGS variables to select your configs, relative to $HOME.
# (avoid extra slashes, i. e. use ".ssh/config" instead of ".ssh/config/", and ".ssh" instead of ".ssh/").
#

set -e

DEST="$HOME/tmp/configs"
CONFIGS=".bash_aliases .bash_profile .bashrc .config .emacs .emacs.d .gitconfig .i3status.conf .i3 .pypirc .ssh "

# Create DEST directory if it does not exist.
mkdir -p ${DEST}

# copy the files to DEST.
for config in ${CONFIGS}; do

    # Handle nested files.
    if [ "$(basename ${config})" != "${config}" ] ; then

        # Create the directory tree up to the config file.
        mkdir -p ${DEST}/$(dirname ${config})

    fi

    # Copy the config to its destination.
    cp -r $HOME/${config} ${DEST}/${config}

done
