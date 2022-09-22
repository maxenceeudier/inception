FROM	debian:buster

RUN 	apt-get update
RUN 	apt-get install -y nginx openssl

EXPOSE 443

COPY	./conf/nginx.conf /etc/nginx/conf.d/default.conf




RUN		openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
		-out /etc/ssl/meudier.42.fr.pem \
 		-keyout /etc/ssl/meudier.42.fr.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=meudier.42.fr";
# RUN 	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
# 		-out /etc/nginx/ssl/meudier.42.fr.crt \	
# 		-keyout /etc/nginx/ssl/meudier.42.fr.key \
# 		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=meudier.42.fr"

# RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
# 		-out /etc/ssl/meudier.42.fr.pem \
# 		-keyout /etc/ssl/meudier.42.fr.key \
# 		-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=meudier/CN=meudier.42.fr"

CMD	[ "nginx", "-g", "daemon off;" ]
