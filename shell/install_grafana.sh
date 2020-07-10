#!/usr/bin/env bash
wget -P /home/opt http://jupiter.douyu.com/download/grafana-7.0.5.linux-amd64.tar.gz
cd /home/opt && tar -xzvf grafana-7.0.5.linux-amd64.tar.gz
mv ./grafana-7.0.5/* /home/www/server/grafana

chown -R www:www /home/www/server/grafana/
cp /home/www/server/juno/config/juno-grafana.ini /home/www/system/grafana/


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
ExecStart=/home/www/server/grafana/bin/grafana-server  --config=/home/www/system/grafana/juno-grafana.ini --homepath=/home/www/server/grafana

LimitNOFILE = 65535
Restart=on-failure
RestartSec=3
RestartPreventExitStatus=1
PrivateTmp=false
END

systemctl enable juno-grafana.service
systemctl start juno-grafana.service

