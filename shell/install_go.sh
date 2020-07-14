#!/usr/bin/env bash
DOWNLOAD_PATH=/home/opt
APP_PATH=/home/www/system/go
APP_NAME=go1.14.4.linux-amd64

mkdir -p ${APP_PATH}
wget -P ${DOWNLOAD_PATH} http://jupiter.douyu.com/download/${APP_NAME}.tar.gz
cd ${DOWNLOAD_PATH} && tar -xzvf ${APP_NAME}.tar.gz
mv ${APP_NAME}/* ${APP_PATH}

