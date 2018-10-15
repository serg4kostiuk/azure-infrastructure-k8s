#!/bin/bash

chown -R apache:apache /var/www/html/
find /var/www/html/ -type f -exec chmod 664 {} \;
find /var/www/html/ -type d -exec chmod 775 {} \;
