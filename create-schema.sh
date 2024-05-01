#!/bin/bash

COCKROACH_HOME="./cockroach-db"
CERTS_DIR="certs"
SAFE_DIR="keys"
DB_NAME="g3"
SCHEMA_NAME="public"
USERS=(g3rqm g3qm g3rm)

# Create database and users
${COCKROACH_HOME}/cockroach sql --certs-dir=${CERTS_DIR} --execute="create database ${DB_NAME}"
for user in ${USERS[*]}; do
    echo "create user ${user} with password null"
    ${COCKROACH_HOME}/cockroach sql --certs-dir=${CERTS_DIR} --execute="create user ${user} with password null"
done

# Revoke all priveleges
echo "revoke all on all tables in schema ${SCHEMA_NAME} from ${SCHEMA_NAME}"
${COCKROACH_HOME}/cockroach sql --certs-dir=${CERTS_DIR} --execute="revoke all on all tables in schema ${SCHEMA_NAME} from ${SCHEMA_NAME}"

# Grant priveleges to users
for user in ${USERS[*]}; do
    echo "grant select, update, insert, delete on all tables in schema ${SCHEMA_NAME} to ${user}"
    ${COCKROACH_HOME}/cockroach sql --certs-dir=${CERTS_DIR} --execute="grant select, update, insert, delete on all tables in schema ${SCHEMA_NAME} to ${user}"
done
