# 
# Dockerfile -- Container Image for NGINX Server 1.13.7
#
# build : docker build -f nginx-server.dockerfile -t nginx-server .
# tag   : docker tag nginx-server wplex/nginx-server:latest
# push  : docker push wplex/nginx-server
# run   : docker run -it -p 80:80 -v /etc/letsencrypt:/etc/letsencrypt -v /var/wplex:/var/wplex --name nginx_server wplex/nginx-server /bin/bash

FROM nginx:latest
LABEL maintainer="Ryan Padilha <ryan.padilha@wplex.com.br>"

COPY config/nginx-ec2.conf /etc/nginx/nginx.conf
COPY config/sites-available_labix.com.br.conf /etc/nginx/sites-available/labix.com.br

RUN mkdir -p /etc/nginx/sites-enabled \
 && mkdir -p /etc/nginx/sites-available \
 && ln -s /etc/nginx/sites-available/labix.com.br /etc/nginx/sites-enabled/labix.com.br

EXPOSE 80 443

#ENTRYPOINT ["nginx"]
#CMD ["-g", "daemon off;"]
