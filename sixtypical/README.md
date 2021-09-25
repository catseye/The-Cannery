The image contains [sixtypical](https://catseye.tc/node/SixtyPical) and its dependencies (Python 3.5.7-slim-stretch, mainly).

Example of use:

    docker pull catseye/sixtypical:0.20
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/sixtypical:0.20 \
            sixtypical eg/funrun.60p -o funrun.bin

This Docker image is fairly experimental. Please don't lean on it too heavily.

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  This lets you give filenames as usual on the `sixtypical` command line, so long as they reside somewhere under the current directory on the host.  If you want anything more sophisticated than that, you'll have to establish more bind-mounts and translate paths between host and container as your needs dictate.

Note that the image does not contain any emulators, or the dcc6502 disassembler needed to run the tests; it only has the `sixtypical` program, which can analyze a SixtyPical program and compile it to 6502 machine code.
