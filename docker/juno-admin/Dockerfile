FROM alpine:latest

ENV JUNO_VERSION=0.4.12

WORKDIR /root/juno/

RUN wget -P /root/juno https://github.com/douyu/juno/releases/download/v${JUNO_VERSION}/juno_${JUNO_VERSION}_linux_amd64.tar.gz && \
    cd /root/juno && tar xvf juno_${JUNO_VERSION}_linux_amd64.tar.gz && \
    mv /root/juno/juno-admin /usr/local/bin/ && \
    ls -al /root/juno/ && \
    ls -al /usr/local/bin/

RUN rm /root/juno/juno_${JUNO_VERSION}_linux_amd64.tar.gz
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN ls -al /usr/local/bin/juno-admin && /usr/local/bin/juno-admin --version

EXPOSE 50002 50004 50010

RUN echo -e "#!/bin/bash\n/usr/local/bin/juno-admin --config=/root/juno/config/install.toml --install=true" > /usr/local/bin/docker_juno_init.sh && \
    chmod +x /usr/local/bin/docker_juno_init.sh

RUN echo -e "#!/bin/bash\n/usr/local/bin/juno-admin --config=/root/juno/config/install.toml --mock=true" > /usr/local/bin/docker_juno_mock.sh && \
    chmod +x /usr/local/bin/docker_juno_mock.sh

CMD sh /usr/local/bin/docker_juno_init.sh

CMD sh /usr/local/bin/docker_juno_mock.sh

CMD ["/usr/local/bin/juno-admin", "--config=./config/single-region-admin.toml", "-host=0.0.0.0"]
# CMD ["/sbin/init"]

