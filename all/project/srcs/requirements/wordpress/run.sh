#!/bin/bash
docker stop wdps
docker rm wdps
docker rmi wdps 
docker build -t wdps .
docker run -itd -p 9000:9000 --name wdps wdps 
docker logs wdps