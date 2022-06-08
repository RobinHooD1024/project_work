#!/bin/bash

# Mysql backup script

PATH=$PATH:/usr/local/bin

DIR=`/root/backup/date +"%Y-%m-%d"`

MYSQL='mysql --skip-column-names -uroot -p'Justnewpassword1!''

mkdir $DIR; cd $DIR;

$MYSQL -e "STOP SLAVE;"

for s in mysql `$MYSQL -e "SHOW DATABASES LIKE '%'"`;
    do
        mkdir $s;
        for z in mysql `$MYSQL -e "SHOW TABLES FROM $s;"
		do
			/usr/bin/mysqldump -uroot -p'Justnewpassword1!' --add-drop-table --add-locks --create-options --disable-keys --extended-insert --single-transaction --quick --set-charset --events --routines --triggers --master-data=2 $s $z | gzip -1 > $s/$z.gz;
		done
    done

$MYSQL -e "START SLAVE;"
