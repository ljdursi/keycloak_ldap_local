#!/usr/bin/env bash

# Copied from Dash's changes to `candig_compose`
# Only need to run this script for a fresh Postgres deployment


echo "Modifying Postgres Container"
docker exec postgresdb ./tmp/setup_postgres.sh
wait

echo "Confirming schema alterations"
VERIFY=`docker exec postgresdb psql -X -A -U keycloak -c "\d+ user_attribute" | grep -o "value|character varying|"`

if [ "$VERIFY" = "value|character varying|" ] ; then
    echo "Verified"
else
    echo "Error. Schema not changed. Rerun this script."
fi