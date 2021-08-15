#!/bin/sh

# This script pulls all of Cat's Eye Technologies' Docker images from Docker Hub.
# It is intended to be run every so often so that these images are not culled by Docker Hub per
# https://www.docker.com/blog/scaling-dockers-business-to-serve-millions-more-developers-storage/
# It's also just a handy way to get all of these Docker images onto your machine at once.

for DIR in $1/*; do
  if [ -d $DIR ]; then
    . $DIR/settings.sh
    docker pull $DIR:$VERSION
  fi
done
