FROM alpine:latest

ENV JUNO_VERSION=0.4.12

WORKDIR /root/juno/

RUN wget -P /root/juno https://github.com/douyu/juno/releases/download/v${JUNO_VERSION}/juno_${JUNO_VERSION}_linux_amd64.tar.gz && \
    cd /root/juno && tar xvf juno_${JUNO_VERSION}_linux_amd64.tar.gz && \
    mv /root/juno/juno-admin /usr/local/bin/

RUN wget -P /root/juno https://github.com/douyu/juno/archive/refs/tags/v${JUNO_VERSION}.tar.gz && \
    cd /root/juno && tar xvf v${JUNO_VERSION}.tar.gz && \
    mv /root/juno/juno-${JUNO_VERSION}/data /root/juno/

RUN /usr/local/bin/juno-admin --version

EXPOSE 50002 50004 50010

RUN echo -e "#!/bin/bash\n/usr/local/bin/juno-admin --config=/root/juno/config/install.toml --install=true" > /usr/local/bin/docker_juno_init.sh && \
    chmod +x /usr/local/bin/docker_juno_init.sh

RUN echo -e "#!/bin/bash\n/usr/local/bin/juno-admin --config=/root/juno/config/install.toml --mock=true" > /usr/local/bin/docker_juno_mock.sh && \
    chmod +x /usr/local/bin/docker_juno_mock.sh

CMD ["/usr/local/bin/juno-admin", "--config=./config/single-region-admin.toml", "-host=0.0.0.0"]
# CMD ["/sbin/init"]

