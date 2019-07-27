#!/usr/bin/env bash
# Запускает контейнер для сборки статики с переданной коммандой
# Например например надо выполнить 'npm install' тогда выполняем ./static.sh npm install
docker-compose run --rm -u root static $*