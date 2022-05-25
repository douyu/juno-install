ARG base_image=alpine:latest

# -------
# Builder
# -------

FROM debian:stretch-slim AS builder

ARG version=2.0.11

WORKDIR /usr/local
RUN mkdir -p /var/lib/etcd
RUN apt-get update -y && apt-get install -y wget
RUN wget https://github.com/coreos/etcd/releases/download/v$version/etcd-v$version-linux-amd64.tar.gz
RUN tar -zxvf etcd-v$version-linux-amd64.tar.gz
RUN mv etcd-v$version-linux-amd64/etcd /usr/local/bin/
RUN mv etcd-v$version-linux-amd64/etcdctl /usr/local/bin/
RUN rm -rf etcd-v$version-linux-amd64

# ---------------
# Final Container
# ---------------

FROM "$base_image"

WORKDIR /usr/local
RUN mkdir -p /var/lib/etcd
COPY --from=builder /usr/local/bin/etcd /usr/local/bin
COPY --from=builder /usr/local/bin/etcdctl /usr/local/bin

EXPOSE 2379

CMD ["etcd", "--data-dir=/var/lib/etcd"]