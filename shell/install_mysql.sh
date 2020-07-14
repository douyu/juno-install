#!/usr/bin/env bash
wget -P /home/opt http://zy-res.oss-cn-hangzhou.aliyuncs.com/mysql/mysql-5.7.17-linux-glibc2.5-x86_64.tar.gz
cd /home/opt && tar -xzvf mysql-5.7.17-linux-glibc2.5-x86_64.tar.gz
mv mysql-5.7.17-linux-glibc2.5-x86_64/* /home/www/system/mysql/

groupadd mysql
useradd -g mysql -s /sbin/nologin mysql
/home/www/system/mysql/bin/mysqld --initialize-insecure --user=mysql --basedir=/home/www/system/mysql --datadir=/home/www/system/mysql/data >> tmp.log
chown -R mysql:mysql /home/www/system/mysql/
chown -R mysql:mysql /home/www/system/mysql/data/
chown -R mysql:mysql /home/www/log/mysql

cat > /etc/systemd/system/juno-mysql.service <<END
[Unit]
Description=MySQL Server
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
User=mysql
Group=mysql
WorkingDirectory=/home/www/system/mysql
TimeoutSec=0
PermissionsStartOnly=true
ExecStart=/home/www/system/mysql/bin/mysqld --defaults-file=/etc/my.cnf --basedir=/home/www/system/mysql --datadir=/home/www/system/mysql/data --plugin-dir=/home/www/system/mysql/lib/plugin --user=mysql  --log-error=/home/www/system/mysql/data/mysqld.log --pid-file=/home/www/system/mysql/data/mysql.pid --socket=/home/www/system/mysql/data/mysql.sock --open-files-limit=60000
LimitNOFILE = 65535
Restart=on-failure
RestartSec=3
RestartPreventExitStatus=1
PrivateTmp=false
END


cat > /etc/my.cnf <<END
[client]
port            = 3306
socket          = /home/www/system/mysql/data/mysql.sock
[mysqld]
port            = 3306
datadir         = /home/www/system/mysql/data
socket          = /home/www/system/mysql/data/mysql.sock
sql_mode=STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION

skip-external-locking
log-error=/home/www/log/mysql/error.log
key_buffer_size = 16M
max_allowed_packet = 1M
table_open_cache = 64
sort_buffer_size = 512K
net_buffer_length = 8K
read_buffer_size = 256K
read_rnd_buffer_size = 512K
myisam_sort_buffer_size = 8M

log-bin=mysql-bin
binlog_format=mixed
server-id       = 1

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0
# Settings user and group are ignored when systemd is used.
# If you need to run mysqld under a different user or group,
# customize your systemd unit file for mariadb according to the
# instructions in http://fedoraproject.org/wiki/Systemd
bind-address=0.0.0.0  #全部地址或者指定的ip地址
# skip-grant-tables
[mysql]
socket          = /home/www/system/mysql/data/mysql.sock

[mysqld_safe]
log-error=/var/log/mariadb/mariadb.log
pid-file=/var/run/mariadb/mariadb.pid
END

systemctl enable juno-mysql.service
systemctl start juno-mysql.service

