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
        logrotate \
        mysql-client \
        subversion \
        tzdata \
        vim \
    && rm -rf /var/lib/apt/lists/* \
    \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata
    #\
    #&& a2enmod dav \
    #&& a2enmod dav_fs \
    #&& a2enmod dav_svn \
    #&& a2enmod perl

COPY etc/apache2/ /etc/apache2/
COPY usr/share/perl5/ /usr/share/perl5/
COPY run_apache.sh /home/scm/

RUN set -ux \
    \
    #&& mkdir -p /home/scm/repos/git \
    #&& mkdir -p /home/scm/repos/svn \
    #&& chown -R www-data /home/scm \
    && chmod a+x /home/scm/run_apache.sh \
    && echo "ServerName localhost" > /etc/apache2/conf-available/fqdn.conf \
    && a2enconf fqdn

RUN set -ux \
    \
    && echo "default-character-set = utf8" >> /etc/mysql/conf.d/mysql.cnf

EXPOSE 80

WORKDIR /home/scm

CMD /home/scm/run_apache.sh
