#!/bin/bash

rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
yum --enablerepo=mysql80-community install -y mysql-community-server
systemctl start mysqld
systemctl enable mysqld
grep "A temporary password" /var/log/mysqld.log
mysql_secure_installation