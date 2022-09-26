FROM debian:buster

RUN	apt-get update && apt-get -y install mariadb-server mariadb-client \
	&& rm -rf /var/lib/apt/lists/* \
	# purge and re-create /var/lib/mysql with appropriate ownership
	&& mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
	&& chmod 777 /var/run/mysqld

# COPY  ./conf/mariadb.conf /etc/mysql/my.cnf;
# COPY  ./conf/mariadb.conf /etc/my.cnf;
# COPY  ./conf/mariadb.conf ~/my.cnf;

EXPOSE 3306

COPY	./tools/create_database.sh /usr/local/bin/
RUN		chmod +x /usr/local/bin/create_database.sh
RUN 	mkdir /usr/local/bin/wordpress.sql 

ENTRYPOINT ["create_database.sh"]

#Command to launch mariadb and enable the database to listen globally
CMD ["mysqld", "--bind-address=0.0.0.0"]
