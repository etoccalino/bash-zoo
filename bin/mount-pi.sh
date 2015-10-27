#! /bin/bash

set -e

# Ensure root privileges.
if [ $(whoami) != "root" ] ; then
      echo must be root to run this script >&2
      exit 1
fi

# Ensure rpc-idmapd.service and rpc-mountd.service are running.
# systemctl restart rpc-idmapd
# systemctl restart rpc-mountd
sudo systemctl restart nfs-server.service



# Mount the movies, TV shows and music partitions to NFS4.
mount --bind /home/sedsick/media/pi/movies /srv/nfs4/movies
mount --bind /home/sedsick/media/pi/music /srv/nfs4/music
mount --bind /home/sedsick/media/pi/shows /srv/nfs4/shows

#
# The NFS4 client would supposedly benefit from mounting the
# partition using something like this (exemplified in /etc/fstab):
#
# server-ip:/movies /client/mount/point nfs udp,noatime,rsize=32768,wsize=32768,nolock 0 0

# Trigger a remount in the pi, using local user "sedsick" and "pi" in the /home/sedsick/.ssh/config
su - sedsick -c 'ssh pi sudo mount -a'
