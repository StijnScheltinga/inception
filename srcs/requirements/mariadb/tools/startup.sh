#!/bin/bash

/usr/bin/mysqld_safe &

until /usr/bin/mysqladmin ping --silent; 
do
    echo "waiting on MariaDB startup"
    sleep 1
done

/usr/bin/mysqladmin shutdown

exec /usr/bin/mysqld_safe