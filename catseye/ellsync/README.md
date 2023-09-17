The image contains [ellsync](https://catseye.tc/node/ellsync) and its dependencies (Python 3.11-slim and `rsync`).

Example of use:

    docker pull catseye/ellsync:0.5
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/ellsync:0.5 \
        ellsync .ellsync.json list

(Or, for simpler more convenient usage, use the `ellsync` script in [The Cannery](https://git.catseye.tc/The-Cannery/).)

This Docker image is fairly experimental. Please don't lean on it too heavily.

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  This lets you give filenames as usual on the `ellsync` command line, so long as they reside somewhere under the current directory on the host.

Note however it does restrict the paths that `rsync` uses from being under the current directory on the host.  If you want anything more sophisticated than that, you'll have to establish more bind-mounts and translate paths between host and container as your needs dictate.
