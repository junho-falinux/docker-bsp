FROM ubuntu:16.04

# Set the locale
RUN apt-get clean && apt-get update
RUN apt-get install locales
RUN locale-gen ko_KR.UTF-8

ENV LANG ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

#RUN sed -ri 's/\/archive\.ubuntu\.com/\/kr\.archive\.ubuntu\.com/g' /etc/apt/sources.list

RUN \
    apt-get update && \
    apt-get -y install \
        curl sudo \
        git-core build-essential gcc-arm-none-eabi libssl-dev \
        sed binutils patch gzip bzip2 perl tar cpio python unzip rsync wget \
        libz3-dev libncurses5-dev pkg-config libusb-1.0-0-dev \
        bc lzop u-boot-tools vim flex bison \
        && \
    rm -rf /var/lib/apt/lists/*

ADD files/toolchain.sh /

RUN chmod 777 /opt

CMD ["/bin/bash"]

WORKDIR /work

