FROM golang:1.25-alpine AS builder

WORKDIR /app

# hadolint ignore=DL3018
RUN apk upgrade --no-cache && apk add --no-cache git && \
    git clone --depth 1 https://github.com/hipages/php-fpm_exporter . && \
    CGO_ENABLED=0 go build -o php-fpm_exporter -ldflags="-s -w"

FROM alpine:3.23

COPY --from=builder /app/php-fpm_exporter /bin/php-fpm_exporter

RUN set -ex && \
    apk upgrade --no-cache && \
    adduser -D exporter

USER       exporter

EXPOSE     9253

ENTRYPOINT [ "/bin/php-fpm_exporter", "server" ]
