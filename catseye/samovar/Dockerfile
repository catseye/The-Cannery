FROM python:3.11-slim
RUN apt-get update && apt-get upgrade -y
RUN mkdir /mnt/host
WORKDIR /usr/src/app
COPY bin ./bin
COPY src ./src
ENV PATH="/usr/src/app/bin:${PATH}"
WORKDIR /mnt/host
