#!/bin/bash

CONTAINER_NAME=anethole
NOTEBOOK_DIRECTORY=${HOME}/Documents/${CONTAINER_NAME}-notebooks/data/notebooks

mkdir -p ${NOTEBOOK_DIRECTORY}

[ ! "$(docker ps -aq -f name=$CONTAINER_NAME)" ] && docker create --init -it -p 8888:8888 --mount type=bind,source=${NOTEBOOK_DIRECTORY},target=/data/notebooks --name ${CONTAINER_NAME} jjpr/anethole:latest

[ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ] && docker start ${CONTAINER_NAME}

while [ -z "$(docker ps -q -f name=$CONTAINER_NAME)" ]; do sleep 1; done

while [ -z "$(docker exec -it anethole jupyter server list --json)" ]; do sleep 1; done

eval $(docker exec -it anethole jupyter server list --json | /usr/bin/python3 -c $'import json,sys;obj=json.load(sys.stdin);print(f"open http://127.0.0.1:8888/lab?token={obj[\'token\']}")')

docker attach anethole
