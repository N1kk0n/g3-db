#!/bin/bash

COCKROACH_HOME="./cockroach-db"
CERTS_DIR="certs"

# Start the single-node cluster
${COCKROACH_HOME}/cockroach start-single-node --certs-dir=${CERTS_DIR} --listen-addr=localhost:26257 --http-addr=localhost:8090 --background
