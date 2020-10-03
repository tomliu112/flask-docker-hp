本项目参考https://github.com/umermansoor/microservices项目，同时集成了gunicorn框架
具体配置参见gun.py

日志输出配置在log.conf

flask + gunicorn 搭建高性能服务框架

集成docker容器化

运行docker使用如下命令 将日志输出到外部文件夹/yourpath/logs中

docker run  -p 5001:15000 -v  /yourpath/logs:/microservice/logs yourcontainer