#!/bin/bash
echo "Bash version ${BASH_VERSION}..."

# ./cli_docker_build.sh
# docker exec -it mvc-docker-php /bin/sh -c "[ -e /bin/bash ] && /bin/bash || /bin/sh"

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
DOCKER_MYSQL_REPLACE=${2:-'1'}
DOCKER_NGINX_PORT=${3:-9090}
DOCKER_PREFIX=${4:-'mvc-docker-'}
DOCKER_NETWORK=${5:-'php_dev_network'}

MYSQL_VERSION='5.7'
MYSQL_PASSWORD='1234567'
MYSQL_DATABASE='mvc'
MYSQL_USER='mvc'

# ===================================================================================================================================
if [ -n "${PHP_VERSION}" ]; then
    docker build \
    -f ./docker/Dockerfile-${PHP_VERSION} \
    -t ${DOCKER_PREFIX}php:${PHP_VERSION} \
    .
fi

# ===================================================================================================================================
docker stop ${DOCKER_PREFIX}mysql 
# Remove sudo - Thinking
# sudo chmod -R 777 ./mysql*
if [ "$DOCKER_MYSQL_REPLACE" == "1" ]; then
docker stop ${DOCKER_PREFIX}mysql 
docker rm ${DOCKER_PREFIX}mysql -v
sleep 6
rm -rf ./mysql/*
fi

docker run \
 --network=${DOCKER_NETWORK} \
 --name ${DOCKER_PREFIX}mysql -d \
-h ${DOCKER_PREFIX}mysql \
-v ./mysql:/var/lib/mysql/ \
-v ./render_table_file.sql:/apt/render_table_file.sql \
-v ./render_table_file_custom.sql:/apt/render_table_file_custom.sql \
-e MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD} \
-e MYSQL_DATABASE=${MYSQL_DATABASE} \
-e MYSQL_USER=${MYSQL_USER} \
-e MYSQL_PASSWORD=${MYSQL_PASSWORD} \
-e MYSQL_ALLOW_EMPTY_PASSWORD='no' \
-e MYSQL_HOST='0.0.0.0' \
-t mysql:${MYSQL_VERSION} \
--lower_case_table_names=1 --sql_mode='ON' --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

sleep 36
docker exec -i ${DOCKER_PREFIX}mysql mysql -uroot -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < render_table_file.sql
docker exec -i ${DOCKER_PREFIX}mysql mysql -uroot -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < render_table_file_custom.sql

# ===================================================================================================================================
docker stop ${DOCKER_PREFIX}php 
docker rm ${DOCKER_PREFIX}php 

docker run \
 --network=${DOCKER_NETWORK} \
 --name ${DOCKER_PREFIX}php -d \
-h ${DOCKER_PREFIX}php \
-v .:/var/www/html \
-w /var/www/html \
-t ${DOCKER_PREFIX}php:${PHP_VERSION} 
# ===================================================================================================================================
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