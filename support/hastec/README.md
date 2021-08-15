hastec
======

This image contains the Haste compiler, `hastec`, and its dependencies.
It is based on [rwstauner/haste-compiler](https://hub.docker.com/r/rwstauner/haste-compiler)
but has additional haste-cabal packages installed, namely Parsec.

Example of use:

    docker pull catseye/hastec:0.5.5.1-ce1
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/src" catseye/hastec:0.5.5.1-ce1 \
        hastec HasteMain.hs
