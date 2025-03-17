#!/bin/bash

psql -U ${POSTGRES_USER} -p 5432 -d dbms <<- END
    CREATE ROLE ${POSTGRES_USER} LOGIN PASSWORD '${POSTGRES_PASSWORD}';
    CREATE ROLE survey INHERIT;
    CREATE ROLE student_ INHERIT;
    CREATE ROLE user_role INHERIT;
    GRANT ${POSTGRES_USER} TO student_, survey, user_role;
END

export PGPASSWORD=${POSTGRES_PASSWORD}
pg_restore -U ${POSTGRES_USER}  -p 5432 -d dbms /docker-entrypoint-initdb.d/email_schema

