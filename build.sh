#!/usr/bin/env bash

# Prepare gremlin server
docker build --no-cache -f gremlin.dockerfile -t exakat/gremlin .
docker run --rm -it -v $(pwd):/mnt exakat/gremlin:latest

# Build exakat docker
docker build --no-cache -t exakat/codacy .
