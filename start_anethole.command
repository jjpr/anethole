#!/bin/bash

CONTAINER_NAME=anethole
NOTEBOOK_DIRECTORY=${HOME}/Documents/${CONTAINER_NAME}-notebooks/data/notebooks

mkdir -p ${NOTEBOOK_DIRECTORY}

[ ! "$(docker ps -aq -f name=$CONTAINER_NAME)" ] && docker container create --init -it -p 8888:8888 --mount type=bind,source=${NOTEBOOK_DIRECTORY},target=/data/notebooks --name ${CONTAINER_NAME} jjpr/anethole:latest

docker container start -i ${CONTAINER_NAME}

exec docker container attach --sig-proxy=true ${CONTAINER_NAME}

