#!/bin/bash

DOWNLOAD_PATH=/home/opt
APP_PATH=/home/www/system/go
APP_NAME=go1.17.3.linux-amd64

mkdir -p ${APP_PATH}
wget -P ${DOWNLOAD_PATH} https://studygolang.com/dl/golang/${APP_NAME}.tar.gz
cd ${DOWNLOAD_PATH} && tar -xzvf ${APP_NAME}.tar.gz
mv go/* ${APP_PATH}

