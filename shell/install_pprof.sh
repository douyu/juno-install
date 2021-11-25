#!/bin/bash

DOWNLOAD_PATH=/home/opt
APP_PATH=/home/www/system/pprof
APP_NAME=pprof

mkdir -p ${APP_PATH}
mkdir -p ${APP_PATH}/graphviz
chown -R www:www ${APP_PATH}

wget -P ${DOWNLOAD_PATH}/${APP_NAME} --no-check-certificate https://www2.graphviz.org/Packages/stable/portable_source/graphviz-2.44.0.tar.gz
cd ${DOWNLOAD_PATH}/${APP_NAME} && tar zxvf graphviz-2.44.0.tar.gz
cd ${DOWNLOAD_PATH}/${APP_NAME}/graphviz-2.44.0 && ./configure --prefix=${APP_PATH}/graphviz
cd ${DOWNLOAD_PATH}/${APP_NAME}/graphviz-2.44.0 && make && make install
cp -R ${DOWNLOAD_PATH}/${APP_NAME}/FlameGraph ${APP_PATH}
chown -R www:www ${APP_PATH}
