#!/bin/bash

setenforce 0;
systemctl stop firewalld;
systemctl disable firewalld;

yum install -y epel-release;
yum install -y httpd
cp -r ../sites_examples/html ../sites_examples/html1 ../sites_examples/html2 ../sites_examples/html3 /var/www/
cp ../configs/apache/httpd.conf /etc/httpd/conf/
cp ../configs/apache/welcome.conf /etc/httpd/conf.d/
systemctl start httpd
systemctl status httpd
