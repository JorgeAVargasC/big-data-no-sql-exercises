# MongoDB · mongosh

Terminal: `./terminals/mongo.sh`

## 1. Mostrar bases de datos

Todas las bases del servidor.

```js
show dbs
```

## 2. Crear o usar una base

Cambiar a `school`; se crea al guardar el primer dato.

```js
use school
```

> (+) `school` no aparece en `show dbs` hasta que tenga al menos una colección.

## 3. Crear una colección

Colección `students`.

```js
db.createCollection('students')
```

## 4. Insertar un documento

Un documento en `students`.

```js
db.students.insertOne({ name: 'Ana', age: 22, grade: 'A' })
```

## 5. Insertar varios documentos

Varios a la vez.

```js
db.students.insertMany([
  { name: 'Luis', age: 20, grade: 'B' },
  { name: 'Marta', age: 21, grade: 'A' },
  { name: 'Carlos', age: 23, grade: 'C' }
])
```

## 6. Consultar todo

Todos los documentos de `students`.

```js
db.students.find()
```

## 7. Consultar con condición

Edad mayor o igual que 21.

```js
db.students.find({ age: { $gte: 21 } })
```

## 8. Actualizar un documento

Cambiar la nota de Carlos.

```js
db.students.updateOne({ name: 'Carlos' }, { $set: { grade: 'B' } })
```

> Sin `$set`, el documento entero se reemplaza por `{ grade: 'B' }`.

## 9. Eliminar un documento

Borrar a Luis.

```js
db.students.deleteOne({ name: 'Luis' })
```

## 10. Eliminar colección y base

Borrar `students` y luego `school`.

```js
db.students.drop()
db.dropDatabase()
```

---

Fuente: `06-nosql-shell-exercises.pdf`. Lo marcado con (+) no está en el PDF.
