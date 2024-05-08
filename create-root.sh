#!/bin/bash

COCKROACH_HOME="./cockroach-db"
CERTS_DIR="certs"
SAFE_DIR="keys"
DB_NAME="g3"
SCHEMA_NAME="public"

if [ $# -ne 1 ]; then
    echo "Usage: ./create-root.sh <root_password>"
    exit 0
fi
password=$1

# Create user root for database
${COCKROACH_HOME}/cockroach sql --certs-dir=${CERTS_DIR} --execute="alter user root with password '${password}'"
