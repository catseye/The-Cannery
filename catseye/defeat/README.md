The image contains [defeat.jl](https://catseye.tc/node/https://catseye.tc/node/The%20Defeat%20at%20Procyon%20V) and its dependencies (Julia 1.0).  It can be used to generate novels in the style of [The Defeat at Procyon V](https://catseye.tc/node/The%20Defeat%20at%20Procyon%20V).

Example of use:

    docker pull catseye/defeat:1.0
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/defeat:1.0 \
        defeat

(Or, for simpler more convenient usage, use the `defeat` script in [The Cannery](https://git.catseye.tc/The-Cannery/).)

This Docker image is fairly experimental. Please don't lean on it too heavily.

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  If you want anything more sophisticated than that, you'll have to establish more bind-mounts and translate paths between host and container as your needs dictate.
