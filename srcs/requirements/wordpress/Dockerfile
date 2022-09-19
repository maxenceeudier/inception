FROM	debian:buster

RUN	apt-get update && apt-get upgrade \
	&& apt-get install php libapache2-mod-php php-mysql

ADD 	. ./tool

WORKDIR	./tool

RUN	npm install

EXPOSE	4242

VOLUME	./tool/logs

CMD	npm run start
