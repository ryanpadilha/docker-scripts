# 
# Dockerfile -- Container Image for CentOS 7 / Oracle JRE Server 8
#
# build : docker build -f centos-oracle-server-jre8.dockerfile -t centos-server-jre8 .
# tag   : docker tag centos-server-jre8 wplex/centos-server-jre8:latest
# push  : docker push wplex/centos-server-jre8

FROM centos:latest
LABEL maintainer="Ryan Padilha <ryan.padilha@wplex.com.br>"

RUN \
  yum -y upgrade \
  && yum -y install wget \
  && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/server-jre-8u152-linux-x64.tar.gz \
  && mkdir -p /usr/lib/jvm \
  && tar -zxvf server-jre-8u152-linux-x64.tar.gz -C /usr/lib/jvm \
  && rm -rf server-jre-8u152-linux-x64.tar.gz \
  && update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_152/bin/java 100 \
  && update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_152/bin/javac 100
