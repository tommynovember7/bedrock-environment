FROM tommynovember7/docker-php:7.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    libicu-dev>=57.1-6+deb9u3 \
    mailutils>=1:3.1.1-1 \
    python-pip>=9.0.1-2+deb9u1 \
    python-setuptools>=33.1.1-1 \
    ssmtp>=2.64-8+b2 \
    unzip>=6.0-21+deb9u2 \
    zlib1g-dev>=1:1.2.8.dfsg-5 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# PHP
RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions \
    && sync

RUN install-php-extensions apcu
RUN install-php-extensions bz2
RUN install-php-extensions calendar
RUN install-php-extensions gettext
RUN install-php-extensions igbinary
RUN install-php-extensions mcrypt
RUN install-php-extensions redis
RUN install-php-extensions shmop
RUN install-php-extensions soap
RUN install-php-extensions sockets
RUN install-php-extensions sysvmsg
RUN install-php-extensions sysvsem
RUN install-php-extensions sysvshm
RUN install-php-extensions wddx
RUN install-php-extensions xdebug
RUN install-php-extensions xsl

# ssmtp
RUN printf "root=%s\nhostname=\"%s\"\n" 'postmaster' 'localhost' > /etc/ssmtp/ssmtp.conf && \
    printf "mailhub=%s\nFromLineOverride=%s\n" 'smtp:1025' 'YES' >> /etc/ssmtp/ssmtp.conf

# PHP
RUN printf  "[date]\ndate.timezone = %s\n" 'Asia/Tokyo' > /usr/local/etc/php/conf.d/date.ini \
    && echo "memory_limit=-1" > /usr/local/etc/php/conf.d/memory-limit.ini \
    && printf "[mbstring]\nmbstring.internal_encoding = %s\nmbstring.language = %s\n" 'UTF-8' 'Japanese' > /usr/local/etc/php/conf.d/mbstring.ini \
    && echo "output_buffering = On" > /usr/local/etc/php/conf.d/output-buffering.ini \
    && printf "upload_max_filesize = %s\npost_max_size = %s\n" '100M' '40M' > /usr/local/etc/php/conf.d/upload.ini \
    && printf "phar.readonly = %s\nphar.require_hash = %s\n" 'Off' 'OFF' > /usr/local/etc/php/conf.d/phar-conf.ini \
    && echo 'sendmail_path = "/usr/sbin/ssmtp -t"' > /usr/local/etc/php/conf.d/mail.ini \
    && printf "\nxdebug.remote_enable = %s\nxdebug.remote_autostart = %s" 'On' 'On' >> /usr/local/etc/php/conf.d/xdebug.ini \
    && printf "\nxdebug.remote_connect_back = %s\nxdebug.remote_host = docker.for.mac.localhost" 'Off' >> /usr/local/etc/php/conf.d/xdebug.ini

# composer
COPY composer.phar /usr/local/bin/composer.phar
RUN /usr/local/bin/composer.phar self-update
