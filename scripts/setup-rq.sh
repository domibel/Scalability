#!/bin/bash


set -ex

# setup queue manager
# export PATH=~/opt/ruby/rq/bin/:$PATH
# first time create the queue
if [ ! -d ~/queue ]; then
  rq ~/queue create
else
  rq ~/queue d all
fi
# start the rq daemon, max 8 processes running in parallel
rq ~/queue feed --daemon --log=rq.log --max_feed=8 --min_sleep 2 --max_sleep 15
