#!/bin/sh

mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql

#launch mariadb server
/etc/init.d/mysql start

#Check if the database exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else

# Set root option so that connexion without root password is not possible
mysql_secure_installation << EOF

Y
wordpress
wordpress
Y
n
Y
Y
EOF

#Add a root user on 127.0.0.1 to allow remote connexion
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user for 'wordpress'
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
FLUSH PRIVILEGES;" | mysql -uroot

mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql
fi

#end of server because relaunch in dokerfile
/etc/init.d/mysql stop

exec "$@"