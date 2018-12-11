FROM php:7.2-fpm
MAINTAINER Radek Z <radek.dev@gmail.com>

# Update sources
RUN apt-get update -y
#RUN apt-get install -y procps

#RUN apt-get install -y build-essential

#RUN apt-get install -y apt-utils

#RUN apt-get install -y net-tools

#RUN apt-get install -y lsof

# Install Midnight Commander, Vim, Nano
#RUN apt-get install -y mc
RUN apt-get install -y vim nano

RUN apt-get install -y wget

# when install nginx is in this file then PHP socket is not created
#RUN apt-get install -y nginx
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#EXPOSE 80 443

# Set workdir
WORKDIR /var/www/project
RUN cd /var/www/project

#RUN composer install
#RUN composer dump-autoload --optimize

# Cleanup the image
RUN rm -rf /var/lib/apt/lists/* /tmp/*

#RUN mkdir /var/run/php-fpm
#RUN chmod -R o+rw /var/run/php-fpm/

#EXPOSE 80
#CMD ["nginx"]
