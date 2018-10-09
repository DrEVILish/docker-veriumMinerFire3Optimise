FROM        ubuntu:latest
MAINTAINER  drevilish

RUN         apt update && \
            apt install -y git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev libxmu-dev libxmu-headers freeglut3-dev libxext-dev libxi-dev zlib1g-dev g++-8 gcc-8

RUN         mkdir /verium

RUN         git clone https://github.com/rollmeister/veriumMiner /verium

COPY        build.sh /verium/build.sh

RUN         cd /verium && \
            ./build.sh

WORKDIR     /verium
