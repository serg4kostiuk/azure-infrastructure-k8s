FROM centos:centos7

WORKDIR /dockertest

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
RUN yum -y update && yum -y install wget nano httpd php-mysql php-client php php-gd php-cli php-soap php-fileinfo && rm -rf /var/lib/apt/lists/*


ADD http://wordpress.org/latest.tar.gz /var/www/
RUN cd /var/www/ && tar xzvf latest.tar.gz
RUN cd /var/www/wordpress/ && sed -i "s|define('DB_NAME', 'database_name_here');|define('DB_NAME', 'wordp');|g" /var/www/wordpress/wp-config-sample.php
RUN cd /var/www/wordpress/ &&  sed -i "s|define('DB_USER', 'username_here');|define('DB_USER', 'wordp');|g" /var/www/wordpress/wp-config-sample.php
RUN cd /var/www/wordpress/ &&  sed -i "s|define('DB_PASSWORD', 'password_here');|define('DB_PASSWORD', 'pm112358gtxR');|g" /var/www/wordpress/wp-config-sample.php
RUN mv /var/www/wordpress/ /var/www/html/
RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
COPY permissions.sh /var/www/permissions.sh
RUN cd /var/www/ && chmod +x permissions.sh && ./permissions.sh

EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND", "-e", "info"]
