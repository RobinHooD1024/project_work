#!/bin/bash

setenforce 0;
systemctl stop firewalld;
systemctl disable firewalld;

yum install -y epel-release nginx httpd