FROM centos:7.2.1511
RUN yum -y install wget openssh-clients git vim net-tools gcc automake autoconf libtool make gcc-c++

WORKDIR /root/juno-install/shell

ADD docker/src/.bashrc /root/

COPY shell/ /root/juno-install/shell

RUN sh /root/juno-install/shell/install.sh -y

CMD ["/sbin/my_init"]
