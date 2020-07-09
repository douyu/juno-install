#!/bin/bash


tmp=no
read -p "Install Env [y/n]: " tmp
if [ "$tmp" == "y" ];then
./install_dir.sh
./install_env.sh
./install_juno.sh
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
read -p "Install MySQL [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_mysql.sh
  ./install_database.sh
fi

tmp=no
read -p "Install Grafana [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_grafana.sh
fi

tmp=no
read -p "Install Pprof [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_pprof.sh
fi

tmp=no
read -p "Install Juno Admin [y/n]: " tmp
if [ "$tmp" == "y" ];then
  ./install_juno_admin.sh
fi

