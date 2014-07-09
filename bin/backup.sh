#! /bin/bash

#
# backup.sh
#
# Modify TO_BACKUP for the host.
#
# Depends on:
#   * obnam
#   * gpg-agent or equivalent (see obnam docs)
#
# Assumes:
#   * The ~/.obnam.conf file has been installed and edited
#   * There's a valid GPG key configured in ~/.obnam.conf

#
# Utility function to send back a message to user.
function msg () {
    [ -n "$(which notify-send)" ] && notify-send -i low $1
    echo $1
}

#
# Directories to backup in this machine.
TO_BACKUP="$HOME/media/images/paris-selection $HOME/media/images/etoccalino.com $HOME/bin $HOME/tmp/configs"


msg "Started backup..."

for target in ${TO_BACKUP} ; do

    obnam backup ${target}

    if [ $? -ne 0 ] ; then
        msg "Backup failed. Check the logs at /tmp/obnam.log"
        exit 1
    fi
done

msg "Backup config files..."



msg "Backup done."

#
# To restore the backups
#
#  obname restore --to=/tmp/backup ${TO_BACKUP}
#
# To forget the backups
#
#   obnam forget 4w  # to keep latest backup of the week, for a month
#   or
#   obnam forget 1m  # keep only the latest backup of the last month
