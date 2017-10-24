#!/bin/bash

$NEO4J_HOME/bin/neo4j start && \
php exakat.phar project -p codacy
