#! /bin/bash

# TODO:
# * write better `usage` function
# * fix support for directories with spaces in names.

#
# backup.sh
#
# Modify TO_BACKUP for the host.
#
# Depends on:
#   * duplicity
#   * gpg-agent or equivalent
#   * the collect-configs.sh script
#
# Program configuration:
#
# REMOTE_ROOT_DIR -- encrypted directory remote path.
# TO_BACKUP -- directories within $HOME to backup in this machine.
# KEY_ID -- the key id of the PGP key used for encryption.

#
# Utility function to send back a message to user.
function msg {
    [ -n "$(which notify-send)" ] && notify-send -i low "$1"
    echo "$1"
}

#
# Usage message.
function usage {
    local ME="$(basename ${0})"
    echo "Usage: ${ME} [ -h | full | incr | verify | restore ]"
    echo ""
    echo "Run backup routine... see source code for env config"
    echo "By default, run an incremental backup."
}

#
# Create the "include" string.
function includes {
    local INCLUDES=""
    for TARGET in $* ; do
        INCLUDES="--include ${HOME}/${TARGET} ${INCLUDES}"
    done
    echo ${INCLUDES}
}

#
# The backup routine.
#
# Positional parameters:
# * operation to run, either "full" or "incr" (see duplicity)
# * TO_BACKUP list.
# * GPG key id to use for encryption.
# * the remote directory to backup to.
# * the logfile to log operations to.
function backup {
    local OP=${1}
    local INCLUDES="$(includes ${2})"
    local KEY_ID="${3}"
    local LOG_FILE="${4}"
    local ORIGIN_DIR="${5}"
    local DESTINATION_DIR="${6}"

    duplicity ${OP} --log-file="${LOG_FILE}" --encrypt-key="${KEY_ID}" ${INCLUDES} --exclude '**' ${ORIGIN_DIR} ${DESTINATION_DIR}
}

#
# Parse environment configuration, or use default values.
: ${REMOTE_DIR:="scp://rsync.net/backups/netbook"}
: ${TO_BACKUP:="bin docs tmp/configs etoccalino.com"}
: ${KEY_ID:="A85D625F"}
: ${LOG_FILE:="/tmp/backup.log"}
: ${RESTORE_DIR:="/tmp/backup"}

#
# Execute the program
#

if [[ "${1}" == "-h" ]] ; then

    usage
    exit 0;

fi

#
# Interpret the actions.
#
if [[ "${1}" == "full" ]] ; then

    msg "Collecting configs..."
    collect-configs.sh
    msg "Started full backup..."
    backup "full" "${TO_BACKUP}" ${KEY_ID} ${LOG_FILE} ${HOME} ${REMOTE_DIR}
    msg "Full backup completed."

elif [[ "${1}" == "incr" ]] || [[ "${1}" == "" ]] ; then
    # "incr" is assumed on empty parameter.

    msg "Collecting configs..."
    collect-configs.sh
    msg "Started incremental backup..."
    backup "incr" "${TO_BACKUP}" ${KEY_ID} ${LOG_FILE} ${HOME} ${REMOTE_DIR}
    msg "Incremental backup completed."

elif [[ "${1}" == "verify" ]] ; then

    msg "Collecting configs..."
    collect-configs.sh
    msg "Started full verification..."
    backup "verify" "${TO_BACKUP}" ${KEY_ID} ${LOG_FILE} ${REMOTE_DIR} ${HOME}

elif [[ "${1}" == "restore" ]] ; then

    msg "Started restoration of last backup..."
    backup "restore" "${TO_BACKUP}" ${KEY_ID} ${LOG_FILE} ${REMOTE_DIR} ${RESTORE_DIR}
    msg "Completed restoration of latest backup to: ${RESTORE_DIR}"

else

    usage
    msg "ERROR: bad parameters."
    exit 1

fi

msg "Log is kept at ${LOG_FILE}"

# To restore the backups
#
#   backup.sh verify
#
# and
#
#   backup.sh restore
#
#
# To forget the backups
#
#   duplicity remove-older-than 30D -v9 --encrypt-key=${KEY_ID} --force ${REMOTE_DIR}
#
# NOTE: You cannot remove backups that are NEWER than your last full backup.
