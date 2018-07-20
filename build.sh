#!/usr/bin/env bash

# Build exakat docker
docker build -f gremlin.dockerfile -t exakat/gremlin:latest .
docker run --rm -it -v "$PWD:/mnt" exakat/gremlin:latest
docker build --no-cache -t codacy/codacy-exakat:latest .
