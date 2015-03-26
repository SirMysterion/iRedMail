#!/bin/bash -x

### customize the shell prompt
echo iRedMail > /etc/debian_chroot
sed -i /root/.bashrc \
    -e '/^#force_color_prompt=/c force_color_prompt=yes'
PS1='\\n\\[\\033[01;32m\\]${debian_chroot:+($debian_chroot)}\\[\\033[00m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\e[32m\\]\\n==> \\$ \\[\\033[00m\\]'
sed -i /root/.bashrc \
    -e "/^if \[ \"\$color_prompt\" = yes \]/,+2 s/PS1=.*/PS1='$PS1'/"

### copy config files over to the system
dir=$(dirname $0)
cp -TdR $dir/sysconfig/ /

### disable spam and virus checking (consumes too much resources)
### see: http://www.iredmail.org/docs/completely.disable.amavisd.clamav.spamassassin.html
sed -i /etc/amavis/conf.d/50-user \
    -e '/^@bypass_virus_checks_maps/,+4 s/^/#/' \
    -e '/^@bypass_spam_checks_maps/,+4 s/^/#/'

### disable some other services
update-rc.d sogo disable
update-rc.d clamav-daemon disable
update-rc.d clamav-freshclam disable
