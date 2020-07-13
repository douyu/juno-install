#!/usr/bin/env bash

Install_Dir()
{
    # ifubuntu=$(cat /proc/version | grep ubuntu)
    # if [ "$ifubuntu" != "" ];then
    userdel www
    groupadd www
    if [ "$pm" != "yum" ];then
    useradd -g www -M -d /home/www -s /usr/sbin/nologin www &> /dev/null
    else
    useradd -g www -M -d /home/www -s /sbin/nologin www &> /dev/null
    fi

    mkdir -p /home
    mkdir -p /home/www/system
    mkdir -p /home/www/system/mysql
    mkdir -p /home/www/system/prometheus
    mkdir -p /home/www/system/etcd
    mkdir -p /home/www/server
    mkdir -p /home/www/server/grafana
    mkdir -p /home/www/server/juno
    mkdir -p /home/www/server/juno/bin
    mkdir -p /home/www/log
    mkdir -p /home/www/log/mysql
    mkdir -p /home/www/log/prometheus
    mkdir -p /home/www/log/etcd
    mkdir -p /home/www/log/grafana
    mkdir -p /home/www/log/juno
    mkdir -p /home/www/log/nginx
    mkdir -p /home/www/log/nginx/access
    chown -R www:www /home/www/log
}



