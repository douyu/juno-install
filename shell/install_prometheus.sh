#!/usr/bin/env bash
wget -P /home/opt http://jupiter.douyu.com/download/prometheus-2.19.2.linux-amd64.tar.gz
cd /home/opt && tar -xzvf prometheus-2.19.2.linux-amd64.tar.gz
mv ./prometheus-2.19.2.linux-amd64/* /home/www/system/prometheus

chown -R www:www /home/www/system/prometheus/

cat > /etc/systemd/system/juno-prometheus.service <<END
[Unit]
Description=Prometheus Server
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
User=www
Group=www
WorkingDirectory=/home/www/system/prometheus
Type=forking
TimeoutSec=0
PermissionsStartOnly=true
ExecStart=/home/www/system/prometheus/prometheus --config.file=/home/www/system/prometheus/prometheus.yml

LimitNOFILE = 65535
Restart=on-failure
RestartSec=3
RestartPreventExitStatus=1
PrivateTmp=false
END

systemctl enable juno-prometheus.service
systemctl start juno-prometheus.service

