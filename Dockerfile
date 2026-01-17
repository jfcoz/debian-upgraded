ARG DEBIAN_VERSION=latest
FROM debian:${DEBIAN_VERSION} AS upgraded
RUN grep security /etc/apt/sources.list | tee /etc/apt/security.sources.list \
 && apt-get update \
 && apt-get upgrade -y -o Dir::Etc::SourceList=/etc/apt/security.sources.list \
 && rm -rf /var/lib/apt/lists/
