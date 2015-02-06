#!/usr/bin/env puma

root = File.dirname(__FILE__) + '/../'

directory root
rackup root + 'config.ru'
environment 'production'
bind 'tcp://0.0.0.0:8080'
pidfile root + 'tmp/pids/server.pid'
threads 8, 32
workers 3
prune_bundler
