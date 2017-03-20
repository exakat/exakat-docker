#!/usr/bin/env bash

# Build gremlin plugin
docker build --no-cache -f build.dockerfile -t exakat/builder .
docker run --rm -it -v $(pwd):/mnt exakat/builder

# Build base image with dependencies
docker build --no-cache -f base.dockerfile -t exakat/base .

# Build exakat docker
docker build --no-cache -t exakat/codacy .
