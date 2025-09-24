#!/bin/bash
set -euo pipefail

# write keys file safely (prevents shell expansion)
mkdir -p /etc/livekit
cat > /etc/livekit/keys <<'EOF'
${livekit_key}: ${livekit_secret}
EOF

chown root:root /etc/livekit/keys
chmod 600 /etc/livekit/keys

# install docker
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y docker.io

systemctl enable --now docker

# remove old container if any and start livekit
docker rm -f livekit-server || true

docker run -d --name livekit-server --restart unless-stopped \
  -v /etc/livekit:/etc/livekit:ro \
  -p 7880:7880/tcp \
  -p 7881:7881/tcp \
  -p 3478:3478/udp \
  -p 50000-50010:50000-50010/udp \
  livekit/livekit-server:latest --key-file /etc/livekit/keys
