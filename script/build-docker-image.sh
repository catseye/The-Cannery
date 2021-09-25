# Common script for building a Docker image.
# Usage: build-docker-image.sh <dir-containing-docker-config>

CONFIG_DIR=$1
. $CONFIG_DIR/settings.sh

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
  SRCDIR=`shelf_pwd ${SOURCE}`
else
  echo "Please set SHELF_PATH to a directory where the source '${SOURCE}' can be found."
  exit 1
fi

ORGNAME=catseye
DOCKERFILE=$CONFIG_DIR/Dockerfile
IMAGENAME=$EXENAME

find ${SRCDIR} -name '*.pyc' -exec rm {} \;
find ${SRCDIR} -name '__pycache__' -exec rm -r {} \;

docker container prune -f
docker rmi ${ORGNAME}/${IMAGENAME}:${VERSION}
docker rmi ${IMAGENAME}
docker build -f ${DOCKERFILE} -t ${IMAGENAME} ${SRCDIR}
docker tag ${IMAGENAME} ${ORGNAME}/${IMAGENAME}:${VERSION}
docker images | grep ${IMAGENAME}
