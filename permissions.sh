#!/bin/bash
sed -i "s|define('DB_NAME', 'database_name_here');|define('DB_NAME', 'wordp');|g" /var/www/html/wp-config.php
cd /var/www/wordpress/ &&  sed -i "s|define('DB_USER', 'username_here');|define('DB_USER', 'wordp@pmword');|g" /var/www/html/wp-config.php
cd /var/www/wordpress/ &&  sed -i "s|define('DB_PASSWORD', 'password_here');|define('DB_PASSWORD', 'pm112358gtxr');|g" /var/www/html/wp-config.php
cd /var/www/wordpress/ &&  sed -i "s|define('DB_HOST', 'localhost');|define('DB_PASSWORD', 'pmword.mysql.database.azure.com');|g" /var/www/html/wp-config.php
chown -R apache:apache /var/www/html/
find /var/www/html/ -type f -exec chmod 664 {} \;
find /var/www/html/ -type d -exec chmod 775 {} \;
