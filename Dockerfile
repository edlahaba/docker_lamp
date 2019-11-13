FROM php:7.2-apache

# Sets configuration environment variables
ENV DB_NAME=wordpress_db DB_USER=wordpress_user DB_PASSWORD=wordpress_pass

# Sets default folder to work with it
WORKDIR /var/www/html

# Download and configurate wordpress
ADD http://wordpress.org/latest.tar.gz ./
RUN tar xfz latest.tar.gz && mv wordpress/* ./
COPY ./wp-config.php ./

# Installs PHP extension to connect with the database
RUN docker-php-ext-install mysqli
