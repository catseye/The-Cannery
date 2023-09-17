The image contains [The Swallows Engine](https://catseye.tc/node/The%20Swallows%20Engine) and its dependencies (Python 2.7).  It can be used to generate novels in the style of [Dial 'S' for Swallows](https://catseye.tc/article/Texts.md#dial-s-for-swallows).

Example of use:

    docker pull catseye/the_swallows.py:1.0
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/the_swallows.py:1.0 \
        the_swallows.py

(Or, for simpler more convenient usage, use the `the_swallows.py` script in [The Cannery](https://git.catseye.tc/The-Cannery/).)

This Docker image is fairly experimental. Please don't lean on it too heavily.

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  If you want anything more sophisticated than that, you'll have to establish more bind-mounts and translate paths between host and container as your needs dictate.
