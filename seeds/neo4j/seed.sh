#!/usr/bin/env bash
# Loads data.cypher into the neo4j container.
docker exec -i neo4j cypher-shell -u neo4j -p password1234 < "$(dirname "$0")/data.cypher"
