use school

// Clears the collection so re-running the seed does not duplicate documents
db.students.deleteMany({})

db.students.insertMany([
  { name: 'Ana', age: 22, grade: 'A' },
  { name: 'Luis', age: 20, grade: 'B' },
  { name: 'Marta', age: 21, grade: 'A' },
  { name: 'Carlos', age: 23, grade: 'C' },
  { name: 'Lucia', age: 19, grade: 'B' },
  { name: 'Pedro', age: 25, grade: 'C' },
  { name: 'Sofia', age: 24, grade: 'A' },
  { name: 'Diego', age: 18, grade: 'B' },
  { name: 'Elena', age: 27, grade: 'A' },
  { name: 'Mateo', age: 30, grade: 'C' }
])

db.students.find()
