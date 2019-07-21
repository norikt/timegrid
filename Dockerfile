FROM php:7.2-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN docker-php-ext-install pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD composer.json /usr/src/app/
ADD composer.lock /usr/src/app/
RUN composer install 

ADD . /usr/src/app
