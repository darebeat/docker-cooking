#!/bin/sh
# Wait for database to get available

AZK_VERSION="3.57.0"

DB_LOOPS="30"
MYSQL_HOST="mysql"
MYSQL_PORT="3306"
START_CMD="sh bin/start-web.sh"

#wait for mysql
i=0
while ! nc $MYSQL_HOST $MYSQL_PORT >/dev/null 2>&1 < /dev/null; do
  #statements
  i=`expr $i + 1`
  if [ $i -ge $DB_LOOPS ]; then
    echo "$(date) - ${MYSQL_HOST}:${MYSQL_PORT} still not reachable, giving up"
    exit 1
  fi
  echo "$(date) - waiting for ${MYSQL_HOST}:${MYSQL_PORT}..."
  sleep 2
done

# initialize azkaban db
mysql -h $MYSQL_HOST -uazkaban -pazkaban azkaban < create-all-sql-$AZK_VERSION.sql

#start the daemon
exec $START_CMD
