#!/usr/bin/env bash

if [ -z "$MYSQL_ROOT_PASSWORD" ];
then
    # Создаем БД
    mysql -u root -e "CREATE DATABASE ${DNMP_MYSQL_DATABASE} CHARACTER SET ${DNMP_MYSQL_CHARSET} COLLATE ${DNMP_MYSQL_CHARSET_COLLATE};";
    # Создаем пользователя и даем ему полные права для БД
    mysql -u root -e "CREATE USER IF NOT EXISTS '${DNMP_MYSQL_USER}'@'${DNMP_MYSQL_USER_HOST}' IDENTIFIED BY '${DNMP_MYSQL_PASSWORD}';";
    mysql -u root -e "GRANT ALL PRIVILEGES ON ${DNMP_MYSQL_DATABASE}.* TO '${DNMP_MYSQL_USER}'@'${DNMP_MYSQL_USER_HOST}';";
    mysql -u root -e "FLUSH PRIVILEGES;";
else
    # Создаем БД
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${DNMP_MYSQL_DATABASE} CHARACTER SET ${DNMP_MYSQL_CHARSET} COLLATE ${DNMP_MYSQL_CHARSET_COLLATE};";
    # Создаем пользователя и даем ему полные права для БД
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${DNMP_MYSQL_USER}'@'${DNMP_MYSQL_USER_HOST}' IDENTIFIED BY '${DNMP_MYSQL_PASSWORD}';";
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${DNMP_MYSQL_DATABASE}.* TO '${DNMP_MYSQL_USER}'@'${DNMP_MYSQL_USER_HOST}';";
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;";
fi
