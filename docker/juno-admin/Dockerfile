FROM centos:7.2.1511

ENV JUNO_VERSION=0.2.0

RUN yum -y install wget openssh-clients git vim net-tools

WORKDIR /root/juno/

RUN wget -P /root/juno http://jupiter.douyu.com/download/${JUNO_VERSION}/juno_data_${JUNO_VERSION}.tar.gz && \
    cd /root/juno && tar xvf juno_data_${JUNO_VERSION}.tar.gz

RUN wget -P /root/juno/ http://jupiter.douyu.com/download/${JUNO_VERSION}/juno-admin_${JUNO_VERSION}_linux_amd64.tar.gz && \
    cd /root/juno/ && tar xvf juno-admin_${JUNO_VERSION}_linux_amd64.tar.gz && \
    mv /root/juno/juno-admin_${JUNO_VERSION}_linux_amd64/* /usr/local/bin/

RUN /usr/local/bin/juno-admin --version

EXPOSE 50002 50004 50010

RUN echo -e "#!/bin/bash\n/usr/local/bin/juno-admin --config=/root/juno/config/install.toml --install=true" > /usr/local/bin/docker_juno_init.sh && \
    chmod +x /usr/local/bin/docker_juno_init.sh

RUN echo -e "#!/bin/bash\n/usr/local/bin/juno-admin --config=/root/juno/config/install.toml --mock=true" > /usr/local/bin/docker_juno_mock.sh && \
    chmod +x /usr/local/bin/docker_juno_mock.sh

# CMD ["/usr/local/bin/juno-admin", "--config=./config/single-region-admin.toml"]
CMD ["/sbin/init"]

