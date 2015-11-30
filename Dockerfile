MAINTAINER xjchengo-ydf

# install utils
RUN apt-get update && \
    apt-get install -y nginx  openssh-server &&

COPY docker-entrypoint.sh /entrypoint.sh
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80 22
ENTRYPOINT ["/entrypoint.sh"]
