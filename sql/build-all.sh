#!/bin/sh

TOPDIR="$(readlink -f $(dirname $0))"
. "$TOPDIR/db_settings.sh"

cd "$TOPDIR"

LOG_FILE="$0.log"
echo "$0 Start at $(date)" > $LOG_FILE
ls ??-*.sql | while read SQL_FILE 
do
 echo "Executing $SQL_FILE"
 echo "== Executing $SQL_FILE ==" >> $LOG_FILE
 psql -U $DB_USER -h $DB_HOST -p $DB_PORT -d $DB_NAME -f $SQL_FILE \
	>> $LOG_FILE >> $LOG_FILE 2>&1
 if [ $? != 0 ]
 then
	echo "$0: Failed to run $SQL_FILE, see $LOG_FILE"   
 else
 	echo "== Done Executing $SQL_FILE ==" >> $LOG_FILE
 fi
done
echo "$0 Ends at $(date)" >> $LOG_FILE
