#!/bin/sh

EXENAME=hastec
VERSION=0.5.5.1-ce1

ORGNAME=catseye
DOCKERFILE=`pwd`/Dockerfile
IMAGENAME=$EXENAME

docker container prune -f
docker rmi ${ORGNAME}/${IMAGENAME}:${VERSION}
docker rmi ${IMAGENAME}
docker build -f ${DOCKERFILE} -t ${IMAGENAME} .
docker tag ${IMAGENAME} ${ORGNAME}/${IMAGENAME}:${VERSION}
docker images | grep ${IMAGENAME}
