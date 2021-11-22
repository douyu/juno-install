#!/bin/bash

wget -P /home/opt https://dl.grafana.com/oss/release/grafana-7.0.5.linux-amd64.tar.gz
mkdir -p /home/www/server/grafana
cd /home/opt && tar -xzvf grafana-7.0.5.linux-amd64.tar.gz
mv ./grafana-7.0.5/* /home/www/server/grafana/

chown -R www:www /home/www/server/grafana/
cp /home/www/server/juno/config/juno-grafana.ini /home/www/server/grafana/


cat > /etc/systemd/system/juno-grafana.service <<END
[Unit]
Description=Grafana Server
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
User=www
Group=www
WorkingDirectory=/home/www/server/grafana
TimeoutSec=0
PermissionsStartOnly=true
ExecStart=/home/www/server/grafana/bin/grafana-server  --config=/home/www/server/grafana/juno-grafana.ini --homepath=/home/www/server/grafana

LimitNOFILE = 65535
Restart=on-failure
RestartSec=3
RestartPreventExitStatus=1
PrivateTmp=false
END

systemctl enable juno-grafana.service
systemctl start juno-grafana.service

