#!/bin/bash
set -e 

# ===================
# check  MYSQL_REMOTE_HOST
# ===================
if [ -z "$MYSQL_REMOTE_HOST" ]; then
	echo >&2 'error: no remote host specified'
	echo >&2 '  Did you forget to add -e MYSQL_REMOTE_HOST=... ?'
	exit 1
fi

# ===================
# connecting to  MYSQL_REMOTE_HOST
# ===================
echo "connecting..."
while [[ $(mysql -h $MYSQL_REMOTE_HOST -uroot -e ";" 2>/dev/null;echo $?) == "1" ]]; do echo "retry connecting..."; sleep 5; done

# ===================
# sql scripts
# ===================

echo "========================="
echo "run sql scripts"
echo "========================="

cd /tmp
mysql -h $MYSQL_REMOTE_HOST -u root < scripts.sql

# ===================
# trace users
# ===================

echo "========================="
echo "users"
echo "========================="

mysql -h $MYSQL_REMOTE_HOST -u root -e "select user, host, password from mysql.user;"

exec "$@"
