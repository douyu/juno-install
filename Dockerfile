FROM centos
RUN yum -y install wget openssh-clients git vim net-tools

WORKDIR /root/juno-install/

ADD docker/src/.bashrc /root/

COPY shell/ /root/juno-install/shell

RUN sh /root/juno-install/shell/install.sh -y

CMD ["/sbin/my_init"]
