*Note, this Docker image is highly experimental.  Please take it with a grain of salt.*

This image contains [falderal](https://catseye.tc/node/Falderal), its standard support scripts (fa-bin2hex, etc) and its dependencies (Python 3.5.7-slim-stretch).

Example of use:

    docker pull catseye/falderal:0.13
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/falderal:0.13 \
        falderal doc/LanguageTests.md

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  This lets you give filenames as usual on the `falderal` command line, so long as they reside somewhere under the current directory on the host.

However, there is a significant limitation to this image in its current form, which is: the point of falderal is to run commands, and the falderal in the container can only run commands from inside the container.

Things it can run from inside the container include Python scripts on the host (because there is a Python interpreter in the container; so, for example, it can run [Maxixe](https://catseye.tc/node/Maxixe)'s test suite.)

It should also be able to run commands inside the container (for instance `/usr/bin/yes`), or statically-linked Linux executables on the host.  Dynamically-linked executables won't work though.

There is of course the possibility of inheriting from this image and adding any necessary executables to it.  But perhaps the problem could be solved a different way - falderal could generate a test suite (in Bourne shell? or Python?) on the host, which could be run on the host.  It's worth thinking about.
