// person knows person
LOAD CSV FROM 'file:///csv/knows.csv' AS row
MATCH (p1:Person {id:row[0]}), (p2:Person {id:row[1]})
MERGE (p1)-[:KNOWS]->(p2);

// person worksin department
LOAD CSV FROM 'file:///csv/person_n.csv' AS row
MATCH (p:Person {id: row[0]}), (d:Department {id: row[4]})
MERGE (p)-[:WORKS_IN]-(d);

// email to person
LOAD CSV FROM 'file:///csv/to.csv' AS row
MATCH (e:Email {id: row[0]}), (p:Person {email: row[1]})
MERGE (e)-[:EMAIL_TO]->(p);

LOAD CSV WITH HEADERS FROM 'file:///csv/extrato.csv' AS row
MATCH (e:Email {id: row.ID}), (p:Person {email: row.MTO})
MERGE (e)-[:EMAIL_TO]->(p);

// email from person
MATCH (e:Email), (p:Person {email: e.from})
MERGE (e)-[:EMAIL_FROM]->(p);

// email cc person?
LOAD CSV WITH HEADERS FROM 'file:///csv/cc.csv' AS row
MATCH (e: Email {id: row.id}), (p:Person {email: row.email})
MERGE (e)-[:EMAIL_CC]->(p);