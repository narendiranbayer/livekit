# templates/livekit.yaml.tpl
port: 7880

rtc:
  tcp_port: 7881
  udp_port: 7882
  udp_port_range: [50000, 50010]

keys:
  ${api_key}: ${api_secret}
