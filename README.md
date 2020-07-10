# juno-install

这是一个快速构建启动一个juno完整环境的工程.

脚本将自动配置juno所需要依赖的服务组件
包括：
- golang
- mysql
- etcd
- prometheus
- grafana
- pprof
- juno-agent(prometheus etcd watch) 

## 下载脚本

```bash
git clone https://github.com/douyu/juno-install.git

cd juno-install/
```

## 启动juno

### 物理机运行

此方式将通过shell脚本方式进行交互安装juno以及所依赖组件

```bash
cd shell

sh ./install.sh
```

### docker 容器运行

此方式将通过在一个容器内启动juno 以及所依赖组件

```bash
docker build -t juno-install:v1  -f ./docker/all-in-one/Dockerfile ./

docker run -itd  --name juno-demo -p 50000:50000  --privileged=true juno-install:v1 /usr/sbin/init

docker exec -it juno-demo /bin/bash

```

### docker-compose 方式运行

此方式将juno以及所依赖组件分容器进行启动

todo

## 开启juno之旅

访问 http://127.0.0.1:50000

使用如下账号进行登录

```json
username: admin

password: admin
```

## 容器内debug
```
查看mysql
mysql -uroot
查看etcd里内容
etcdctl get "" --prefix
查看go
go version
查看pprof
go tool pprof -http=":8081" profile
```

## 相关组件

grafana http://127.0.0.1:5010/grafana

etcd

prometheus 
