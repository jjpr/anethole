#!/bin/bash

docker-machine start default
eval "$(docker-machine env default)"

CONTAINER_NAME=$(date "+%Y-%m-%d")-mayavi-experiments

docker create -p 2222:22 -p 80:8888 -v ~/Documents/Kitematic/$CONTAINER_NAME/data/notebooks:/data/notebooks --name $CONTAINER_NAME jjpr/mayavi-jupyter:latest

docker start $CONTAINER_NAME

(sleep 10; open "http://$(docker-machine ip default)") &

expect -c "spawn ssh -t -Y -p 2222 root@$(docker-machine ip default) jupyter notebook --no-browser --ip=* --notebook-dir=/data; expect \"assword:\"; send \"password\r\"; interact"

echo Done