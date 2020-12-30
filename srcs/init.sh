mkdir /var/www/localhost
chown -R www-data:www-data /var/www/html/*
chmod -R 755 /var/www/html/*

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=hugsbord/CN=localhost"

service mysql start
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "GRANT ALL ON wordpress.* TO 'root'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
#echo "daemon off;" >> /etc/nginx/nginx.conf
#service mysql restart
service nginx start
service php7.3-fpm start
#export PATH=$PATH:/home/bin
/bin/bash
