#!/bin/bash

set -ux

mkdir -p /home/scm/repos/git
mkdir -p /home/scm/repos/svn
#chown -R www-data /home/scm/repos

/etc/init.d/apache2 start

tail -F /var/log/apache2/*.log
