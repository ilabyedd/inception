#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

service mysql start
sleep 5

echo "CREATE DATABASE IF NOT EXISTS wpdb ;" > db.sql
echo "CREATE USER IF NOT EXISTS 'mysql_user'@'%' IDENTIFIED BY '1234' ;" >> db.sql  
echo "GRANT ALL PRIVILEGES ON wpdb.* TO 'mysql_user'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db.sql
echo "FLUSH PRiVILEGES;" >> db.sql

mysql < db.sql

# kill $(cat /var/run/mysqld/mysqld.pid)
mysqladmin -u root -p12345 shutdown

exec mysqld
