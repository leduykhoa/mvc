#!/bin/bash
echo "Bash version ${BASH_VERSION}..."

# ./cli_docker_build.sh
# ./cli_docker_build.sh 5.6 1 9090
# ./cli_docker_build.sh 7.0 1 9090
# ./cli_docker_build.sh 5.6 1 9099 mvc-enterprise-
# ./cli_docker_build.sh 7.0 1 9099 mvc-enterprise-
# docker exec -it mvc-docker-php /bin/sh -c "[ -e /bin/bash ] && /bin/bash || /bin/sh"
# docker exec -it mvc-enterprise-php /bin/sh -c "[ -e /bin/bash ] && /bin/bash || /bin/sh"

# - PHP_VERSION=5.6
# - PHP_VERSION=7.0
# - PHP_VERSION=7.1
# - PHP_VERSION=7.2
# - PHP_VERSION=7.3
# - PHP_VERSION=7.4
# - PHP_VERSION=8.0
# - PHP_VERSION=8.1
# - PHP_VERSION=8.2
# - PHP_VERSION=8.3
PHP_VERSION=${1:-'8.3'}
DOCKER_MYSQL_REPLACE=${2:-'0'}
DOCKER_NGINX_PORT=${3:-9090}
DOCKER_PREFIX=${4:-'mvc-docker-'}
DOCKER_NETWORK=${5:-'php_dev_network'}

MYSQL_VERSION='5.7'
MYSQL_VERSION='8.0'
MYSQL_PASSWORD='1234567'
MYSQL_DATABASE='mvc'
MYSQL_USER='mvc'

pathRoot=$(pwd)
# ===================================================================================================================================
mkdir -p $pathRoot/storage/core/cache
mkdir -p $pathRoot/storage/core/session
mkdir -p $pathRoot/storage/log

cp -rf $pathRoot/docker/nginx_default.conf $pathRoot/docker/nginx.conf
sed -ri "s|__DOCKER_PREFIX__|${DOCKER_PREFIX}php|g" $pathRoot/docker/nginx.conf
cp -rf $pathRoot/.env.default $pathRoot/.env
sed -ri "s|__DOCKER_NGINX_PORT__|${DOCKER_NGINX_PORT}|g" $pathRoot/.env
sed -ri "s|__DOCKER_PREFIX__|${DOCKER_PREFIX}mysql|g" $pathRoot/.env
# ===================================================================================================================================
if [ -n "${PHP_VERSION}" ]; then
    docker build --force-rm --no-cache \
        -f ./docker/Dockerfile-${PHP_VERSION} \
        -t ${DOCKER_PREFIX}php:${PHP_VERSION} \
        .
fi

# ===================================================================================================================================
# if [ ! "$(docker ps -a -q -f name=${DOCKER_PREFIX}mysql )" ]; then
#     # if [ "$(docker ps -aq -f status=exited -f name=${DOCKER_PREFIX}mysql)" ]; then
#     # fi
# fi
docker stop ${DOCKER_PREFIX}mysql
# Remove sudo - Thinking
# sudo chmod -R 777 ./mysql*
if [ "$DOCKER_MYSQL_REPLACE" == "1" ]; then
    docker exec -i ${DOCKER_PREFIX}mysql chmod -R 777 /var/lib/mysql*
    sleep 2
    docker rm ${DOCKER_PREFIX}mysql -v
    sleep 6
    rm -rf ./mysql/*
    docker run \
        --network=${DOCKER_NETWORK} \
        --name ${DOCKER_PREFIX}mysql -d \
        -h ${DOCKER_PREFIX}mysql \
        -v ./mysql:/var/lib/mysql/ \
        -e MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD} \
        -e MYSQL_DATABASE=${MYSQL_DATABASE} \
        -e MYSQL_USER=${MYSQL_USER} \
        -e MYSQL_PASSWORD=${MYSQL_PASSWORD} \
        -e MYSQL_ALLOW_EMPTY_PASSWORD='no' \
        -e MYSQL_HOST='0.0.0.0' \
        -t mysql:${MYSQL_VERSION} \
        --lower_case_table_names=1 --sql_mode='ON' --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --default-authentication-plugin=mysql_native_password
        
    sleep 26
    docker exec -i ${DOCKER_PREFIX}mysql chmod -R 777 /var/lib/mysql*
    # -v ./database_structure.sql:/apt/database_structure.sql \
    # -v ./database_structure_custom.sql:/apt/database_structure_custom.sql \
    # docker exec -i ${DOCKER_PREFIX}mysql mysql -uroot -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} <database_structure.sql
    # docker exec -i ${DOCKER_PREFIX}mysql mysql -uroot -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} <database_structure_custom.sql
fi
docker start ${DOCKER_PREFIX}mysql

sleep 2
docker exec -i ${DOCKER_PREFIX}mysql chmod -R 777 /var/lib/mysql*
sleep 2

# # ===================================================================================================================================
# # docker stop ${DOCKER_PREFIX}php
# if [ ! "$(docker ps -a -q -f name=${DOCKER_PREFIX}php )" ]; then
#     # if [ "$(docker ps -aq -f status=exited -f name=${DOCKER_PREFIX}php)" ]; then
#     # fi
# fi

docker stop ${DOCKER_PREFIX}php
docker rm ${DOCKER_PREFIX}php

docker run \
    --network=${DOCKER_NETWORK} \
    --name ${DOCKER_PREFIX}php -d \
    -h ${DOCKER_PREFIX}php \
    -v .:/var/www/html \
    -w /var/www/html \
    -t ${DOCKER_PREFIX}php:${PHP_VERSION}
if [ "$DOCKER_MYSQL_REPLACE" == "1" ]; then
    sleep 6
    if [ ! -d ./node_modules ]; then
        docker exec -i ${DOCKER_PREFIX}php npm i
    fi
    # docker exec -i ${DOCKER_PREFIX}php npm run news
fi
# ===================================================================================================================================
# docker stop ${DOCKER_PREFIX}nginx
# if [ ! "$(docker ps -a -q -f name=${DOCKER_PREFIX}nginx )" ]; then
#     # if [ "$(docker ps -aq -f status=exited -f name=${DOCKER_PREFIX}nginx)" ]; then
#     # fi
# fi

docker stop ${DOCKER_PREFIX}nginx
docker rm ${DOCKER_PREFIX}nginx

docker run \
    --network=${DOCKER_NETWORK} \
    --name ${DOCKER_PREFIX}nginx -d \
    -h ${DOCKER_PREFIX}nginx \
    -v .:/var/www/html \
    -v ./docker/nginx.conf:/etc/nginx/conf.d/default.conf \
    -p ${DOCKER_NGINX_PORT}:80 \
    -t nginx
