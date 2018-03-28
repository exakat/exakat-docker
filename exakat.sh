#!/bin/sh

cd tinkergraph
./bin/gremlin-server.sh conf/gsneo4j.yaml > /dev/null 2>&1 & 
while ! echo exit | nc localhost 8182; do sleep 1; done
cd ..;
php exakat.phar codacy
