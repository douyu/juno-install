#!/usr/bin/env bash
mysql="/home/www/system/mysql/bin/mysql -uroot"
sql="CREATE DATABASE juno DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
$mysql -e "$sql"

cd /home/www/server/juno && ./bin/juno-admin --config=config/install.toml --install=true
