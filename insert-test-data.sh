#!/bin/bash

COCKROACH_HOME="./cockroach-db"
CERTS_DIR="certs"
DB_NAME="g3"

# Insert test data
${COCKROACH_HOME}/cockroach sql --database=${DB_NAME} --certs-dir=${CERTS_DIR} --file test-data.sql

