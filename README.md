# Cassandra con Docker

```bash
docker compose up -d                  # arrancar
docker compose logs -f                # esperar "Starting listening for CQL clients"
docker exec -it cassandra cqlsh       # abrir la shell CQL
docker compose down                   # parar (los datos se conservan)
docker compose down -v                # parar y borrar los datos
```

Si `cqlsh` da `Connection refused`, Cassandra todavía está arrancando: espera un poco.
