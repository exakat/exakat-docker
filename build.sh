#!/usr/bin/env bash

# Build base image with dependencies
docker build --no-cache -f base.dockerfile -t exakat/base .

# Build exakat docker
docker build --no-cache -t exakat/codacy .

docker run -v $(pwd)/../docker/projects/codacy/code:/src --user docker exakat/codacy:latest
