# 
# Dockerfile -- Container Image for Debian 9.3 / Oracle JDK 8
#
# run  : docker build -f debian-oracle-java8.dockerfile -t debian-oracle-java8 .
# tag  : docker tag b5a4fa34f69b wplex/debian-oracle-java8:latest
# push : docker push wplex/debian-oracle-java8
#

FROM debian:latest
LABEL maintainer="Ryan Padilha <ryan.padilha@wplex.com.br>"

RUN \
  apt-get update \
  && apt-get install -f \
  && apt-get install -y wget gnupg \
  && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
  && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
  && apt-get update \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && apt-get install -y oracle-java8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
