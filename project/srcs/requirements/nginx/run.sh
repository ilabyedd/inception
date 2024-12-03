#!/bin/bash
docker stop nginx
docker rm nginx
docker rmi nginx 
docker build -t nginx .
docker run -itd -p 8080:80 --name nginx nginx 
docker logs nginx