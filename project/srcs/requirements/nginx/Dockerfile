FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y nginx
COPY ./conf/nginx.conf /etc/nginx/conf/nginx.conf
COPY ./html/hii.html /var/www/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
