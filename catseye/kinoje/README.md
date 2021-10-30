The image contains kinoje ( https://catseye.tc/node/kinoje ), its dependencies (Python 3.6-slim-stretch, PyYaml, Jinja2, tqdm), and the programs it's commonly used with (POV-Ray, ImageMagick, rsvg-convert, and ffmpeg).

Example of use:

    docker pull catseye/kinoje:0.8
    docker run --user $(id -u):$(id -g) -i -t -v "${PWD}:/mnt/host" catseye/kinoje:0.8 \
        kinoje eg/moebius.yaml -o moebius.mp4

Notes:

This Docker image is fairly experimental. Please don't lean on it too heavily.

The `-v "${PWD}:/mnt/host"` option in the above bind-mounts the current directory on the host to the working directory in the container.  This lets you give filenames as usual on the `kinoje` command line, so long as they reside somewhere under the current directory on the host.  If you want anything more sophisticated than that, you'll have to establish more bind-mounts and translate paths between host and container as your needs dictate.

In particular, if you have a kinoje configuration that uses something other than povray or rsvg-convert as its renderer, you might need to one of the two following things:
*   when running, configure an additional bind mount so that the kinoje inside the container can see and execute your renderer
*   create an image that builds on this image and installs your renderer as well
