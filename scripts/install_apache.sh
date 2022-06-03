#!/bin/bash

setenforce 0;
systemctl stop firewalld;
systemctl disable firewalld;

yum install -y epel-release;
yum install -y httpd
cp -r ../sites_examples/html ../sites_examples/html1 ../sites_examples/html2 ../sites_examples/html3 /var/www/