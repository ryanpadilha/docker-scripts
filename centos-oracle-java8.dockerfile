# 
# Dockerfile -- Container Image for CentOS 7 / Oracle JDK 8
#
# build : docker build -f centos-oracle-java8.dockerfile -t centos-oracle-java8 .
# tag   : docker tag centos-oracle-java8 wplex/centos-oracle-java8:latest
# push  : docker push wplex/centos-oracle-java8
#

FROM centos:latest
LABEL maintainer="Ryan Padilha <ryan.padilha@wplex.com.br>"

RUN \
  yum -y upgrade \
  && yum -y install wget \
  && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm \
  && yum -y install jdk-8u151-linux-x64.rpm \
  && rm -rf jdk-8u151-linux-x64.rpm

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
