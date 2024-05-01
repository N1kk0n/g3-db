#!/bin/bash

COCKROACH_HOME="./cockroach-db"
CERTS_DIR="certs"

# Start the single-node cluster and add more nodes with --join flag:
${COCKROACH_HOME}/cockroach start --certs-dir=${CERTS_DIR} --store=node1 --listen-addr=localhost:26257 --http-addr=localhost:8080 --join=localhost:26257,localhost:26258,localhost:26259 --background
${COCKROACH_HOME}/cockroach start --certs-dir=${CERTS_DIR} --store=node2 --listen-addr=localhost:26258 --http-addr=localhost:8081 --join=localhost:26257,localhost:26258,localhost:26259 --background
${COCKROACH_HOME}/cockroach start --certs-dir=${CERTS_DIR} --store=node3 --listen-addr=localhost:26259 --http-addr=localhost:8082 --join=localhost:26257,localhost:26258,localhost:26259 --background
${COCKROACH_HOME}/cockroach init --certs-dir=${CERTS_DIR} --host=localhost:26257

