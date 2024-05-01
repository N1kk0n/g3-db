#!/bin/bash

COCKROACH_HOME="./cockroach-db"
CERTS_DIR="certs"
SAFE_DIR="keys"
USERS=(g3rqm g3qm g3rm)

# Create two directories for certificates:
if [ ! -d ${CERTS_DIR} ]; then
	mkdir ${CERTS_DIR}
	echo "Certificates directory created: ${CERTS_DIR}"
fi

if [ ! -d ${SAFE_DIR} ]; then
	mkdir ${SAFE_DIR}
	echo "Safe directory created: ${SAFE_DIR}"	
fi
# Create the CA (Certificate Authority) certificate and key pair:
${COCKROACH_HOME}/cockroach cert create-ca --certs-dir=${CERTS_DIR} --ca-key=${SAFE_DIR}/ca.key
# Create the certificate and key pair for the node:
${COCKROACH_HOME}/cockroach cert create-node localhost $(hostname) --certs-dir=${CERTS_DIR} --ca-key=${SAFE_DIR}/ca.key

# Create a client certificate and key pair for the root user:
${COCKROACH_HOME}/cockroach cert create-client root --certs-dir=${CERTS_DIR} --ca-key=${SAFE_DIR}/ca.key
# Create a client certificate and key pair users:
for user in ${USERS[*]}; do
	${COCKROACH_HOME}/cockroach cert create-client ${user} --certs-dir=${CERTS_DIR} --ca-key=${SAFE_DIR}/ca.key --also-generate-pkcs8-key
done
