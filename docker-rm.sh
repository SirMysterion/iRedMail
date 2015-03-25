#!/bin/bash -x

cd $(dirname $0)

docker stop iredmail
docker rm iredmail
docker rmi iredmail
