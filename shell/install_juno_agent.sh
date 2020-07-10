#!/usr/bin/env bash
DOWNLOAD_PATH=/home/opt
APP_PATH=/home/www/server/juno-agent
APP_PATH_BIN=${APP_PATH}/bin
APP_NAME=juno-agent_0.2.0_linux_amd64

mkdir -p ${APP_PATH_BIN}
wget -P ${DOWNLOAD_PATH} http://jupiter.douyu.com/download/0.2.0/${APP_NAME}.tar.gz
cd ${DOWNLOAD_PATH} && tar xvf ${APP_NAME}.tar.gz
mv ${APP_NAME}/* ${APP_PATH_BIN}

wget -P ${DOWNLOAD_PATH} http://jupiter.douyu.com/download/0.2.0/juno-agent_data_0.2.0.tar.gz
cp ${DOWNLOAD_PATH}/juno-agent_data_0.2.0.tar.gz ${APP_PATH}
cd ${APP_PATH} && tar xvf juno-agent_data_0.2.0.tar.gz

chown -R www:www ${APP_PATH}

cat > /etc/systemd/system/juno-agent.service <<END
[Unit]
Description=Juno Agent
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
User=www
Group=www
WorkingDirectory=/home/www/server/juno
Environment="REGION_CODE=wuhan_region"
Environment="REGION_NAME=在Agent环境变量修改该参数"
Environment="ZONE_NAME=光谷"
Environment="ZONE_CODE=guanggu"
Environment="ENV=env"
TimeoutSec=0
PermissionsStartOnly=true
ExecStart=/home/www/server/juno-agent/bin/juno-agent  --config=/home/www/server/juno-agent/config/config.toml

LimitNOFILE = 65535
Restart=on-failure
RestartSec=3
RestartPreventExitStatus=1
PrivateTmp=false
END

systemctl enable juno-agent.service
systemctl start juno-agent.service
