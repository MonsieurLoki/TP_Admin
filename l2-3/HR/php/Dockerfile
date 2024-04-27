FROM php:8.3-fpm 
RUN apt update
RUN apt upgrade -y
RUN apt install -y nano net-tools iputils-ping curl iproute2 htop vim lynx
RUN docker-php-ext-install mysqli

