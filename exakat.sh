#!/bin/sh

cd tinkergraph
./bin/gremlin-server.sh conf/gsneo4j.yaml > /dev/null 2>&1 & 
sleep 5
cd ..
php exakat.phar codacy 
