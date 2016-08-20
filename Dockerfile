FROM ubuntu:16.04

# Install dependencies
RUN apt-get update --yes && apt-get upgrade --yes
RUN apt-get install git nodejs npm \
libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++ \
ffmpeg \
libgroove-dev zlib1g-dev libpng-dev \
redis-server --yes

RUN ln -s `which nodejs` /usr/bin/node

# Non-privileged user
RUN useradd -m audiogram
USER audiogram
WORKDIR /home/test21

# Clone repo
RUN git clone https://github.com/megive/test21.git
WORKDIR /home/test21/audiogram

# Install dependencies
RUN npm install
