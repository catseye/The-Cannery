#!/bin/sh

# Common script for building a Docker image.
# Usage: build-docker-image.sh <dir-containing-docker-config>

CONFIG_DIR=$1
if [ -r $CONFIG_DIR/settings.sh ]; then
  . $CONFIG_DIR/settings.sh
else
  echo "'$CONFIG_DIR' is not a valid configuration directory"
  exit 1
fi

shelf_pwd() {
    name="$1"
    path=`echo "$SHELF_PATH" | sed -e 's/:/ /g'`
    for dir in $path; do
        if [ -d "$dir/$name" ]; then
            echo "$dir/$name"
            return 0
        fi
    done
    return 1
}

if shelf_pwd ${SOURCE}; then
  GITDIR=`shelf_pwd ${SOURCE}`
else
  echo "Please set SHELF_PATH to a directory where the source '${SOURCE}' can be found."
  exit 1
fi

ORGNAME=catseye
DOCKERFILE=$CONFIG_DIR/Dockerfile
IMAGENAME=$EXENAME

SRCDIR=/tmp/$EXENAME

echo "Cloning ${GITDIR} to ${SRCDIR}..."

rm -rf ${SRCDIR}
(cd /tmp/ && git clone ${GITDIR} ${EXENAME})

docker container prune -f
docker rmi ${ORGNAME}/${IMAGENAME}:${VERSION}
docker rmi ${IMAGENAME}
docker build -f ${DOCKERFILE} -t ${IMAGENAME} ${SRCDIR}
docker tag ${IMAGENAME} ${ORGNAME}/${IMAGENAME}:${VERSION}
docker images | grep ${IMAGENAME}
