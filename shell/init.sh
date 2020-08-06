#!/bin/bash


# get os env info
if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
    DISTRO='CentOS'
    PM='yum'
elif grep -Eqi "Red Hat Enterprise Linux" /etc/issue || grep -Eq "Red Hat Enterprise Linux" /etc/*-release; then
    DISTRO='RHEL'
    PM='yum'
elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
    DISTRO='Aliyun'
    PM='yum'
elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
    DISTRO='Fedora'
    PM='yum'
elif grep -Eqi "Amazon Linux" /etc/issue || grep -Eq "Amazon Linux" /etc/*-release; then
    DISTRO='Amazon'
    PM='yum'
elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
    DISTRO='Debian'
    PM='apt'
elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
    DISTRO='Ubuntu'
    PM='apt'
elif grep -Eqi "Deepin" /etc/issue || grep -Eq "Deepin" /etc/*-release; then
    DISTRO='Deepin'
    PM='apt'
elif grep -Eqi "Mint" /etc/issue || grep -Eq "Mint" /etc/*-release; then
    DISTRO='Mint'
    PM='apt'
elif grep -Eqi "Kali" /etc/issue || grep -Eq "Kali" /etc/*-release; then
    DISTRO='Kali'
    PM='apt'
else
    DISTRO='unknow'
fi

# clean pm
if [ "$PM" = "yum" ]; then
    dnf clean packages
elif [ "$PM" = "apt" ]; then
    apt-get update
fi

# install a pkg use this method for yum/apt
Install_Pkg()
{
    packages=$@
    if [ "$PM" = "yum" ]; then
        yum install -y ${packages}
    elif [ "$PM" = "apt" ]; then
        apt-get install -y ${packages}
    fi
}

Install_Env_Tools()
{
    Install_Pkg libncurses*
    Install_Pkg libaio
    Install_Pkg libaio-*
    Install_Pkg libncurses.so.5
}
