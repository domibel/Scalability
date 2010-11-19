#!/bin/bash
#
# Copyright (C) 2010 Pjotr Prins <pjotr.prins@thebird.nl>

set -ex

# start submitting jobs to rq
for x in test/data/cluster000[45]* ; do
  dir=`pwd`/$x
  # submit to rq; pass in the path!
  rq ~/queue submit "cd $dir ; codeml $dir/../paml0-3.ctl"
done
