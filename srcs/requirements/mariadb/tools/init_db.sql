CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'meudier'@'%' IDENTIFIED BY 'pwd';
GRANT ALL PRIVILEGES ON wordpress.* TO 'meudier'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root_pwd';
