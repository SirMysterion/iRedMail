#!/bin/bash -x

### build an initial image
cd $(dirname $0)
docker build -t iRedMail:init .

### run the config script (iRedMail.sh) on the initial image
docker run -it --name=iRedMail-config iRedMail:init /$IREDMAIL/iRedMail.sh

### save the configured container as an image
docker rmi iRedMail
docker commit iRedMail-config iRedMail
docker rm iRedMail-config
