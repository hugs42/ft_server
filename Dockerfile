FROM debian:buster

ENV AUTOINDEX on

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install nginx -y

RUN apt-get install php7.3 php-fpm php-cli php-mysql -y
RUN apt-get install openssl -y
RUN apt-get install mariadb-server -y

COPY ./srcs/autoindex_on.sh ./
COPY ./srcs/autoindex_off.sh ./

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/html/phpMyAdmin
COPY ./srcs/config.inc.php /var/www/html/phpMyAdmin

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz
RUN mv wordpress /var/www/html/
RUN rm -rf latest.tar.gz
COPY ./srcs/wp-config.php /var/www/html/wordpress/wp-config.php



COPY ./srcs/init.sh ./
COPY ./srcs/default.conf /etc/nginx/sites-available/default
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
EXPOSE 80
EXPOSE 443
CMD bash init.sh
