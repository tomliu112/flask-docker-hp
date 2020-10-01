# Microservices Project Make File
# author: umer mansoor

VIRTUALENV = $(shell which virtualenv)

clean: shutdown
	rm -fr microservices.egg-info
	rm -fr venv

venv:
	$(VIRTUALENV) venv

install: clean venv
	. venv/bin/activate; python setup.py install
	. venv/bin/activate; python setup.py develop

launch: venv shutdown

	. venv/bin/activate;

shutdown:

	ps -ef | grep "services/user.py" | grep -v grep | awk '{print $2}' | xargs kill

. venv/bin/activate

ps -ef | grep "gunicorn" | grep -v grep | awk '{print $2}' | xargs kill
nohup gunicorn -c gun.py services.user:app --log-config log.conf > /dev/null 2>&1 &
nohup gunicorn -c gun.py app:app --log-config log.conf > /dev/null 2>&1 &

docker run  -p 5001:15000 -v  /Users/liutom/PycharmProjects/tt/mygithub/logs:/microservice/logs tomliu/flaskhp
