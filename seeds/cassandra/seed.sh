#!/usr/bin/env bash
# Loads data.cql into the cassandra container.
docker exec -i cassandra cqlsh < "$(dirname "$0")/data.cql"
