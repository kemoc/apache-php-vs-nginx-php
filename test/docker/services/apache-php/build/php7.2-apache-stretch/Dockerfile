FROM php:7.2-apache-stretch
MAINTAINER Radek Z <radek.dev@gmail.com>

# Update sources
RUN apt update -y

RUN apt install -y build-essential

RUN apt install -y apt-utils

# Install Midnight Commander, Vim, Nano
#RUN apt-get install -y mc
RUN apt-get install -y vim nano

RUN apt install -y wget

# Set workdir
WORKDIR /var/www/project
RUN cd /var/www/project

#RUN composer install
#RUN composer dump-autoload --optimize

# Cleanup the image
RUN rm -rf /var/lib/apt/lists/* /tmp/*
