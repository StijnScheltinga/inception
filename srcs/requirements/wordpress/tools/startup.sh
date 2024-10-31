#!/bin/bash

#downloading wp cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#downloading wp core
wp core download --allow-root

mv wp-config-sample.php wp-config.php

sed -i -e "s/database_name_here/$MARIADB_DATABASE/" \
	-e "s/username_here/$MARIADB_USER/" \
	-e "s/password_here/$MARIADB_PASSWORD/" \
	-e "s/localhost/mariadb:3306/" wp-config.php

sleep infinity