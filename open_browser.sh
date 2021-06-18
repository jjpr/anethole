#!/bin/bash

while [ -z "$(docker ps -q -f name=$CONTAINER_NAME)" ]; do sleep 1; done

while [ -z "$(docker exec -i anethole jupyter server list --json)" ]; do sleep 1; done

eval $(docker exec -i anethole jupyter server list --json | /usr/bin/python3 -c $'import json,sys;obj=json.load(sys.stdin);print(f"open http://127.0.0.1:8888/lab?token={obj[\'token\']}")')
