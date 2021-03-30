#!/bin/bash

set -eux

mkdir -p /home/scm/repos/git
mkdir -p /home/scm/repos/svn
#chown -R www-data /home/scm/repos
chmod -R a+rw /home/scm/repos

. /etc/apache2/envvars
/usr/sbin/apache2 -D FOREGROUND
