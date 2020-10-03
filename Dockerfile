FROM python:3.8-slim-buster
MAINTAINER      tomliu "fisher@sudops.com"
WORKDIR /microservice
COPY . .
run pip install Flask
run pip install requests
run pip install gevent
run pip install gunicorn


CMD exec gunicorn -c gun.py app:app --log-config log.conf
nohup gunicorn -c gun.py services.user:app --log-config log.conf > /dev/null 2>&1 &
nohup gunicorn -c gun.py app:app --log-config log.conf > /dev/null 2>&1 &
docker run  -p 5001:15000 -v  /Users/liutom/PycharmProjects/tt/mygithub/logs:/microservice/logs tomliu/flaskhp
