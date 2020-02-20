#!/bin/sh

if [ $# -ne 1 ]
then
	echo "Usage: $0 <imt csv file (with headers)>"
	exit 1
fi

INFILE=$1
if [ ! -r "$INFILE" ]
then
	echo "$0: Unable to open $INFILE for reading"
	exit 1
fi

. $(readlink -f $(dirname $0))/db_settings.sh

cat $INFILE | \
psql -U $DB_USER -h $DB_HOST -p $DB_PORT -d $DB_NAME \
	-c 'COPY cf_common.imt FROM STDIN WITH (FORMAT CSV, HEADER)'
