#!/bin/bash

setenforce 0;
systemctl stop firewalld;
systemctl disable firewalld;

yum install -y epel-release;
yum install -y nginx;
cp ../configs/nginx/default.conf /etc/nginx/conf.d/;
cp ../configs/nginx/nginx.conf /etc/nginx/;
systemctl start nginx;
systemctl status nginx

