FROM php:8.3 AS tennis-kata-php

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

FROM tennis-kata-php AS tennis-kata-composer

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install --yes libzip-dev \
    && docker-php-ext-install zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENTRYPOINT ["/usr/bin/composer"]
CMD ["install"]
