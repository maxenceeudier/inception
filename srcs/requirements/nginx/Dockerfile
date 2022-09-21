FROM	debian:buster

RUN 	apt-get update
RUN 	apt-get install -y nginx openssl

EXPOSE 443

COPY	./conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN		mkdir -p /etc/nginx/ssl

RUN 	openssl req -x509 -nodes \
		-out /etc/nginx/ssl/meudier.42.fr.crt \	
		-keyout /etc/nginx/ssl/meudier.42.fr.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/CN=meudier.42.fr"

CMD	[ "nginx", "-g", "daemon off;" ]
