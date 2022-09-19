FROM alpine:3.15

RUN 	apk update && apk upgrade && apk add --no-cache --quiet --update nginx \
	&& apk add --no-cache --quiet --update openssl

RUN	mkdir -p /etc/nginx/ssl

RUN 	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/meudier.42.fr.crt \	
	-keyout /etc/nginx/ssl/meudier.42.fr.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=meudier.42.fr/UID=meudier"

RUN	mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE	443

CMD	[ "nginx", "-g", "daemon off;" ]
