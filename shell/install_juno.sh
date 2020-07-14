#!/usr/bin/env bash

Install_Juno_Data()
{
    wget -P ${DOWNLOAD_PATH} http://jupiter.douyu.com/download/${JUNO_VER}/juno_data_${JUNO_VER}.tar.gz
    tar -xzvf ${DOWNLOAD_PATH}/juno_data_${JUNO_VER}.tar.gz -C /home/www/server/juno/
    sed -i 's/root:root/root:/' /home/www/server/juno/config/single-region-admin.toml
    sed -i 's/root:root/root:/' /home/www/server/juno/config/install.toml
    sed -i 's/root:root/root:/' /home/www/server/juno/config/multiple-region-admin.toml
    sed -i 's/root:root/root:/' /home/www/server/juno/config/juno-grafana.ini
}

