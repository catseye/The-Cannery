FROM alpine:3.18.3
RUN apk update && apk add --no-cache lua5.1-dev gnutls-utils socat
RUN mkdir /mnt/host
WORKDIR /usr/src/app
COPY ./ ./script
ENV PATH="/usr/src/app/script:${PATH}"
WORKDIR /mnt/host
