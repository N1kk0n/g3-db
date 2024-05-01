#!/bin/bash

CERTS_DIR="certs"
SAFE_DIR="keys"

rm -rf node*
rm -rf cockroach-data
rm -rf ${CERTS_DIR}
rm -rf ${SAFE_DIR}
