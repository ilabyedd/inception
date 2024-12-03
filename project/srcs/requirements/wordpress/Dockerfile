FROM debian:buster
RUN apt-get -y update && apt-get -y upgrade \
 && apt update -y && apt upgrade -y 
RUN apt install php-fpm php-mysql -y && apt install curl -y 

COPY ./tools/script.sh /

RUN chmod +x script.sh
# COPY ./tools/wp-config.php /

# COPY .env /var/www/.env

EXPOSE 9000

CMD ["/script.sh"]