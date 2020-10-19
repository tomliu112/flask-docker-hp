FROM python:3.8-slim-buster
MAINTAINER      tomliu "fisher@sudops.com"
WORKDIR /microservice
COPY . .
run pip install Flask
run pip install requests
run pip install gevent
run pip install gunicorn
run pip install logging2

CMD exec gunicorn -c gun.py app:app --log-config log.conf

