#!/usr/bin/env bash

# Build gremlin plugin
docker build --no-cache -t exakat/codacy:1.1.8 .
docker run -it --rm -v $(pwd)/../docker/projects/codacy/code:/src exakat/exakat:1.1.8 codacy
docker run -it --entrypoint /bin/bash -v $(pwd)/../docker/projects/codacy/code:/src exakat/codacy:1.1.8 
docker run -it --entrypoint /bin/bash -v $(pwd)/../docker/projects/codacy/code:/src --user docker exakat/codacy:1.1.8 

docker build --no-cache -f build.dockerfile -t exakat/builder .
docker run --rm -it -v $(pwd):/mnt exakat/builder

# Build base image with dependencies
docker build --no-cache -f base.dockerfile -t exakat/base .

# Build exakat docker
docker build --no-cache -t exakat/codacy .
