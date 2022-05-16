# juno-install
欢迎来到Juno-Install的世界！

Juno 提供了对微服务进行管理的多项能力，包括应用监控、依赖分析、配置管理等。

Juno-install 帮助您更便捷和更容易的构建，安装和启动Juno。为了简化程序依赖的各类环境，我们强烈建议您使用docker进行安装。

Juno-install脚本将自动配置juno所需要依赖的服务组件
包括：
- golang
- mysql
- etcd
- prometheus
- grafana
- pprof
- juno-agent(prometheus etcd watch) 

## 准备工作
* 安装 [git](https://git-scm.com/)
* 安装 [docker](https://www.docker.com/products/docker-desktop/): 

## Clone项目
```bash
git clone https://github.com/douyu/juno-install.git
cd juno-install
```

## 安装&启动程序
```bash
docker-compose up
```
## 开启juno之旅
您可以通过浏览地址 <http://127.0.0.1:50002> 访问juno后台管理界面

juno-install容器暴露了以下端口：

| Port(端口) | Function(功能) |
|:---------|:------------:|
| 50002    |  juno-admin  |
| 3000     |   grafana    |
| 9090     |  prometheus  |
| 2379     |     etcd     |
| 3306     |    mysql     |