# Common script for building a Docker image.
# Intended to be called from something else that sets up some env vars first
# (using Falderal as an example here, obviously change these as necessary):

# SOURCE=Falderal
# IMAGENAME=falderal
# VERSION=0.13

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
DOCKERFILE=`pwd`/Dockerfile

find ${SRCDIR} -name '*.pyc' -exec rm {} \;
find ${SRCDIR} -name '__pycache__' -exec rm -r {} \;

docker container prune -f
docker rmi ${ORGNAME}/${IMAGENAME}:${VERSION}
docker rmi ${IMAGENAME}
docker build -f ${DOCKERFILE} -t ${IMAGENAME} ${SRCDIR}
docker tag ${IMAGENAME} ${ORGNAME}/${IMAGENAME}:${VERSION}
docker images | grep ${IMAGENAME}
