#!/bin/sh -e

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

ORGNAME=catseye
DOCKERFILE=$CONFIG_DIR/Dockerfile
if [ "x$IMAGENAME" = "x" ]; then
  IMAGENAME=$EXENAME
fi

if [ "x$SOURCE" != "x" ]; then
  if [ "x$SHELF_PATH" != "x" ]; then
    if shelf_pwd ${SOURCE}; then
      GITDIR=`shelf_pwd ${SOURCE}`
    else
      echo "Please set SHELF_PATH to a directory where the source '${SOURCE}' can be found."
      exit 1
    fi
  else
    GITDIR="https://github.com/$ORGNAME/$SOURCE"
  fi
else
  # If GITDIR is blank, this image does not require a repository when building
  GITDIR=""
fi

SRCDIR=/tmp/$IMAGENAME

rm -rf ${SRCDIR}
if [ "x$GITDIR" != "x" ]; then
  echo "Cloning ${GITDIR} to ${SRCDIR} ..."
  if [ "x$BRANCH" = "x" ]; then
    BRANCH=${VERSION}
  fi
  (cd /tmp/ && git clone ${GITDIR} ${IMAGENAME} && cd ${IMAGENAME} && git checkout ${BRANCH})
else
  echo "No SOURCE specified in settings.sh, using empty ${SRCDIR} ..."
  mkdir -p $SRCDIR
fi

if [ -x "${CONFIG_DIR}/patch.sh" ]; then
    PATCHFILE=`pwd`"/${CONFIG_DIR}/patch.sh"
    echo "Running ${PATCHFILE} ..."
    (cd ${SRCDIR} && ${PATCHFILE})
fi

docker container prune -f
docker rmi ${ORGNAME}/${IMAGENAME}:${VERSION} || echo "No such image ${ORGNAME}/${IMAGENAME}:${VERSION}, skipping"
docker rmi ${IMAGENAME} || echo "No such image ${IMAGENAME}, skipping"
docker build -f ${DOCKERFILE} -t ${IMAGENAME} ${SRCDIR}
docker tag ${IMAGENAME} ${ORGNAME}/${IMAGENAME}:${VERSION}
docker images | grep ${IMAGENAME}
