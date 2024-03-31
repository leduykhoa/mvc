#!/bin/bash
echo "Bash version ${BASH_VERSION}..."

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
DOCKER_PREFIX=${2:-'mvc-docker-'}
DOCKER_NETWORK=${3:-'php_dev_network'}

# ===================================================================================================================================
if [ -n "${PHP_VERSION}" ]; then
    docker build \
    -f ./docker/Dockerfile-${PHP_VERSION} \
    -t ${DOCKER_PREFIX}php:${PHP_VERSION} \
    .
fi

# ===================================================================================================================================
docker stop ${DOCKER_PREFIX}php 
docker rm ${DOCKER_PREFIX}php 

docker run \
 --network=${DOCKER_NETWORK} \
 --name ${DOCKER_PREFIX}php -d \
-h ${DOCKER_PREFIX}php \
-v .:/var/www/html \
-w /var/www/html/public \
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
-p 8098:80 \
-t nginx