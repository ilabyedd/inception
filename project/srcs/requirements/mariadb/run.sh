#!/bin/bash
docker stop mariadb
docker rm mariadb
docker rmi mariadb 
docker build -t mariadb .
docker run -itd -p 3306:3306 --name mariadb mariadb 
docker logs mariadb