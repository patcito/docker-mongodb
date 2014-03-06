FROM stackbrew/ubuntu:saucy
VERSION 0.1
MAINTAINER Patrick Aljord <patcito@gmail.com>
RUN echo "Have fun!"
## get 10gen server key
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
## add 10gen apt repo to source list and install
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update 
RUN apt-get install -y --force-yes mongodb-10gen
EXPOSE 27017
## automatically start mongo when container is started
ENTRYPOINT ["mongod","--logpath","/log/mongodb.log","--dbpath","/data/"]
## ENTRYPOINT /bin/bash
## Instructions
RUN echo "start it like that: docker run -i -t -name mongodb -v /home/pat/mongodb/data/:/data -v /home/pat/mongodb/log:/log e4fd60b98bcb"
