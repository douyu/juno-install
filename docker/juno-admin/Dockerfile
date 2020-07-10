FROM centos

RUN yum -y install wget openssh-clients git vim net-tools

WORKDIR /root/juno/

RUN wget -P /root/juno http://jupiter.douyu.com/download/0.2.0/juno_data_0.2.0.tar.gz && \
    cd /root/juno && tar xvf juno_data_0.2.0.tar.gz && \
    sed -i 's/root:root/root:/' /root/juno/config/single-region-admin.toml && \
    sed -i 's/root:root/root:/' /root/juno/config/install.toml && \
    sed -i 's/root:root/root:/' /root/juno/config/multiple-region-admin.toml&& \
    sed -i 's/root:root/root:/' /root/juno/config/grafana-default.ini

RUN wget -P /root/juno/ http://jupiter.douyu.com/download/0.2.0/juno-admin_0.2.0_linux_amd64.tar.gz && \
    cd /root/juno/ && tar xvf juno-admin_0.2.0_linux_amd64.tar.gz && \
    ls -l && \
    mv /root/juno/juno-admin_0.2.0_linux_amd64 /root/juno/bin

CMD ["/root/juno/bin/juno-admin", "--config=/root/juno/config/single-region-admin.toml"]

