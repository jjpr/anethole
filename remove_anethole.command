#!/bin/bash

export CONTAINER_NAME=anethole
export CONTAINER="$(docker ps -aq -f name=$CONTAINER_NAME)"
docker rm -f ${CONTAINER}
