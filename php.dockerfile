FROM php:7.4-fpm-alpine

RUN apk --no-cache add mysql-client

RUN docker-php-ext-install mysqli

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html
