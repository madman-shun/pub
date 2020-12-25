#!/bin/bash
cd /usr/local/src 
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar -xf node_exporter-1.0.1.linux-amd64.tar.gz
cd /lib/systemd/system/

cat > node_exporter.service << EOF
[Unit]
Description=node_exporter
After=network.target

[Service]
User=root
Type=simple
ExecStart=/usr/local/src/node_exporter-1.0.1.linux-amd64/node_exporter --web.listen-address=:9100
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable node_exporter.service
systemctl start node_exporter.service
systemctl status node_exporter.service
