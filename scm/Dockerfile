FROM ubuntu:xenial-20190222

ENV TZ=Asia/Tokyo

RUN set -ux \
    \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apache2 \
        git \
        libapache-dbi-perl \
        libapache2-mod-perl2 \
        libapache2-svn \
        libauthen-simple-ldap-perl \
        libdbd-mysql-perl \
        #libsvn-perl \
        mysql-client \
        subversion \
        tzdata \
        vim \
    && rm -rf /var/lib/apt/lists/* \
    \
    && a2enmod dav \
    && a2enmod dav_fs \
    && a2enmod dav_svn \
    && a2enmod perl \
    \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

COPY etc/apache2/mods-available/ /etc/apache2/mods-available/
COPY run_apache.sh /home/scm/

#RUN set -ux \
    #\
    #&& mkdir -p /home/scm/repos/git \
    #&& mkdir -p /home/scm/repos/svn \
    #&& chown -R www-data /home/scm

EXPOSE 80

WORKDIR /home/scm

#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_PID_FILE /var/run/apache2.pid
#ENV APACHE_RUN_DIR /var/run/apache2
#ENV APACHE_LOG_DIR /var/log/apache2
#ENV APACHE_LOCK_DIR /var/lock/apache2

#CMD ["apachectl", "-D", "FOREGROUND"]

CMD ["/home/scm/run_apache.sh"]
