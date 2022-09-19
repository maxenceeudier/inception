FROM	alpine:3.15

RUN	apk update && apk upgrade \
	&& apk add openrc \
	&& apk add mariadb \
	&& apk add mariadb-common \
	&& apk add mariadb-client \
	&& apk add mariadb-server-utils

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE	3306	

