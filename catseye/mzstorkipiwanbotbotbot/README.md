The image contains [mzstorkipiwanbotbotbot](https://catseye.tc/node/mzstorkipiwanbotbotbot) its strict dependencies (Lua 5.1) and tools that allow it to be actually used as an IRC bot (`ncat`, `gnutls-cli`, and `socat`).

Example of use:

    docker pull catseye/mzstorkipiwanbotbotbot:0.1
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/mzstorkipiwanbotbotbot:0.1 \
        irc.libera.chat 6697 mybotname

This Docker image is fairly experimental. Please don't lean on it too heavily.

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  This lets you give filenames as usual on the `sixtypical` command line, so long as they reside somewhere under the current directory on the host.  If you want anything more sophisticated than that, you'll have to establish more bind-mounts and translate paths between host and container as your needs dictate.
