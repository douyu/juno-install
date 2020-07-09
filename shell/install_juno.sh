#!/usr/bin/env bash
wget -P /home/opt http://jupiter.douyu.com/download/0.2.0/juno_data_0.2.0.tar.gz
cp /home/opt/juno_data_0.2.0.tar.gz /home/www/server/juno/
cd /home/www/server/juno && tar xvf juno_data_0.2.0.tar.gz
sed -i 's/root:root/root:/' /home/www/server/juno/config/single-region-admin.toml
sed -i 's/root:root/root:/' /home/www/server/juno/config/install.toml
sed -i 's/root:root/root:/' /home/www/server/juno/config/multiple-region-admin.toml
sed -i 's/root:root/root:/' /home/www/server/juno/config/grafana-default.ini

