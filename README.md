# juno-install
## 下载脚本
```bash
wget https://github.com/douyu/juno-install.git
```

## 执行脚本
如果在物理机执行
```bash
cd shell
./install.sh
访问http://127.0.0.1:50000

```

## docker中测试脚本
```bash
cd test_docker
docker build -t juno-docker:v1
docker run -itd  -p 5010:50000  --privileged=true juno-install:v1 /usr/sbin/init
docker exec -it {docker-id} /bin/bash; exit

wget https://github.com/douyu/juno-install.git
cd shell
./install.sh
访问http://127.0.0.1:50000
```
