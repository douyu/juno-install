FROM centos

ENV JUNO_VERSION=0.2.0

RUN yum -y install wget openssh-clients git vim net-tools

WORKDIR /root/juno/

RUN wget -P /root/juno http://jupiter.douyu.com/download/${JUNO_VERSION}/juno_data_${JUNO_VERSION}.tar.gz && \
    cd /root/juno && tar xvf juno_data_${JUNO_VERSION}.tar.gz && \
    sed -i 's/root:root/root:/' /root/juno/config/single-region-admin.toml && \
    sed -i 's/root:root/root:/' /root/juno/config/install.toml && \
    sed -i 's/root:root/root:/' /root/juno/config/multiple-region-admin.toml

RUN wget -P /root/juno/ http://jupiter.douyu.com/download/${JUNO_VERSION}/juno-admin_${JUNO_VERSION}_linux_amd64.tar.gz && \
    cd /root/juno/ && tar xvf juno-admin_${JUNO_VERSION}_linux_amd64.tar.gz && \
    mv /root/juno/juno-admin_${JUNO_VERSION}_linux_amd64/* /usr/local/bin/

RUN /usr/local/bin/juno-admin --version
RUN cat /root/juno/config/single-region-admin.toml
EXPOSE 50002 50004 50010


CMD ["/usr/local/bin/juno-admin", "--config=./single-region-admin.toml"]
# CMD ["/sbin/init"]

