#!/bin/bash

# turn on bash's job control
set -m

# Start the primary process and put it in the background
/startup/docker-entrypoint.sh neo4j &

# wait for Neo4j started
wget --quiet --tries=10 --retry-connrefused=on --waitretry=5 -O /dev/null http://localhost:7474

# execute person.cypher
cd import
find . -maxdepth 1 -type f -name \*.cypher -print0 | while IFS= read -r -d $'\0' file; do
  cat $file | cypher-shell -u $NEO_USER -p $NEO_PASSWORD
done

# now we bring the primary process back into the foreground
# and leave it there
fg %1