#!/bin/bash -x

### create a container with forwarded ports
docker create --name=iredmail \
       -p 443:443 -p 587:587 -p 995:995 -p 993:993 \
       iredmail
