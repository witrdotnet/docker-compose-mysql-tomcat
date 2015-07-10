FROM mysql

# sql scripts
COPY ./scripts.sql /tmp/scripts.sql
# start-dbsetup
COPY ./start-dbsetup.sh /tmp/start-dbsetup.sh

# setup database
CMD ["/tmp/start-dbsetup.sh"]
