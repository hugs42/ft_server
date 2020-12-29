FROM debian:buster

ENV USER_WORDPRESS 'root'
ENV USER_PASSWORD 'toor'
ENV AUTOINDEX on

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install nginx -y
RUN apt-get install mariadb-server -y
RUN apt-get install php7.3 php-fpm php-cli php-mysql -y
RUN apt-get install openssl -y

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin


RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv wordpress /var/www/html/
RUN rm -rf latest.tar.gz

COPY ./srcs/init.sh ./
COPY ./srcs/nginx.conf /etc/nginx/sites-available/nginx.config
RUN ln -s /etc/nginx/sites-available/
#COPY ./srcs/default.conf /tmp/default.conf
COPY ./srcs/wp-config.php /var/www/html/wordpress

EXPOSE 80 433
RUN sh init.sh
