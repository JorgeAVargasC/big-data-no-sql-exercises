#!/usr/bin/env bash
# Creates the sensors database in influxdb1 and loads data.lp through its HTTP API.
curl -s -XPOST http://localhost:8087/query --data-urlencode "q=CREATE DATABASE sensors"
curl -s -XPOST "http://localhost:8087/write?db=sensors" --data-binary @"$(dirname "$0")/data.lp"
