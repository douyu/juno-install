# juno-install

这是一个快速构建启动一个juno完整环境的工程.

脚本将自动配置juno所需要依赖的服务组件
包括：

- mysql
- etcd
- grafana
- prometheus

## 下载脚本

```bash
git clone https://github.com/douyu/juno-install.git

cd juno-install/
```

## 启动juno

### 物理机运行

```bash
cd shell

sh ./install.sh
```

### docker 容器运行

```bash
docker build -t juno-demo:v1 ./

docker run -itd  -name juno-demo -p 50000:50000  --privileged=true juno-install:v1 /usr/sbin/init

docker exec -it juno-demo /bin/bash

```

## 开启juno之旅

访问 http://127.0.0.1:50000

使用如下账号进行登录

```json
username: admin

password: admin
```

## 相关组件

grafana http://127.0.0.1:5010/grafana

etcd

prometheus 
