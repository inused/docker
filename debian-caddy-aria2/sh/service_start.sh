#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# sshd
/etc/init.d/ssh start

# php-fpm
/etc/init.d/php7.0-fpm start

# cron
/etc/init.d/cron start

