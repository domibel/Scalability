#!/bin/bash

set -ex

# preprocessing
for x in test/data/cluster000[45]* ; do
  dir=`pwd`/$x
  clustalw -tree -outorder=INPUT -infile=$dir/aa.fa -outfile=$dir/aa.ph
  clustalw -align -outorder=INPUT -infile=$dir/aa.fa -outfile=$dir/aa.aln
  pal2nal.pl -output paml $dir/aa.aln $dir/nt.fa > $dir/alignment.phy
done
