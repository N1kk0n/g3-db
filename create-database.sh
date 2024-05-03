#!/bin/bash

COCKROACH_HOME="./cockroach-db"
CERTS_DIR="certs"
SAFE_DIR="keys"
DB_NAME="g3"
SCHEMA_NAME="public"
USERS=(g3rqm g3qm g3rm)

#Delete databese if exists
${COCKROACH_HOME}/cockroach sql --certs-dir=${CERTS_DIR} --execute="drop database ${DB_NAME}"

# Create database and users
${COCKROACH_HOME}/cockroach sql --certs-dir=${CERTS_DIR} --execute="create database ${DB_NAME}"
for user in ${USERS[*]}; do
    echo "drop user ${user}"
    ${COCKROACH_HOME}/cockroach sql --certs-dir=${CERTS_DIR} --execute="drop user if exists ${user}"

    echo "create user ${user} with password null"
    ${COCKROACH_HOME}/cockroach sql --certs-dir=${CERTS_DIR} --execute="create user ${user} with password null"
done

# Create tables
${COCKROACH_HOME}/cockroach sql --database=${DB_NAME} --certs-dir=${CERTS_DIR} --file tables.sql

# Show tables
${COCKROACH_HOME}/cockroach sql --database=${DB_NAME} --certs-dir=${CERTS_DIR} --execute="show tables from g3.public"

