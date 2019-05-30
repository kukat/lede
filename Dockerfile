FROM ubuntu:18.04

RUN apt-get update;\
    apt-get install -y sudo git-core subversion ccache build-essential gcc-multilib libssl-dev \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python
RUN apt-get clean

RUN useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

RUN sudo -iu openwrt git clone https://github.com/coolsnowwolf/lede.git lede

RUN sudo -iu openwrt lede/scripts/feeds update -a

CMD sudo -iu openwrt bash

