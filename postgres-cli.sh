#! /bin/bash -e

docker run $* \
   --name postgresterm \
   --rm postgres:9.6.5 \
   sh -c 'export PGPASSWORD=eventuate; exec psql -U eventuate'
