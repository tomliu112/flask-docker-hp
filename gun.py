import os
import gevent.monkey
gevent.monkey.patch_all()

import multiprocessing

debug = True
loglevel = 'debug'
bind = '0.0.0.0:15000'
#pidfile = 'log/gunicorn.pid'
#logfile = 'log/debug.log'

#workers = multiprocessing.cpu_count() * 2 + 1
workers=1
worker_class = 'gunicorn.workers.ggevent.GeventWorker'
timeout=1200
keepalive=5
graceful_timeout=120
x_forwarded_for_header = 'X-FORWARDED-FOR'