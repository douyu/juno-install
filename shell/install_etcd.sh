#!/usr/bin/env bash
wget -P /home/opt http://jupiter.douyu.com/download/etcd-v3.4.9-linux-amd64.tar.gz
cd /home/opt && tar -xzvf etcd-v3.4.9-linux-amd64.tar.gz
mv etcd-v3.4.9-linux-amd64/* /home/www/system/etcd
chown -R www:www /home/www/system/etcd/

cat > /etc/systemd/system/juno-etcd.service <<END
[Unit]
Description=Etcd Server
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
User=www
Group=www
WorkingDirectory=/home/www/system/etcd
TimeoutSec=0
PermissionsStartOnly=true
ExecStart=/home/www/system/etcd/etcd  --data-dir /home/www/system/etcd/data  --name etcd1 --listen-client-urls http://0.0.0.0:2379 --advertise-client-urls http://0.0.0.0:2379 --listen-peer-urls http://0.0.0.0:2381


LimitNOFILE = 65535
Restart=on-failure
RestartSec=3
RestartPreventExitStatus=1
PrivateTmp=false
END

cat >> ~/.bashrc <<END
export ETCDCTL_API=3
export PATH=$PATH:/home/www/system/etcd
END

systemctl enable juno-etcd.service
systemctl start juno-etcd.service

