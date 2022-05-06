The Cannery
===========

Experimental
| _See also:_ [The Platform](https://github.com/catseye/The-Platform)
∘ [containerized-hastec](https://github.com/catseye/containerized-hastec)

- - - -

[Cat's Eye Technologies][] now has [Docker images available on Docker Hub][]
for several of its distributions.

Putting a Dockerfile and a build script in each distribution repository
felt not-quite-right somehow, so this repository was created to hold all
the Dockerfiles, build scripts, and documentation for each Docker image.

In addition -- and this is significant -- there is a set of driver
scripts in the `bin` directory of this repository, which run the
executables in these containers almost as if you had the executable
installed locally.

Each driver script will download any image it needs from Docker hub
first, if it is not yet present on the system.

So all you need to do is put `bin` on your executable search path,
and suddenly you have a myriad of Cat's Eye Technologies' tools and
language interpreters and such at your disposal, right from your
command line (or shell, or Terminal, or whatever you like to call it.)

### Caveats

"almost as if you had it installed locally" does have some limitations.

The containerized executable works on the host's file system through a
bind mount.  The driver script establishes a bind mount from the current
working directory of the host, and the container can't see any of
the host's filesystem that is outside that directory.

So, for example, you can't tell a compiler to output the generated
executable file to `../built/out.foo` because it can't see `../`.

Also, the Docker daemon always runs as root.  The script tells the
container to be run as the current user on the host.  This prevents
the files that the executable writes from being owned by root.  But
this directive is not total; the Docker daemon still runs as root.
For that reason I would recommend not running the driver scripts
from a directory that contains anything important, such as `/`.

Also, there are ways to make the Docker daemon run as non-root.
But they are outside the scope of this document.

### Containerization for Preservation

Because the idea here is "containerization for preservation" rather
than "containerization for deployment", we don't rebuild the images
regularly.  Every time one of these images is rebuilt, it pulls
the latest packages from the system package manager repository,
which rebuilds that layer, which causes new layers to be built on
top of it, bloating everything.  Since they are not used as servers,
and because they are containerized, the need to update system packages
regularly to fix critical (exploitable) defects is reduced.

### Base Images

#### Python 3.x

For Python 3.x-based executables, the base image used is usually
**python-3.5.7-slim-stretch**.

#### Python 2.7.x

For Python 2.7-based executables, the base image used is
**bitnami/python:2.7.18-prod**.

#### Erlang R16

For Erlang R16-based executables, the base image used is
**andreineculau/erlang-r16b03-1:latest**.

[Cat's Eye Technologies]: https://catseye.tc/
[Docker images available on Docker Hub]: https://hub.docker.com/u/catseye
[containerized-hastec]: https://github.com/catseye/containerized-hastec/
