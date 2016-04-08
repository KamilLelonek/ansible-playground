#!/usr/bin/env bash

function load_config() {
  local scriptpath=$(cd ${0%/*} && pwd -P)
  source "${scriptpath}/pg_backup.config"
}

function create_dump_dir_unless_exist() {
  if ! mkdir -p $DUMP_DIR
  then
    echo "Cannot create backup directory in $DUMP_DIR" 1>&2
    exit 1
  fi
}

function dump_postgres_config() {
  local postgres_config_file="${DUMP_DIR}/postgres.dump"
  pg_dumpall -U postgres --globals-only > $postgres_config_file
}

function dump_database_if_exists() {
  if database_exists $1; then
    dump $1
  else
    echo "Database '$1' does not exist!"
  fi
}

function database_exists() {
  psql -U postgres -lqt | cut -d \| -f 1 | grep -wq $1
}

function dump() {
  local filename=$(filename $1)

  if ! pg_dump -U postgres $1 | gzip > $filename.in_progress; then
    echo "Failed to backup $1" 1>&2
    exit 1
  else
    mv $filename.in_progress $filename
  fi
}

function filename() {
  local timestamp=$(date +\%d-\%B-\%Y)
  local dbname=$1
  echo "${DUMP_DIR}/${dbname}_${timestamp}.sql.gz"
}

function remove_old_dumps() {
  find $DUMP_DIR -maxdepth 1 -mtime +$DAYS_TO_KEEP -name $1"_*" -exec rm -rf '{}' ';'
}

function main() {
  load_config
  for DATABASE in ${DATABASES_LIST//,/ }
  do
    create_dump_dir_unless_exist
    dump_postgres_config
    dump_database_if_exists $DATABASE
    remove_old_dumps $DATABASE
  done
}

main
