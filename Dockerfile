FROM debian:jessie
MAINTAINER ydf


RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.6-1~jessie
ENV ROOT_PASSWORD test001

# install utils
RUN apt-get update && \
    apt-get install -y ca-certificates openssh-server nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80 22
CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["/entrypoint.sh"]