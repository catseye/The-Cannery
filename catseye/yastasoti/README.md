The image contains yastasoti ( https://catseye.tc/node/yastasoti ) and its dependencies (Python 3.5.7-slim-stretch, requests, tqdm).

Example of use:

    docker pull catseye/yastasoti:0.4
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/yastasoti:0.4 \
        yastasoti links.json --archive-to=out/

Notes:

This Docker image is fairly experimental. Please don't lean on it too heavily.

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  This lets you give filenames as usual on the `yastasoti` command line, so long as they reside somewhere under the current directory on the host.  If you want anything more sophisticated than that, you'll have to establish more bind-mounts and translate paths between host and container as your needs dictate.
