#!/bin/bash

CONTAINER_NAME=anethole
NOTEBOOK_DIRECTORY=${HOME}/Documents/${CONTAINER_NAME}-notebooks/data/notebooks

mkdir -p ${NOTEBOOK_DIRECTORY}

if docker create -t -p 8888:8888 --mount type=bind,source=${NOTEBOOK_DIRECTORY},target=/data/notebooks --name ${CONTAINER_NAME} jjpr/anethole:latest ; then
    echo ${CONTAINER_NAME} created
else
    echo ${CONTAINER_NAME} exists
fi

docker start -ai ${CONTAINER_NAME}

echo Done
