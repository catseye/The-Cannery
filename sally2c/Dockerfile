FROM debian:stretch-slim
RUN apt-get update && apt-get upgrade -y
RUN mkdir /mnt/host
WORKDIR /usr/src/app
COPY src ./src
RUN mkdir ./bin
RUN apt-get install -y gcc make && cd src && make && apt-get remove -y gcc make && apt-get autoremove -y
ENV PATH="/usr/src/app/bin:${PATH}"
