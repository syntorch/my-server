PROXY_ADDR="http://192.168.0.1:1234"
NO_PROXY_ADDRS="localhost,127,127.0.0.1,192.168.0.0/24"

sudo mkdir -p /etc/systemd/system/docker.service.d
cat <<EOF | sudo tee /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=$PROXY_ADDR"
Environment="HTTPS_PROXY=$PROXY_ADDR"
Environment="NO_PROXY=$NO_PROXY_ADDRS"
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
echo "Docker proxy settings applied."