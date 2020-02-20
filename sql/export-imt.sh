#!/bin/sh

. $(readlink -f $(dirname $0))/db_settings.sh

psql -U $DB_USER -h $DB_HOST -p $DB_PORT -d $DB_NAME \
	-c 'COPY (SELECT * FROM cf_common.imt ORDER BY hazard_code, process_code) TO STDOUT WITH (FORMAT CSV, HEADER)'
