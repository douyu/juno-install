#!/bin/bash

Install_Juno_Agent()
{
    APP_PATH=/home/www/server/juno-agent
    APP_PATH_BIN=${APP_PATH}/bin
    APP_NAME=juno-agent_${JUNO_AGENT_VER}_linux_amd64
    JUNO_AGENT_VER=0.2.2

    mkdir -p ${APP_PATH_BIN}
    wget - P ${DOWNLOAD_PATH} https://github.com/douyu/juno-agent/releases/download/v${JUNO_AGENT_VER}/juno-agent_${JUNO_AGENT_VER}_linux_amd64.tar.gz
    tar xvf ${DOWNLOAD_PATH}/${APP_NAME}.tar.gz -C ${APP_PATH}
    mv /home/www/server/juno-agent/${APP_NAME}/* ${APP_PATH_BIN}


    wget -P ${DOWNLOAD_PATH} https://github.com/douyu/juno-agent/archive/refs/tags/v${JUNO_AGENT_VER}.tar.gz
    tar xvf v${JUNO_AGENT_VER}.tar.gz -C ${APP_PATH}
    mv ${APP_PATH}/juno-agent-${JUNO_AGENT_VER}/config/ ${APP_PATH}/config/

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
Environment="ENV=dev"
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
}

