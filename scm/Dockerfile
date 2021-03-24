FROM ubuntu:xenial-20190222

RUN set -ux \
    \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2 \
        git \
        libapache2-mod-perl2 \
        libapache2-svn \
        #libsvn-perl \
        subversion \
        vim \
    && rm -rf /var/lib/apt/lists/* \
    \
    #&& a2enmod dav_svn \
    \
    && mkdir -p /home/scm \
    #&& mkdir -p /home/scm/repos/git \
    #&& mkdir -p /home/scm/repos/svn \
    && chown -R www-data /home/scm

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

EXPOSE 80

#CMD ["apachectl", "-D", "FOREGROUND"]

COPY run_apache.sh /home/scm/
COPY etc/apache2/mods-available/* /etc/apache2/mods-available/

WORKDIR /home/scm

CMD ["/home/scm/run_apache.sh"]
