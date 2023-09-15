FROM bitnami/python:2.7.18-prod
RUN apt-get update && apt-get upgrade -y
RUN mkdir /mnt/host
WORKDIR /usr/src/app
COPY script ./script
COPY src ./src
COPY LICENSE ./LICENSE
ENV PATH="/usr/src/app/script:${PATH}"
WORKDIR /mnt/host
