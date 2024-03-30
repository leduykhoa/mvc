FROM php:8.1-fpm

LABEL maintainer="<Lê Duy Khoa>leduykhoa060690@gmail.com"

RUN apt-get update && apt-get install -y wget curl 
RUN apt-get install -y libc-dev pkg-config libonig-dev
RUN apt-get install -y zlib1g-dev libzip-dev libcurl3-openssl-dev libxml2-dev libmcrypt-dev \
    libpq-dev \
    libpng-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev libmagickwand-dev

RUN pecl install mcrypt \
    && pecl install -f xdebug \
    && pecl install -f imagick \
    && pecl install -f xmlrpc-beta \
    && docker-php-ext-install gettext \
    && docker-php-ext-install gd \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install soap  \
    && docker-php-ext-install bcmath  \
    && docker-php-ext-install exif  \
    && docker-php-ext-install mbstring  \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable xdebug