FROM python:3.5.7-slim-stretch
RUN apt-get update && apt-get upgrade -y
RUN mkdir /mnt/host
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY bin ./bin
COPY src ./src
ENV PATH="/usr/src/app/bin:${PATH}"
WORKDIR /mnt/host
