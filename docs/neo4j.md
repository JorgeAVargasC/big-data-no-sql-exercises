# Neo4j · Cypher

Terminal: `./terminals/neo4j.sh`

> También puedes pegar los comandos en el navegador de Neo4j (`http://localhost:7474`, usuario `neo4j`, contraseña `password1234`), que dibuja el grafo.

## 1. Crear un nodo

Nodo `Person` con nombre y edad.

```cypher
CREATE (p:Person {name: 'Ana', age: 25});
```

## 2. Crear varios nodos

Dos `Person` en una sentencia.

```cypher
CREATE (a:Person {name: 'Luis', age: 30}),
       (b:Person {name: 'Marta', age: 22});
```

## 3. Crear una relación

Ana es amiga de Luis.

```cypher
MATCH (a:Person {name: 'Ana'}), (b:Person {name: 'Luis'})
CREATE (a)-[:FRIENDS_WITH]->(b);
```

## 4. Consultar todos los nodos

Todo el grafo.

```cypher
MATCH (n) RETURN n;
```

> (+) En la terminal sale como texto; en `localhost:7474` se ve como grafo.

## 5. Buscar con condición

Personas mayores de 24.

```cypher
MATCH (p:Person)
WHERE p.age > 24
RETURN p.name, p.age;
```

## 6. Actualizar propiedades

Cambiar la edad de Marta.

```cypher
MATCH (p:Person {name: 'Marta'})
SET p.age = 23;
```

## 7. Eliminar una relación

Quitar la amistad Ana → Luis.

```cypher
MATCH (a:Person {name: 'Ana'})-[r:FRIENDS_WITH]->(b:Person {name: 'Luis'})
DELETE r;
```

## 8. Eliminar un nodo

Borrar a Marta (no tiene relaciones).

```cypher
MATCH (p:Person {name: 'Marta'})
DELETE p;
```

> (+) Si el nodo tuviera relaciones, `DELETE` falla: usa `DETACH DELETE p`.

## 9. Crear un patrón más complejo

Nodo `Movie` y relación `ACTED_IN` con propiedad.

```cypher
CREATE (m:Movie {title: 'Inception', year: 2010});
MATCH (p:Person {name: 'Ana'}), (m:Movie {title: 'Inception'})
CREATE (p)-[:ACTED_IN {role: 'Dream Architect'}]->(m);
```

## 10. Consultar relaciones y propiedades

Quién actuó en cada película y con qué papel.

```cypher
MATCH (p:Person)-[r:ACTED_IN]->(m:Movie)
RETURN p.name AS actor, m.title AS movie, r.role AS role;
```

---

Fuente: `06-nosql-shell-exercises.pdf`. Lo marcado con (+) no está en el PDF.
