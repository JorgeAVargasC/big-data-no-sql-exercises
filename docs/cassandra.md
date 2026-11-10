# Cassandra · CQL

Terminal: `./terminals/cassandra.sh`

## 1. Crear un keyspace

Keyspace `academy` con replicación simple.

```sql
CREATE KEYSPACE academy WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};
```

## 2. Usar un keyspace

Trabajar dentro de `academy`.

```sql
USE academy;
```

## 3. Crear una tabla

Tabla `students` con `id`, `name` y `age`.

```sql
CREATE TABLE students (
  id UUID PRIMARY KEY,
  name TEXT,
  age INT
);
```

## 4. Insertar datos

Un registro en `students`.

```sql
INSERT INTO students (id, name, age) VALUES (uuid(), 'Ana', 22);
```

## 5. Consultar todo

Todos los registros de `students`.

```sql
SELECT * FROM students;
```

## 6. Filtrar con WHERE

Estudiantes con edad mayor que 20.

```sql
SELECT * FROM students WHERE age > 20 ALLOW FILTERING;
```

> `age` no es clave: Cassandra exige `ALLOW FILTERING` para aceptar que recorre toda la tabla.

## 7. Actualizar un registro

Cambiar la edad de un estudiante concreto.

```sql
SELECT id, name FROM students;
UPDATE students SET age = 23 WHERE id = <uuid_del_estudiante>;
```

> (+) El primer `SELECT` te da el `id`. Pégalo en lugar de `<uuid_del_estudiante>`, sin comillas.

## 8. Eliminar un registro

Borrar un estudiante por su `id`.

```sql
DELETE FROM students WHERE id = <uuid_del_estudiante>;
```

## 9. Crear un índice secundario

Índice sobre `name`.

```sql
CREATE INDEX ON students (name);
SELECT * FROM students WHERE name = 'Ana';
```

> (+) La segunda línea comprueba el índice: ya no hace falta `ALLOW FILTERING` para filtrar por `name`.

## 10. Borrar tabla y keyspace

Primero la tabla, luego el keyspace.

```sql
DROP TABLE students;
DROP KEYSPACE academy;
```

---

Fuente: `06-nosql-shell-exercises.pdf`. Lo marcado con (+) no está en el PDF.
