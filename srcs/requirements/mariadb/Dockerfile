FROM	alpine:3.15

RUN	apk update && apk upgrade \
	&& apk add openrc \
	&& apk add mariadb \
	&& apk add mariadb-common \
	&& apk add mariadb-client \
	&& apk add mariadb-server-utils

EXPOSE	3306	

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/init_db.sql && rm -f /var/www/init_db.sql;

CMD ["mysqld"]
