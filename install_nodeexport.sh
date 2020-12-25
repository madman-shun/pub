#!/bin/bash
cd /usr/local/src 
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar -xf node_exporter-1.0.1.linux-amd64.tar.gz
cd /lib/systemd/system/
systemctl daemon-reload
