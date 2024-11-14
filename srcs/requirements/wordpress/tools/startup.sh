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

	wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PW --allow-root
fi

mkdir -p /run/php
php-fpm7.4 -F