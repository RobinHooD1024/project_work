#!/bin/bash

PATH=$PATH:/usr/local/bin

cp ../configs/mysql/my.cnf /etc/;

MYSQL='mysql --skip-column-names -uroot -p'Justnewpassword1!''

$MYSQL -e "CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'slaveTestPassword3%'; "
$MYSQL -e "GRANT REPLICATION SLAVE ON *.* TO repl@'%'; "
$MYSQL -e "SELECT User, Host FROM mysql.user; "
$MYSQL -e "SHOW MASTER STATUS; "

