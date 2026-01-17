ARG DEBIAN_VERSION=latest
FROM debian:${DEBIAN_VERSION} AS upgraded
RUN apt-get update \
 && apt-get upgrade -y \
 && rm -rf /var/lib/apt/lists/
