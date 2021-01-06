FROM debian:buster

ENV AUTOINDEX on

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install nginx -y
RUN apt-get install php7.3 php7.3-fpm php7.3-cli php7.3-mysql php7.3-mbstring -y
RUN apt-get install openssl -y
RUN apt-get install mariadb-server -y

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin
RUN rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz
RUN mv wordpress /var/www/html/
RUN rm -rf latest.tar.gz

COPY ./srcs/init.sh ./
COPY ./srcs/default.conf /etc/nginx/sites-available/default
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY ./srcs/wp-config.php /var/www/html/wordpress/wp-config.php
COPY ./srcs/autoindex_on ./
COPY ./srcs/autoindex_off ./
RUN rm /var/www/html/index.nginx-debian.html

EXPOSE 80
EXPOSE 443
CMD bash init.sh
