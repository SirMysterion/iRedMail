
FROM ubuntu-upstart:14.04

### Update and customize ubuntu packages.
RUN apt-get update ;\
    apt-get -y upgrade
RUN apt-get -y purge openssh-server openssh-client ;\
    apt-get -y autoremove
RUN apt-get -y install vim nano aptitude wget bzip2 bash-completion

ENV IREDMAIL iRedMail-0.9.0

### Download and unzip iRedMail.
RUN wget https://bitbucket.org/zhb/iredmail/downloads/$IREDMAIL.tar.bz2 ;\
    tar xvjf $IREDMAIL.tar.bz2 ;\
    rm $IREDMAIL.tar.bz2 ;\
    chmod +x $IREDMAIL/iRedMail.sh

WORKDIR /$IREDMAIL/

### Install iRedMail.
COPY iRedMail_config.sh ./
RUN hostname example.org ;\
    ./iRedMail_config.sh ;\
    ./iRedMail.sh

### Make some additional system configurations.
COPY sysconfig/ sysconfig.sh ./
RUN ./sysconfig.sh
