#! /bin/bash

#
# backup.sh
#
# Depends on:
#   * obnam
#   * gpg-agent or equivalent (see obnam docs)
#
# Assumes:
#   * The ~/.obnam.conf file has been installed and edited
#   * There's a valid GPG key configured in ~/.obnam.conf
#

TO_BACKUP="$HOME/Documents $HOME/Pictures"

obnam backup ${TO_BACKUP}

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
#
