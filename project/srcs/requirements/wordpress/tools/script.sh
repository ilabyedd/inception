#!/bin/bash

DB_NAME="wpdb"
DB_USER="mysql_user"
DB_PASSWORD="1234"
DB_HOST="mariadb:3306"

sleep 10
# mkdir /var/www/
# mkdir -p /var/www/html || echo "Failed to create /var/www/html"

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
 
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i -r "s/'database_name_here'/'$DB_NAME'/1"   /var/www/html/wp-config.php
sed -i -r "s/'username_here'/'$DB_USER'/1"  /var/www/html/wp-config.php
sed -i -r "s/'password_here'/'$DB_PASSWORD'/1"    /var/www/html/wp-config.php
sed -i -r "s/'localhost'/'$DB_HOST'/1"    /var/www/html/wp-config.php

wp core install --url='ilabyed.42.fr'/ --title='wp' --admin_user='ilabyed' --admin_password='123456' --admin_email='lbydissam@gmail.com' --skip-email --allow-root



wp user create 'ilabyedd' 'lbydisssam@gmail.com' --role=author --user_pass='1223456' --allow-root


wp theme install astra --activate --allow-root


# wp plugin install redis-cache --activate --allow-root

# wp plugin update --all --allow-root


 
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php



# wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F