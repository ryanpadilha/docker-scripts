# 
# Dockerfile for Container for Debian / Java 8 Applications
# To run: sudo docker build -t <image_name> .
#

# base image Debian 9.3
FROM debian:latest

MAINTAINER Ryan Padilha <ryan.padilha@wplex.com.br>

# install Oracle Java 8
RUN \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  apt-get update && \
  apt-get install oracle-java8-installer
  
# define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
