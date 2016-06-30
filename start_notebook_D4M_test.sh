#!/bin/bash

CONTAINER_NAME=equation-to-object

docker create -p 2222:22 -p 80:8888 -v ~/Documents/Kitematic/${CONTAINER_NAME}-notebooks/data/notebooks:/data/notebooks --name ${CONTAINER_NAME} jjpr/equation-to-object:latest || echo ${CONTAINER_NAME} exists

docker start ${CONTAINER_NAME}

(sleep 10; open "http://localhost") &

sleep 5

expect -c "spawn ssh -t -Y -p 2222 root@localhost jupyter notebook --no-browser --ip=* --notebook-dir=/data; expect \"assword:\"; send \"password\r\"; interact"

echo Done