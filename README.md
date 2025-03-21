# Installation

## Requirements

1. Install & start [Docker](https://docs.docker.com/get-started/get-docker/) (if not already on your machine)
2. Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (if not already on your machine)
3. Clone the repository `git clone https://github.com/jeschaef/DBMSBlockSS25`
4. Change into the project directory cd DBMSBlockSS25
5. Download the import_email.cql file from [here](https://hessenbox-a10.rz.uni-frankfurt.de/getlink/fi76drYoUYfX4TMo42SVkN/import_email.cql) and copy it to the folder [scripts/cassandra](scripts/cassandra) (too big for this repo, can take some minutes to download)

## Configuration

1. Create a .env-file (regular textfile named `.env`) in the project folder
2. Copy the environment variable names from [.env_template](.env_template)
3. Set values for each of the environment variables (usernames/emails + passwords) in .env, e.g., `PG_USER=postgres`

Alternatively, you can replace the environment variables with the actual values in the [docker-compose.yml](docker-compose.yml) directly.

If you want to start only specific databases, you can comment out the other databases and their clients before starting the containers. 
For example, to work on the PostgreSQL assignment, you just need the containers "postgres" and "pgadmin".

The port mappings of the databases/web clients can be changed in the [docker-compose.yml](docker-compose.yml) if necessary.

## Start/stop the containers

You can start the containers with `docker compose up -d` from the CLI. 
The containers can be brought down with `docker compose down` from the CLI.

You can also specify which containers to start, e.g., `docker compose up -d postgres pgadmin` for the PostgreSQL database and client only.

## Access the databases

When the containers are running, each of the databases can be accessed via a web tool from your browser locally:
- PostgreSQL @ [http://localhost:5433](http://localhost:5433)
- Cassandra @ [http://localhost:9043](http://localhost:9043)
- Neo4J @ [http://localhost:7474](http://localhost:7474)
- Mongo @ [http://localhost:3000](http://localhost:3000)

If you updated the port mappings, you have to use different urls accordingly.

The username/email and password are the ones defined in .env


# Troubleshooting

You can check logs of all containers with `docker compose logs` or just specific ones, e.g., `docker compose logs postgres`. 
This can also be done nicely in Docker Desktop (needs to be installed).


Generally, the web clients wait for the right database containers to start up. If the (cassandra) container startup takes too long (causes docker to determine containers being unhealthy although they just not finished starting yet), you can increase the healthcheck parameters in docker-compose.yml. Still, a healthy container is not necessarily ready in the sense of all data being loaded already (in particular cassandra takes some time due to the large email import file).
