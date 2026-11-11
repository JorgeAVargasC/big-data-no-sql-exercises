// Deletes the whole graph so re-running the seed does not duplicate nodes
MATCH (n)
DETACH DELETE n;

CREATE
  (:Person {name: 'Ana', age: 25}),
  (:Person {name: 'Luis', age: 30}),
  (:Person {name: 'Marta', age: 22}),
  (:Person {name: 'Carlos', age: 23}),
  (:Person {name: 'Lucia', age: 19}),
  (:Person {name: 'Pedro', age: 28}),
  (:Person {name: 'Sofia', age: 24}),
  (:Person {name: 'Diego', age: 18}),
  (:Person {name: 'Elena', age: 27}),
  (:Person {name: 'Mateo', age: 31});

CREATE
  (:Movie {title: 'Inception', year: 2010}),
  (:Movie {title: 'Interstellar', year: 2014});

MATCH (a:Person {name: 'Ana'}), (b:Person {name: 'Luis'})
CREATE (a)-[:FRIENDS_WITH]->(b);
MATCH (a:Person {name: 'Ana'}), (b:Person {name: 'Sofia'})
CREATE (a)-[:FRIENDS_WITH]->(b);
MATCH (a:Person {name: 'Luis'}), (b:Person {name: 'Carlos'})
CREATE (a)-[:FRIENDS_WITH]->(b);
MATCH (a:Person {name: 'Elena'}), (b:Person {name: 'Mateo'})
CREATE (a)-[:FRIENDS_WITH]->(b);

MATCH (p:Person {name: 'Ana'}), (m:Movie {title: 'Inception'})
CREATE (p)-[:ACTED_IN {role: 'Dream Architect'}]->(m);
MATCH (p:Person {name: 'Pedro'}), (m:Movie {title: 'Inception'})
CREATE (p)-[:ACTED_IN {role: 'Extractor'}]->(m);
MATCH (p:Person {name: 'Elena'}), (m:Movie {title: 'Interstellar'})
CREATE (p)-[:ACTED_IN {role: 'Pilot'}]->(m);

MATCH (n)
RETURN labels(n) AS label, count(*) AS total;