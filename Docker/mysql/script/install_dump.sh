#!/usr/bin/env bash
# Накатываем имеющиеся dump-ы
for file in `find /root/dump/ -type f -name "*.sql.gz"`
do
    gunzip < ${file} | mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} --default-character-set=${DNMP_MYSQL_CHARSET} ${MYSQL_DATABASE}
done
for file in `find /root/dump/ -type f -name "*.sql"`
do
    mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} --default-character-set=${DNMP_MYSQL_CHARSET} ${MYSQL_DATABASE} < ${file};
done;
