FROM ubuntu:14.04
MAINTAINER ydf

# install utils
RUN apt-get update && \
    apt-get install -y ca-certificates openssh-server nginx

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80 22
ENTRYPOINT ["/entrypoint.sh"]