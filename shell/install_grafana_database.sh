#!/bin/bash

mysql="/home/www/system/mysql/bin/mysql -uroot"
sql="CREATE DATABASE grafana DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
$mysql -e "$sql"

