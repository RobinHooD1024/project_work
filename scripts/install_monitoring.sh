#!/bin/bash

yum install -y {jnet,h,io,if,a}top iptraf nmon
wget https://github.com/prometheus/prometheus/releases/download/v2.34.0/prometheus-2.34.0.linux-amd64.tar.gz
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
tar xzvf node_exporter-*.t*gz
tar xzvf prometheus-*.t*gz
useradd --no-create-home --shell /usr/sbin/nologin prometheus
useradd --no-create-home --shell /bin/false node_exporter
cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin
chown node_exporter: /usr/local/bin/node_exporter
cp ../configs/monitoring/node_exporter.service /etc/systemd/system/

systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter

mkdir {/etc/,/var/lib/}prometheus
cp -vi prometheus-*.linux-amd64/prom{etheus,tool} /usr/local/bin
cp -rvi prometheus-*.linux-amd64/{console{_libraries,s},prometheus.yml} /etc/prometheus/
chown -Rv prometheus: /usr/local/bin/prom{etheus,tool} /etc/prometheus/ /var/lib/prometheus/



mkdir {/etc/,/var/lib/}prometheus
cp -vi prometheus-*.linux-amd64/prom{etheus,tool} /usr/local/bin
cp -rvi prometheus-*.linux-amd64/{console{_libraries,s},prometheus.yml} /etc/prometheus/
chown -Rv prometheus: /usr/local/bin/prom{etheus,tool} /etc/prometheus/ /var/lib/prometheus/

cp ../configs/monitoring/prometheus.service /etc/systemd/system/
cp ../configs/monitoring/prometheus.yml /etc/prometheus/

systemctl daemon-reload
systemctl start prometheus
systemctl enable prometheus

cp ../configs/monitoring/grafana.repo /etc/yum.repos.d/
yum install grafana
systemctl daemon-reload
systemctl start grafana-server

systemctl status prometheus
systemctl status node_exporter
systemctl status grafana
