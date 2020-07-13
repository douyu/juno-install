#!/usr/bin/env bash

Install_Juno_Data()
{
    wget -P /home/opt http://jupiter.douyu.com/download/${JUNO_VER}/juno_data_${JUNO_VER}.tar.gz
    cp /home/opt/juno_data_${JUNO_VER}.tar.gz /home/www/server/juno/
    cd /home/www/server/juno && tar xvf juno_data_${JUNO_VER}.tar.gz
    sed -i 's/root:root/root:/' /home/www/server/juno/config/single-region-admin.toml
    sed -i 's/root:root/root:/' /home/www/server/juno/config/install.toml
    sed -i 's/root:root/root:/' /home/www/server/juno/config/multiple-region-admin.toml
    sed -i 's/root:root/root:/' /home/www/server/juno/config/juno-grafana.ini
}

