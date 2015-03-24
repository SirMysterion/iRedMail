#!/bin/bash -x

### build an initial image
cd $(dirname $0)
docker build -t iredmail:init .

### run the config script (iRedMail.sh) on the initial image
docker run -it --name=iredmail-config iredmail:init /$IREDMAIL/iRedMail.sh

### save the configured container as an image
docker rmi iredmail
docker commit iredmail-config iredmail
docker rm iredmail-config
