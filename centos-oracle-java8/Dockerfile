# 
# Dockerfile for Container for CentOS 7 / Java 8 Applications
# To run: sudo docker build -t <image_name> .
#

# base image CentOS 7
FROM centos:latest

MAINTAINER Ryan Padilha <ryan.padilha@wplex.com.br>

# install Oracle Java 8
RUN \
  yum -y upgrade && \
  yum -y install wget && \
  wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm && \
  yum -y install jdk-8u151-linux-x64.rpm && \
  rm -rf jdk-8u151-linux-x64.rpm

# define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
