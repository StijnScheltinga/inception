#!/bin/bash

if [ ! -f /var/lib/mysql/inception_setup_finished ]; then

/usr/bin/mysqld_safe &

until /usr/bin/mysqladmin ping --silent; 
do
    echo "waiting on MariaDB startup"
    sleep 2
done

echo "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password ;" >> setup.sql
echo "SET PASSWORD = PASSWORD('$MARIADB_ROOT_PASSWORD');" >> setup.sql
echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE ;" >> setup.sql
echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD' ;" >> setup.sql
echo "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' ;" >> setup.sql
echo "FLUSH PRIVILEGES ;" >> setup.sql

mysql < setup.sql

/usr/bin/mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown
touch /var/lib/mysql/inception_setup_finished
fi

exec /usr/bin/mysqld_safe