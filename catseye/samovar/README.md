The image contains [samovar](https://catseye.tc/node/Samovar) and its dependencies (Python 3.11-slim, mainly).

Example of use:

    docker pull catseye/samovar:0.5
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/samovar:0.5 \
        samovar eg/foo.samovar

This Docker image is fairly experimental. Please don't lean on it too heavily.

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  This lets you give filenames as usual on the `sixtypical` command line, so long as they reside somewhere under the current directory on the host.  If you want anything more sophisticated than that, you'll have to establish more bind-mounts and translate paths between host and container as your needs dictate.
