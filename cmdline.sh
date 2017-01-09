#!/bin/sh
set -e
/usr/bin/mongod -f /etc/mongodb.conf --fork --logpath /var/log/mongodb.log
/usr/bin/pritunl start

[ "$1" ] && exec "$@"
