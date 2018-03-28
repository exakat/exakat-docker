#!/usr/bin/env bash

# Prepare gremlin server
docker build --no-cache -f gremlin.dockerfile -t exakat/gremlin .
docker run --rm -it -v $(pwd):/mnt exakat/gremlin:latest

# Build base image with dependencies
docker build --no-cache -f base.dockerfile -t exakat/base .

# Build exakat docker
docker build --no-cache -t exakat/codacy .
