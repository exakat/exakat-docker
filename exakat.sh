#!/bin/sh
for arg; do
	case "$arg" in project|dump)
            cd neo4j
            ./bin/neo4j start >/dev/null 2>&1
            cd ..
			break
			;;
	esac
done

./exakat.phar $@