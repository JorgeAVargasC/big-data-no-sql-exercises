# InfluxDB 1.x · InfluxQL

Terminal: `./terminals/influxdb1.sh`

> (+) El PDF hace esta parte con `curl` contra la API de InfluxDB 1.x, que la 2.x ya no tiene. Por eso hay un contenedor aparte (`influxdb1`). Aquí tienes cada comando en la shell `influx`. La versión con `curl` del PDF está debajo de cada uno, apuntando al puerto `8087`; córrela desde Git Bash en tu equipo.

## 1. Crear una base de datos

Base `sensors`.

```sql
CREATE DATABASE sensors
```

Con curl (PDF), desde Git Bash:

```bash
curl -XPOST http://localhost:8087/query --data-urlencode "q=CREATE DATABASE sensors"
```

## 2. Mostrar bases de datos

Todas las bases.

```sql
SHOW DATABASES
```

Con curl (PDF), desde Git Bash:

```bash
curl -G http://localhost:8087/query --data-urlencode "q=SHOW DATABASES"
```

## 3. Seleccionar la base

Usar `sensors` en la shell.

```sql
USE sensors
```

## 4. Insertar un punto

Temperatura del salón.

```sql
INSERT temperature,location=living_room value=23.5
```

Con curl (PDF), desde Git Bash:

```bash
curl -i -XPOST 'http://localhost:8087/write?db=sensors' --data-binary 'temperature,location=living_room value=23.5'
```

## 5. Insertar varios puntos

Tres ubicaciones; en la shell, un `INSERT` por línea.

```sql
INSERT temperature,location=kitchen value=25.0
INSERT temperature,location=bedroom value=21.8
INSERT temperature,location=garden value=19.2
```

Con curl (PDF), desde Git Bash:

```bash
curl -i -XPOST 'http://localhost:8087/write?db=sensors' --data-binary 'temperature,location=kitchen value=25.0
temperature,location=bedroom value=21.8
temperature,location=garden value=19.2'
```

## 6. Consultar una medición

Todos los registros de `temperature`.

```sql
SELECT * FROM temperature
```

Con curl (PDF), desde Git Bash:

```bash
curl -G 'http://localhost:8087/query?db=sensors' --data-urlencode "q=SELECT * FROM temperature"
```

## 7. Filtrar por etiqueta

Solo la cocina.

```sql
SELECT * FROM temperature WHERE location='kitchen'
```

Con curl (PDF), desde Git Bash:

```bash
curl -G 'http://localhost:8087/query?db=sensors' --data-urlencode "q=SELECT * FROM temperature WHERE location='kitchen'"
```

## 8. Promedio

Media de todas las lecturas.

```sql
SELECT MEAN(value) FROM temperature
```

Con curl (PDF), desde Git Bash:

```bash
curl -G 'http://localhost:8087/query?db=sensors' --data-urlencode "q=SELECT MEAN(value) FROM temperature"
```

## 9. Rango de tiempo

Lecturas de las últimas 6 horas.

```sql
SELECT * FROM temperature WHERE time > now() - 6h
```

Con curl (PDF), desde Git Bash:

```bash
curl -G 'http://localhost:8087/query?db=sensors' --data-urlencode "q=SELECT * FROM temperature WHERE time > now() - 6h"
```

## 10. Eliminar la base

Borrar `sensors`.

```sql
DROP DATABASE sensors
```

Con curl (PDF), desde Git Bash:

```bash
curl -XPOST http://localhost:8087/query --data-urlencode "q=DROP DATABASE sensors"
```

---

Fuente: `06-nosql-shell-exercises.pdf`. Lo marcado con (+) no está en el PDF.
