#!/bin/bash
DBTYPE=${DBTYPE:-Pg}
log_info "DBTYPE: ${DBTYPE}"
PREFIX=${OPENSHIFT_REPO_DIR%*/repo/}/install-root
log_info "PREFIX: ${PREFIX}"
#TODO add pg/mysql logic here
DBHOST=${OPENSHIFT_POSTGRESQL_DB_HOST}
log_info "DBHOST: ${DBHOST}"
DBNAME=${PGDATABASE}
log_info "DBNAME: ${DBNAME}"
DBDBA=${PGUSER}
log_info "DBDBA: ${DBDBA}"
DBUSER=${PGUSER}
log_info "DBUSER: ${DBUSER}"
DBPASS=${OPENSHIFT_POSTGRESQL_DB_PASSWORD}
log_info "DBPASS: '********'"
