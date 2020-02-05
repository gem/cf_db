#!/bin/sh

. $(readlink -f $(dirname $0))/db_settings.sh

createdb -U $DB_USER -p $DB_PORT -h $DB_HOST $DB_NAME

psql -U $DB_USER -h $DB_HOST -p $DB_PORT -d $DB_NAME \
	-c 'CREATE EXTENSION postgis;'
