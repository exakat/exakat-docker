#!/bin/bash

$NEO4J_HOME/bin/neo4j start && \
php exakat.phar codacy -p codacy
