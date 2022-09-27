FROM debian:buster

#Install necessary package from php
RUN apt-get update && apt-get -y install \
wget \
php \
php-cgi \
php-mysql \
php-fpm \
php-pdo \
php-gd php-cli \
php-mbstring \
&& rm -rf /var/lib/apt/lists/*

#change the php conf with my own www.conf
RUN     rm -rf /etc/php/7.3/fpm/pool.d/www.conf
COPY    ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#Create the folder to enable php start
RUN mkdir /run/php

#Launch my script
COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["create_wordpress.sh"]

#to work in /var/www/html
WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]