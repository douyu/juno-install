#!/usr/bin/env bash
DOWNLOAD_PATH=/home/opt
APP_PATH=/home/www/system/pprof
APP_NAME=pprof

mkdir -p ${APP_PATH}
mkdir -p ${APP_PATH}/graphviz
chown -R www:www ${APP_PATH}
wget -P ${DOWNLOAD_PATH} http://jupiter.douyu.com/download/${APP_NAME}.tar.gz
cd ${DOWNLOAD_PATH} && tar -xzvf ${APP_NAME}.tar.gz
cd ${DOWNLOAD_PATH}/${APP_NAME} && tar zxvf graphviz-2.44.0.tar.gz
cd ${DOWNLOAD_PATH}/${APP_NAME}/graphviz-2.44.0 && ./configure --prefix=${APP_PATH}/graphviz
cd ${DOWNLOAD_PATH}/${APP_NAME}/graphviz-2.44.0 && make && make install
cp -R ${DOWNLOAD_PATH}/${APP_NAME}/FlameGraph ${APP_PATH}
mv ${DOWNLOAD_PATH}/${APP_NAME}/checkGo.sh ${APP_PATH}
mv ${DOWNLOAD_PATH}/${APP_NAME}/checkGraphviz.sh ${APP_PATH}
mv ${DOWNLOAD_PATH}/${APP_NAME}/pprof.sh ${APP_PATH}
chown -R www:www ${APP_PATH}

cat >> ~/.bashrc <<END
export PATH=$PATH:/home/www/system/pprof/graphviz/bin
export PATH=$PATH:/home/www/system/pprof/FlameGraph
END

source ~/.bashrc
