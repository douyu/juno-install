#!/usr/bin/env bash
wget -P /home/www/server http://jupiter.douyu.com/download/0.2.0/juno-admin_0.2.0_linux_amd64.tar.gz
cd /home/www/server && tar xvf juno-admin_0.2.0_linux_amd64.tar.gz
mv juno-admin_0.2.0_linux_amd64/* /home/www/server/juno/bin


cat > /etc/systemd/system/juno-admin.service <<END
[Unit]
Description=Juno Admin Server
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
User=www
Group=www
WorkingDirectory=/home/www/server/juno
TimeoutSec=0
PermissionsStartOnly=true
ExecStart=/home/www/server/juno/bin/juno-admin  --config=/home/www/server/juno/config/single-region-admin.toml

LimitNOFILE = 65535
Restart=on-failure
RestartSec=3
RestartPreventExitStatus=1
PrivateTmp=false
END

systemctl enable juno-admin.service
systemctl start juno-admin.service

