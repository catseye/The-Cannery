FROM python:3.5.7-slim-stretch
RUN apt-get update && apt-get upgrade -y
RUN mkdir /mnt/host
WORKDIR /usr/src/app
COPY bin ./bin
COPY src ./src
COPY script ./script
ENV PATH="/usr/src/app/bin:/usr/src/app/script:${PATH}"
WORKDIR /mnt/host
