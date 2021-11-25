#!/bin/bash

Install_Juno_Admin()
{
    wget -P ${DOWNLOAD_PATH} https://github.com/douyu/juno/releases/download/v${JUNO_VER}/juno_${JUNO_VER}_linux_amd64.tar.gz
    tar -xzvf ${DOWNLOAD_PATH}/juno_${JUNO_VER}_linux_amd64.tar.gz -C /home/www/server/juno/
    mv /home/www/server/juno/juno-admin /home/www/server/juno/bin/
    mv /home/www/server/juno/juno-proxy /home/www/server/juno/bin/
    cat > /etc/systemd/system/juno-admin.service <<END
[Unit]
Description=Juno Admin Server
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
User=root
Group=root
Environment="PATH=$PATH:/home/www/system/go/bin:/home/www/system/pprof/graphviz/bin:/home/www/system/pprof/FlameGraph"
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
}

