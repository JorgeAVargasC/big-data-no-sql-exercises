CREATE KEYSPACE IF NOT EXISTS academy
  WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE academy;

CREATE TABLE IF NOT EXISTS students (
  id UUID PRIMARY KEY,
  name TEXT,
  age INT
);

-- Fixed ids: re-running the seed overwrites these rows instead of duplicating them
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000001, 'Ana', 22);
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000002, 'Luis', 20);
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000003, 'Marta', 21);
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000004, 'Carlos', 23);
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000005, 'Lucia', 19);
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000006, 'Pedro', 25);
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000007, 'Sofia', 24);
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000008, 'Diego', 18);
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000009, 'Elena', 27);
INSERT INTO students (id, name, age) VALUES (00000000-0000-0000-0000-000000000010, 'Mateo', 30);

SELECT * FROM students;
