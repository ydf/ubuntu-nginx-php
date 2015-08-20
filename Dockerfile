FROM php:5.6-fpm
MAINTAINER xjchengo

COPY sources.list /etc/apt/sources.list

ENV NGINX_VERSION 1.9.0-1~jessie

# install utils
RUN apt-get update && \
    apt-get install -y ca-certificates \
        curl \
        openssh-server \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80 22
ENTRYPOINT ["/entrypoint.sh"]
