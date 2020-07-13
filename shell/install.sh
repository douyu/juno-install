#!/bin/bash

JUNO_VER="0.2.0"

opt_env=no
read -p "Install Env [y/n]: " opt_env

opt_mysql=no
read -p "Install MySQL [y/n]: " opt_mysql

opt_etcd=no
read -p "Install Etcd [y/n]: " opt_etcd

opt_prom=no
read -p "Install Prometheus [y/n]: " opt_prom

opt_go=no
read -p "Install Golang [y/n]: " opt_go

opt_graf_db=no
read -p "Install Grafana Database [y/n]: " opt_graf_db

opt_graf=no
read -p "Install Grafana [y/n]: " opt_graf

opt_juno_db=no
read -p "Install Juno Database [y/n]: " opt_juno_db

opt_juno_mock=no
read -p "Install Juno Mock [y/n]: " opt_juno_mock

opt_juno_admin=no
read -p "Install Juno Admin [y/n]: " opt_juno_admin


opt_juno_agent=no
read -p "Install Juno Agent [y/n]: " opt_juno_agent


opt_pprof=no
read -p "Install Pprof [y/n]: " opt_pprof


install=no
read -p "Start the installation [y/n]: " install

if [ "$install" != "y" ];then
  exit
fi

# import shell script

. init.sh
. install_dir.sh
. install_juno.sh
. install_juno_admin.sh
. install_juno_agent.sh

if [ "$opt_env" == "y" ];then
  Install_Env_Tools
  Install_Dir
  # todo check and move Install_Juno_Data to opt_juno_admin ?
  Install_Juno_Data
fi

if [ "$opt_mysql" == "y" ];then
  ./install_mysql.sh
  sleep 2
fi

if [ "$opt_go" == "y" ];then
  ./install_go.sh
fi

if [ "$opt_etcd" == "y" ];then
  ./install_etcd.sh
fi

if [ "$opt_prom" == "y" ];then
  ./install_prometheus.sh
fi

if [ "$opt_graf_db" == "y" ];then
  ./install_grafana_database.sh
fi

if [ "$opt_graf" == "y" ];then
  ./install_grafana.sh
fi

# juno admin must at head
if [ "$opt_juno_admin" == "y" ];then
  Install_Juno_Admin
fi

if [ "$opt_juno_db" == "y" ];then
  ./install_juno_database.sh
fi

if [ "$opt_juno_mock" == "y" ];then
  ./install_juno_mock.sh
fi

if [ "$opt_juno_agent" == "y" ];then
  Install_Juno_Agent
fi

if [ "$opt_pprof" == "y" ];then
  ./install_pprof.sh
fi
