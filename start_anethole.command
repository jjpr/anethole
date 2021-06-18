#!/bin/bash

export CONTAINER_NAME=anethole
export NOTEBOOK_DIRECTORY=${HOME}/Documents/${CONTAINER_NAME}-notebooks/data/notebooks
BROWSER_SCRIPT=$(dirname $0)/open_browser.sh

mkdir -p ${NOTEBOOK_DIRECTORY}

[ ! "$(docker ps -aq -f name=$CONTAINER_NAME)" ] && docker create --init -e TINI_SUBREAPER=true -it -p 8888:8888 --mount type=bind,source=${NOTEBOOK_DIRECTORY},target=/data/notebooks --name ${CONTAINER_NAME} jjpr/anethole:latest

pkill -f "bash $BROWSER_SCRIPT"

bash $BROWSER_SCRIPT &

[ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ] && docker start -ai ${CONTAINER_NAME}
