FROM php:7.2.22-fpm-alpine3.9

ARG APP_DEBUG

RUN apk add --no-cache nginx

RUN apk add --no-cache icu-dev

RUN apk add --no-cache \
    composer \
    libzip-dev \
    autoconf automake libtool nasm \
    pcre-dev g++ gcc make sudo \
    libpng-dev \
    openrc supervisor rsyslog \
    nodejs npm \
    shadow \
    tzdata \
    git

# replace iconv
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN export TZ=Asia/Ho_Chi_Minh

RUN docker-php-ext-install intl pdo_mysql mbstring exif gd zip

# useradd
RUN groupadd -g 1000 www && \
    useradd -s /bin/bash -u 1000 -N -g www -K MAIL_DIR=/dev/null -d /var/www www

WORKDIR /var/www
ADD . /var/www
ADD ./.docker/nginx/conf.d/ /etc/nginx/conf.d/
ADD ./.docker/nginx/nginx.conf /etc/nginx/nginx.conf

ADD ./.docker/php/7.2/php-fpm.d/www.conf /usr/local/etc/php-fpm.d/zzz-www.conf
ADD ./.docker/php/7.2/php.ini /etc/php7/php.ini

ADD ./.docker/supervisor/supervisord.conf /etc/supervisord.conf
ADD ./.docker/supervisor/supervisor.d/ /etc/supervisor.d/

RUN mkdir /run/php-fpm7.2
RUN mkdir /run/nginx

RUN chown www:www -R /run/php-fpm7.2 && \
    chown www:www -R /var/tmp/nginx && \
    chown www:www -R /var/www && \
    ln -sf /dev/stdout /var/log/messages

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

ADD ./.docker/setup.sh /var/www/.docker/setup.sh
RUN chmod 755 /var/www/.docker/setup.sh
RUN APP_DEBUG=$APP_DEBUG sh /var/www/.docker/setup.sh

CMD ["/usr/bin/supervisord"]
