FROM php:8.3-fpm-alpine3.23

RUN set -ex && \
    apk upgrade --no-cache && \
    apk add --no-cache --virtual .phpize-deps \
        $PHPIZE_DEPS && \
    apk add --no-cache --virtual .build-deps \
        postgresql-dev \
        libstdc++ \
        make && \
    apk add --no-cache \
        bash \
        wget \
        curl \
        libpq \
        libbz2 \
        libzip-dev \
        zlib-dev \
        linux-headers \
        bzip2-dev \
        libxslt-dev \
        libmcrypt-dev \
        libxml2=~2.13 \
        libxml2-dev \
        libxml2-utils \
        libjpeg-turbo-dev \
        libpng-dev \
        yaml-dev \
        libaio-dev \
        oniguruma-dev \
        php83-bz2 \
        php83-pdo \
        php83-pgsql \
        php83-bcmath \
        php83-curl \
        php83-intl \
        php83-pear && \
    apk add --no-cache \
        php83-pecl-zmq --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    NPROC="$(getconf _NPROCESSORS_ONLN)" && \
    docker-php-ext-configure gd --with-jpeg && \
    docker-php-ext-install -j${NPROC} bcmath bz2 exif gd opcache pcntl pdo_pgsql sockets xsl zip intl && \
    pecl install apcu && \
    docker-php-ext-enable apcu && \
    php -d memory_limit=-1 && \
    apk del --no-cache .build-deps && \
    rm -f /var/cache/apk/*
