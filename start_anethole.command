#!/bin/bash

echo first line $(date) >> script.log

CONTAINER_NAME=anethole
NOTEBOOK_DIRECTORY=${HOME}/Documents/${CONTAINER_NAME}-notebooks/data/notebooks

mkdir -p ${NOTEBOOK_DIRECTORY}

[ ! "$(docker ps -aq -f name=$CONTAINER_NAME)" ] && docker create --init -it -p 8888:8888 --mount type=bind,source=${NOTEBOOK_DIRECTORY},target=/data/notebooks --name ${CONTAINER_NAME} jjpr/anethole:latest

[ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ] && docker start -i ${CONTAINER_NAME} &
echo after docker start $(date) >> script.log

while [ -z "$(docker ps -q -f name=$CONTAINER_NAME)" ]; do sleep 1; done
echo container is running $(date) >> script.log

while { echo "begin while" >> script.log; anethole="$(docker exec -it anethole jupyter server list --json)"; echo anethole is "$anethole" >> script.log; [ -z "$anethole" ]; } ; do sleep 1; done
echo Jupyter is running $(date) >> script.log

#eval $(docker exec -it anethole jupyter server list --json | /usr/bin/python3 -c $'import json,sys;obj=json.load(sys.stdin);print(f"open http://127.0.0.1:8888/lab?token={obj[\'token\']}")')
echo penultimate line $(date) >> script.log
docker wait anethole
