FROM node:latest

# setup workdir
RUN mkdir -p /root/work/
WORKDIR /root/work/

# install git and slim down image
RUN apt-get -y update \
    && apt-get -y install git-ftp \
    && apt-get clean \
    && rm -rf /var/tmp/* \
    && rm -rf /usr/share/man/?? \
    && rm -rf /usr/share/man/??_* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

# run a CMD to show git is installed
CMD git help

ENTRYPOINT /bin/bash