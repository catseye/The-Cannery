#!/bin/sh

# Common script for building a Docker image.
# Intended to be called from something else that sets up some env vars first:

# SOURCE=Falderal
# IMAGENAME=falderal
# VERSION=0.13

ORGNAME=catseye
SRCDIR=/home/cpressey/catseye/${SOURCE}
DOCKERFILE=`pwd`/Dockerfile

find ${SRCDIR} -name '*.pyc' -exec rm {} \;
find ${SRCDIR} -name '__pycache__' -exec rm -r {} \;

docker container prune -f
docker rmi ${ORGNAME}/${IMAGENAME}:${VERSION}
docker rmi ${IMAGENAME}
docker build -f ${DOCKERFILE} -t ${IMAGENAME} ${SRCDIR}
docker tag ${IMAGENAME} ${ORGNAME}/${IMAGENAME}:${VERSION}
docker images | grep ${IMAGENAME}
