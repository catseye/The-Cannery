FROM andreineculau/erlang-r16b03-1:latest
RUN mkdir /mnt/host
WORKDIR /usr/src/app
COPY bin ./bin
COPY src ./src
ENV PATH="/usr/src/app/bin:${PATH}"
WORKDIR /mnt/host
