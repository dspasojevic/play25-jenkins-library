#
# Play 2 container
#

FROM frolvlad/alpine-oraclejdk8
MAINTAINER Agile Digital <info@agiledigital.com.au>

# Install libsodium so that applications can use the kalium crypto library.
RUN apk update && apk add && apk add bash && apk add tzdata  && apk add libsodium

ENV CONTAINER_TIMEZONE Australia/NSW

RUN cp /usr/share/zoneinfo/\${CONTAINER_TIMEZONE} /etc/localtime && echo "\${CONTAINER_TIMEZONE}" >  /etc/timezone && echo "Container timezone set to: \${CONTAINER_TIMEZONE}"

EXPOSE 9000

USER root
RUN mkdir -p /opt
COPY dist.zip /opt/
COPY install.sh /opt/bin/install.sh
RUN /opt/bin/install.sh

COPY docker_entrypoint.sh /opt/bin/

ENTRYPOINT ["/bin/bash", "-x", "/opt/bin/docker_entrypoint.sh"]