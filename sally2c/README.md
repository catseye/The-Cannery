The image contains [sally2c](https://catseye.tc/node/Sally) built on debian:stretch-slim.

Example of use:

    docker pull catseye/sally:1.0-2014.0819
    cat eg/stdlib.sal eg/sidefxio.sal eg/hello.sal | \
        docker run --user $(id -u):$(id -g) -i -v "${PWD}:/mnt/host" catseye/sally:1.0-2014.0819 \
        sally2c > hello.c

This Docker image is quite experimental. Please don't lean on it too heavily.
