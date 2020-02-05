#!/bin/sh

. $(readlink -f $(dirname $0))/db_settings.sh

psql -U $DB_USER -h $DB_HOST -p $DB_PORT -d $DB_NAME \
	-f create-users.sql

echo "$0: Don't forget to set passwords for users" >&2
