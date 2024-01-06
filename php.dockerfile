FROM php:7.4-fpm-alpine


# Install system dependencies
RUN apk --no-cache add \
    mysql-client \
    libzip-dev \
    imagemagick-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    icu-dev \
    autoconf \
    g++ \
    make

# Install PHP extensions
RUN docker-php-ext-install zip intl

RUN docker-php-ext-install mysqli

RUN docker-php-ext-install exif

# Install Imagick extension
RUN pecl install imagick && \
    docker-php-ext-enable imagick

# Install GD extension
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd

# Clean up
RUN rm -rf /var/cache/apk/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html
