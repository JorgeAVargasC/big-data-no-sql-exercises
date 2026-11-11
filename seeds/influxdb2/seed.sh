#!/usr/bin/env bash
# Creates org myorg and bucket sensors in influxdb (ignores "already exists") and loads data.lp.
docker exec influxdb influx org create --name myorg 2>/dev/null
docker exec influxdb influx bucket create --name sensors --org myorg 2>/dev/null
docker exec -i influxdb influx write --bucket sensors --org myorg < "$(dirname "$0")/data.lp"
