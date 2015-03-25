#!/bin/bash

cd $(dirname $0)
docker build --tag=iredmail .

echo "
Customize 'docker-create.sh' and create a container with it.
"
