#!/usr/bin/env bash
# Loads data.js into the mongo container.
docker exec -i mongo mongosh --quiet < "$(dirname "$0")/data.js"
