FROM ghcr.io/userlane/tool-external-images/postgresql:14.18.0-debian-12-r0 AS build

# hadolint ignore=DL3002
USER 0

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends git build-essential \
    && git clone https://github.com/citusdata/pg_cron.git

WORKDIR /pg_cron

RUN chmod +x /opt/bitnami/scripts/postgresql-env.sh \
    && /opt/bitnami/scripts/postgresql-env.sh \
    make && PATH=$PATH make install

FROM ghcr.io/userlane/tool-external-images/postgresql:14.18.0-debian-12-r0

COPY --from=build /opt/bitnami/postgresql/lib/pg_cron* /opt/bitnami/postgresql/lib/
COPY --from=build /opt/bitnami/postgresql/share/extension/pg_cron* /opt/bitnami/postgresql/share/extension/

USER 0
RUN apt-get update && apt-get upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER 1001
