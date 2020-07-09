FROM centos
RUN yum -y install wget
RUN yum -y install openssh-clients
RUN yum -y install git
RUN yum -y install vim
RUN yum -y install net-tools

WORKDIR /
ADD src/.bashrc /root/

CMD ["/sbin/my_init"]
