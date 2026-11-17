# InfluxDB 2.x · CLI y Flux

Terminal: `./terminals/influxdb2.sh`

> La terminal abre bash dentro del contenedor, con `influx` ya autenticado. (+) He añadido `--org myorg` a las consultas: sin él, `influx` busca el bucket en la organización por defecto del contenedor (`deusto`) y no lo encuentra.

## 1. Crear organización y bucket

Organización `myorg` y bucket `sensors` con 30 días de retención.

```bash
influx org create --name myorg
influx bucket create --name sensors --org myorg --retention 30d
```

## 2. Insertar datos

Tres puntos de temperatura (sin marca de tiempo: se guarda la hora actual).

```bash
influx write --bucket sensors --org myorg --precision s "
temperature,location=living_room value=23.5
temperature,location=kitchen value=25.0
temperature,location=bedroom value=21.8"
```

## 3. Consultar todo

Toda la medición `temperature`.

```bash
influx query --org myorg 'from(bucket:"sensors") |> range(start: 0) |> filter(fn: (r) => r._measurement == "temperature")'
```

## 4. Últimas 6 horas

Datos recientes.

```bash
influx query --org myorg 'from(bucket:"sensors") |> range(start: -6h) |> filter(fn: (r) => r._measurement == "temperature")'
```

## 5. Filtrar por etiqueta

Solo la cocina.

```bash
influx query --org myorg 'from(bucket:"sensors") |> range(start: -24h) |> filter(fn: (r) => r.location == "kitchen")'
```

> (+) En el PDF esta línea tiene comillas dobles dentro de comillas dobles y no funciona. Aquí va con comillas simples por fuera.

## 6. Promedio

Media de todas las lecturas.

```bash
influx query --org myorg 'from(bucket:"sensors") |> range(start: -1d) |> filter(fn: (r) => r._field == "value") |> mean()'
```

## 7. Agrupar por ubicación

Media por `location`.

```bash
influx query --org myorg 'from(bucket:"sensors") |> range(start: -1d) |> filter(fn: (r) => r._measurement == "temperature") |> group(columns: ["location"]) |> mean()'
```

## 8. Consultar con curl

Por la API, con token. Córrelo desde Git Bash en tu equipo, no en el contenedor.

```bash
curl --request POST "http://localhost:8086/api/v2/query?org=myorg" \
  --header "Authorization: Token deusto-token" \
  --header "Content-Type: application/vnd.flux" \
  --data 'from(bucket:"sensors") |> range(start: -1h) |> filter(fn: (r) => r._measurement == "temperature")'
```

> (+) `deusto-token` es el token que define el `docker-compose.yml`. En el PDF va `<TU_TOKEN>`.

## 9. Exportar a CSV

Resultado de la consulta a un archivo.

```bash
influx query --org myorg 'from(bucket:"sensors") |> range(start: -1d)' --raw > /tmp/results.csv
```

> (+) El archivo queda dentro del contenedor. Para traerlo a tu carpeta, desde Git Bash: `docker cp influxdb:/tmp/results.csv .`

## 10. Eliminar el bucket

Borrar `sensors` y sus datos.

```bash
influx bucket delete --name sensors --org myorg
```

---

Fuente: `06-nosql-shell-exercises.pdf`. Lo marcado con (+) no está en el PDF.
