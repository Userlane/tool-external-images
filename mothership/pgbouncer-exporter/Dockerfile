FROM golang:1.25-alpine AS builder
WORKDIR /app

# hadolint ignore=DL3018
RUN apk upgrade --no-cache && apk add --no-cache git && \
    git clone --depth 1 https://github.com/prometheus-community/pgbouncer_exporter . && \
    go get -u && go mod tidy && \
    CGO_ENABLED=0 go build -o pgbouncer_exporter -ldflags="-s -w"

FROM ghcr.io/userlane/tool-external-images/busybox-linux-amd64:95b4653eb9e9e9810bec7f55b428cefd04c02fe578fbb83cb7372611d525abeb

RUN addgroup -g 1001 -S pgbouncer && adduser -u 1001 -S -G pgbouncer pgbouncer

COPY --from=builder /app/pgbouncer_exporter /bin/pgbouncer_exporter
COPY entrypoint.sh /bin/entrypoint.sh

RUN chown -R pgbouncer:pgbouncer /bin/pgbouncer_exporter /bin/entrypoint.sh && \
    chmod +x /bin/pgbouncer_exporter /bin/entrypoint.sh

ENV PRE_SLEEP=5

USER pgbouncer

ENTRYPOINT ["/bin/entrypoint.sh"]
