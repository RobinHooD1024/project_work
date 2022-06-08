#!/bin/bash

PATH=$PATH:/usr/local/bin

cp ../configs/mysql/my.cnf /etc/;
systemctl restart mysqld

MYSQL='mysql --skip-column-names -uroot -p'Justnewpassword1!''

$MYSQL -e "CHANGE MASTER TO MASTER_HOST='45.33.87.57', MASTER_USER='repl', MASTER_PASSWORD='slaveTestPassword3%', MASTER_LOG_FILE='binlog.000001', MASTER_LOG_POS=1330, GET_MASTER_PUBLIC_KEY = 1;"
$MYSQL -e "START SLAVE; "
$MYSQL -e "SHOW SLAVE STATUS\G; "