#!/bin/bash

CONTAINER_NAME=anethole
NOTEBOOK_DIRECTORY=~/Documents/${CONTAINER_NAME}-notebooks/data/notebooks

mkdir -p ${NOTEBOOK_DIRECTORY}

docker create -t -p 8888:8888 --mount type=bind,source=${NOTEBOOK_DIRECTORY},target=/data/notebooks --name ${CONTAINER_NAME} jjpr/anethole:latest || echo ${CONTAINER_NAME} exists

docker start -i ${CONTAINER_NAME}

echo Done
