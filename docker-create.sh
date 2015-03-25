#!/bin/bash 

NAME=${1:-iredmail}
HOSTNAME=mail.example.org
IMAGE=iredmail
#IMAGE=dashohoxha/iredmail
PORTS="587 995 993"

FORWARD_PORTS=''
for port in $PORTS
do
    FORWARD_PORTS="$FORWARD_PORTS -p $port:$port"
done

### create a container with forwarded ports
docker create --name=$NAME --hostname=$HOSTNAME \
       $FORWARD_PORTS \
       $IMAGE

### start the container
echo "Start the container with:
    docker start $NAME
"
