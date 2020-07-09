#!/bin/bash


tmp=no
read -p "Install Env [y/n]: " tmp
if [ "$tmp" == "y" ];then
./install_dir.sh
./install_env.sh
./install_juno.sh
fi


tmp=no
read -p "Install MySQL [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_mysql.sh
  sleep 2
fi

tmp=no
read -p "Install Etcd [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_etcd.sh
fi

tmp=no
read -p "Install Prometheus [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_prometheus.sh
fi


tmp=no
read -p "Install Grafana Database [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_grafana_database.sh
fi


tmp=no
read -p "Install Grafana [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_grafana.sh
fi


tmp=no
read -p "Install Juno Database [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_juno_database.sh
fi


tmp=no
read -p "Install Juno Mock [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_juno_mock.sh
fi


tmp=no
read -p "Install Juno Admin [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_juno_admin.sh
fi

