#!/bin/sh

EXENAME=the_swallows.py

SCRIPTPATH=`realpath $0`
SCRIPTDIR=`dirname $SCRIPTPATH`
. $SCRIPTDIR/../catseye/$EXENAME/settings.sh
IMAGE=$ORGNAME/$EXENAME:$VERSION

docker run --user $(id -u):$(id -g) -i -t $ENVPARAM -v "${PWD}:/mnt/host" $IMAGE $EXENAME "$@"
