
FROM ubuntu:14.04

RUN sed -i -e 's/archive.ubuntu.com/mirror.yandex.ru/' /etc/apt/sources.list \
    && echo deb http://scratchbox.org/debian stable main > /etc/apt/sources.list.d/maemo.list
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y --force-yes \
    	  wget \
        scratchbox-core \
        scratchbox-libs \
        scratchbox-devkit-debian \
        scratchbox-devkit-perl \
        scratchbox-toolchain-host-gcc \
        scratchbox-toolchain-arm-linux-cs2009q3-67 \
        scratchbox-toolchain-arm-linux-cs2010q1-202 \
        sbrshd

RUN useradd -m maemo

### http://scratchbox.org/documentation/user/scratchbox-1.0/html/installdoc.html
### http://repository.maemo.org/stable/diablo/INSTALL.txt

