FROM php:7.2-apache

RUN docker-php-ext-install mysqli
WORKDIR /var/www/html
ADD http://wordpress.org/latest.tar.gz ./
RUN tar xfz latest.tar.gz && mv wordpress/* ./
COPY ./wp-config.php ./

ENV DB_NAME wordpress_db
ENV DB_USER wordpress_user
ENV DB_PASSWORD wordpress_pass

EXPOSE 80
