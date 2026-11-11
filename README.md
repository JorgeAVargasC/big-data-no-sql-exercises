# Bases NoSQL con Docker

```bash
docker compose up -d              # start all
docker compose up -d mongo        # start only one (cassandra | mongo | neo4j | influxdb | influxdb1)
docker compose down               # stop (data is kept)
./seeds/cassandra/seed.sh         # 10 rows in academy.students
./seeds/mongo/seed.sh             # 10 documents in school.students
./seeds/neo4j/seed.sh             # 10 Person, 2 Movie and their relationships (wipes the graph)
./seeds/influxdb1/seed.sh         # 10 points in sensors.temperature
./seeds/influxdb2/seed.sh         # 10 points in myorg/sensors
rm -rf data                       # delete all data (with containers stopped)
```

| Base | Terminal | Web | Usuario / contraseña |
|---|---|---|---|
| Cassandra | `./terminals/cassandra.sh` | — | — |
| MongoDB | `./terminals/mongo.sh` | — | — |
| Neo4j | `./terminals/neo4j.sh` | http://localhost:7474 | neo4j / password1234 |
| InfluxDB | `./terminals/influxdb2.sh` (bash con `influx` ya configurado; org `deusto`) | http://localhost:8086 | admin / password1234 |
| InfluxDB 1.x | `./terminals/influxdb1.sh` | API en http://localhost:8087 | — |
