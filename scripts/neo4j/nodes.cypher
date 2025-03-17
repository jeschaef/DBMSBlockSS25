LOAD CSV FROM 'file:///csv/departments_n.csv' AS row
MERGE (d:Department {id: row[0],
                     name: row[1],
                     location: row[2]});

LOAD CSV FROM 'file:///csv/email.csv' AS row
MERGE (e:Email {id: row[0],
                from: row[1],
                time: datetime(REPLACE(row[2], ' ', 'T'))});

LOAD CSV WITH HEADERS FROM 'file:///csv/extraemail.csv' AS row
MERGE (e:Email {id: row.ID,
                from: row.MFROM,
                time: datetime(REPLACE(row.MTIME, ' ', 'T'))});

LOAD CSV FROM 'file:///csv/person_n.csv' AS row
MERGE (p:Person {id: row[0],
                 firstname: row[1],
                 middlename: row[2],
                 lastname: row[3],
                 salary: toInteger(row[5]),
                 email: row[6]});