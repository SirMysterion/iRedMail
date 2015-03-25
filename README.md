# iRedMail
Scripts to build and manage a docker container for [iRedMail](http://www.iredmail.org).

## Instructions

 - Build the image: `./docker-build.sh`
 - Edit and customize **docker-create.sh** and then run it: `./docker-create.sh`. It will create the container `iredmail`.
 - Start the container: `docker start iredmail`
 - We need to install **docker-enter**. Do it like this: `docker run -v /usr/local/bin:/target jpetazzo/nsenter`
 - Now we can access the shell of the running container **iredmail**: `docker-enter iredmail`
 - Customize the configuration of iRedMail: ```cd /iRedMail-0.9.0/ ; chmod +x iRedMail.sh ; ./iRedMail.sh```
 - Etc.
