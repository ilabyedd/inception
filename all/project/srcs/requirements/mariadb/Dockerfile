FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y 

# RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir -p /var/run/mysqld/

# COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./tools/script.sh /

RUN chmod +x /script.sh


CMD ["/script.sh"]
