FROM julia:1.0
RUN apt-get update && apt-get upgrade -y
RUN mkdir /mnt/host
WORKDIR /usr/src/app
COPY defeat ./script
ENV PATH="/usr/src/app/script:${PATH}"
WORKDIR /mnt/host
