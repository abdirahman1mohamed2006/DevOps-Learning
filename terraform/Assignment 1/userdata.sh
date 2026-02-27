#!/bin/bash
set -e

exec > >(tee /var/log/user-data.log) 2>&1

apt-get update -y

apt-get install -y apache2 mariadb-server unzip curl \
  php php-mysql libapache2-mod-php php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip

systemctl enable apache2
systemctl start apache2

systemctl enable mariadb
systemctl start mariadb

DB_NAME="wordpress"
DB_USER="wpuser"
DB_PASS="$(openssl rand -base64 16 | tr -d '=+/')"
ROOT_PASS="$(openssl rand -base64 16 | tr -d '=+/')"

mysql -u root <<MYSQL
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;

CREATE DATABASE ${DB_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
MYSQL

cd /tmp
curl -LO https://wordpress.org/latest.zip
unzip -o latest.zip

rm -rf /var/www/html/*
cp -r wordpress/* /var/www/html/

chown -R www-data:www-data /var/www/html
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/wp-config.php
sed -i "s/username_here/${DB_USER}/" /var/www/html/wp-config.php
sed -i "s/password_here/${DB_PASS}/" /var/www/html/wp-config.php

SALTS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
sed -i "/AUTH_KEY/d;/SECURE_AUTH_KEY/d;/LOGGED_IN_KEY/d;/NONCE_KEY/d;/AUTH_SALT/d;/SECURE_AUTH_SALT/d;/LOGGED_IN_SALT/d;/NONCE_SALT/d" /var/www/html/wp-config.php
printf "\n%s\n" "$SALTS" >> /var/www/html/wp-config.php

systemctl restart apache2

cat > /home/ubuntu/wordpress-creds.txt <<CREDS
WordPress DB Credentials:
DB Name: ${DB_NAME}
DB User: ${DB_USER}
DB Pass: ${DB_PASS}

MariaDB root password:
root: ${ROOT_PASS}
CREDS

chown ubuntu:ubuntu /home/ubuntu/wordpress-creds.txt
chmod 600 /home/ubuntu/wordpress-creds.txt
