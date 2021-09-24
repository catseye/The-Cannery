The Cannery
===========

[Cat's Eye Technologies][] now has [Docker images available on Docker Hub][]
for several of its distributions.

Putting a Dockerfile and a build script in each distribution repository
felt not-quite-right somehow, so this repository was created to hold all
the Dockerfiles, build scripts, and documentation for each Docker image.

In addition -- and this is significant -- there is a set of driver
scripts in the `bin` directory of this repository, which run the
executables in these containers almost as if you had the executable
installed on the host.

Each driver script will download any image it needs from Docker hub
first, if it is not yet present on the system.

So all you need to do is put `bin` on your executable search path,
and suddenly you have a myriad of Cat's Eye Technologies' tools and
language interpreters and such at your disposal, right from your
command line (or shell, or Terminal, or whatever you like to call it.)

There are some caveats of course.  See the README of the
[containerized-hastec][] project for more information on this approach.

[Cat's Eye Technologies]: https://catseye.tc/
[Docker images available on Docker Hub]: https://hub.docker.com/u/catseye
[containerized-hastec]: https://github.com/catseye/containerized-hastec/
