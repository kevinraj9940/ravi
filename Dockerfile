# Use the official PHP image as the base image
FROM php:7.4-apache

# Copy the application files to the container
COPY ./var/www/html

# Set the working directory in the container
WORKDIR /var/www/html

# Install neccesaary PHP extentions
RUN apt-get update && apt-get install-y\
  libicu-dev\
  libzip-dev\
  && docker-php-ext-install\
  intl\
  zip\
  && a2enmod rewrite

# Expose PORT 80
EXPOSE 80

# Define the entry point for the container
CMD["apache2-foreground"]
