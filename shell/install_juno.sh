#!/bin/bash

Install_Juno_Data()
{
    wget -P ${DOWNLOAD_PATH} https://github.com/douyu/juno/archive/refs/tags/v${JUNO_VER}.tar.gz
    tar -zxvf ${DOWNLOAD_PATH}/v${JUNO_VER}.tar.gz -C ${DOWNLOAD_PATH}
    mv ${DOWNLOAD_PATH}/juno-${JUNO_VER}/data /home/www/server/juno/
    cp -r ./../config/juno/ /home/www/server/juno/config/
    
    sed -i 's/root:root/root:/' /home/www/server/juno/config/single-region-admin.toml
    sed -i 's/root:root/root:/' /home/www/server/juno/config/install.toml
    sed -i 's/root:root/root:/' /home/www/server/juno/config/multiple-region-admin.toml
    sed -i 's/root:root/root:/' /home/www/server/juno/config/juno-grafana.ini
}

