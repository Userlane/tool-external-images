FROM ghcr.io/userlane/tool-external-images/pgbouncer:1.24.1-debian-12-r10

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER 1001
