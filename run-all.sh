#!/bin/sh

cd startrek-clojure
./run.sh
cd ../data.xml
./run.sh
cd ../data.json
./run.sh
cd ../fs
./run.sh
cd ../math.combinatorics
./run.sh
cd ../java.jdbc
./run.sh
cd ../data.int-map
./run.sh
# FIXME very expensive (or runs forever
#cd ../tools.analyzer.jvm
#./run.sh
