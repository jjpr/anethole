#!/bin/bash

export CONTAINER_NAME=anethole
export CONTAINER="$(docker ps -aq -f name=$CONTAINER_NAME)"
BROWSER_SCRIPT=$(dirname $0)/open_browser.sh

docker rm -f ${CONTAINER}
pkill -f "bash $BROWSER_SCRIPT"