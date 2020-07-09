#!/usr/bin/env bash
dnf clean packages
yum -y install libncurses*
yum -y install libaio
yum -y install libaio-*
yum -y install  libncurses.so.5
