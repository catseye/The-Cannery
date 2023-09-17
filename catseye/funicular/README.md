The image contains [funicular](https://catseye.tc/node/Funicular) with dependencies that allow working with funiculars for the i386 architecture (`mkisofs` and `qemu-system-i386`, with a curses interface for QEMU.)

Example of use:

    docker pull catseye/funicular:0.7
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/funicular:0.7 \
        funicular setup

(Or, for simpler more convenient usage, use the `funicular` script in [The Cannery](https://git.catseye.tc/The-Cannery/).)

This Docker image is fairly experimental. Please don't lean on it too heavily.

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  This lets the `funicular` command inside the Docker container to access your `Funicularfile` and images on your host filesystem.  If you want anything more sophisticated than that, you'll have to establish more bind-mounts and translate paths between host and container as your needs dictate.
