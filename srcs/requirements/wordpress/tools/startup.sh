#!/bin/bash

cd /var/www/html

#downloading wp core when it is not done yet
if [ ! -f wp-config.php ]; then
	echo "downloading wordpress core files"
	wp core download --allow-root
	mv wp-config-sample.php wp-config.php

	sed -i -e "s/database_name_here/$MARIADB_DATABASE/" \
	-e "s/username_here/$MARIADB_USER/" \
	-e "s/password_here/$MARIADB_PASSWORD/" \
	-e "s/localhost/$MARIADB_CONNECTION/" wp-config.php
fi

php-fpm8.2 -F