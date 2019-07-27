FROM php:7.3-fpm-alpine

MAINTAINER i3bepb

# Для отладки установка bash
# RUN apk update && apk add --no-cache bash
RUN apk update && apk add --no-cache git \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && docker-php-ext-install mysqli pdo pdo_mysql
