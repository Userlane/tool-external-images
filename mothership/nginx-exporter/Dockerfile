## Using custom build, maybe until a newer version is available
# FROM nginx/nginx-prometheus-exporter:1.4.2

# USER 1001
## End of previous build

# syntax=docker/dockerfile:1.17
FROM golang:1.25 AS builder
ARG VERSION=v1.4.2
ARG TARGETARCH=amd64

RUN git clone --depth 1 --branch $VERSION https://github.com/nginx/nginx-prometheus-exporter.git /nginx-prometheus-exporter

WORKDIR /nginx-prometheus-exporter

RUN go mod download \
    && CGO_ENABLED=0 GOOS=linux GOARCH=$TARGETARCH go build -trimpath -a -ldflags "-s -w -X main.version=${VERSION}" -o nginx-prometheus-exporter .


FROM --platform=$BUILDPLATFORM alpine:3.23 AS certs
RUN apk upgrade --no-cache

FROM scratch AS base
COPY --from=certs --link /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
USER 1001:1001
ENTRYPOINT [ "/usr/bin/nginx-prometheus-exporter" ]


FROM base
COPY --from=builder --link /nginx-prometheus-exporter/nginx-prometheus-exporter /usr/bin/
