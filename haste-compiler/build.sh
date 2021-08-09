#!/bin/sh

IMAGENAME=haste-compiler
VERSION=0.5.5.1-ce1

ORGNAME=catseye
DOCKERFILE=`pwd`/Dockerfile

find ${SRCDIR} -name '*.pyc' -exec rm {} \;
find ${SRCDIR} -name '__pycache__' -exec rm -r {} \;

DOCKER="sudo docker"

${DOCKER} container prune -f
${DOCKER} rmi ${ORGNAME}/${IMAGENAME}:${VERSION}
${DOCKER} rmi ${IMAGENAME}
${DOCKER} build -f ${DOCKERFILE} -t ${IMAGENAME} .
${DOCKER} tag ${IMAGENAME} ${ORGNAME}/${IMAGENAME}:${VERSION}
${DOCKER} images | grep ${IMAGENAME}
