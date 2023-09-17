FROM alpine:3.18.3
RUN apk update && apk add --no-cache qemu-system-i386 qemu-ui-curses cdrkit
RUN mkdir /mnt/host
WORKDIR /usr/src/app
COPY ./script ./script
ENV PATH="/usr/src/app/script:${PATH}"
ENV QEMU_SYSTEM_I386_FLAGS="-display curses"
WORKDIR /mnt/host
