#!/usr/bin/env bash

set -e

proxies=(
    "http://localhost:3128"                  # HTTP no-auth
    "http://proxy_user:55688@localhost:3127" # HTTP auth
    "socks5://localhost:1080"                # SOCKS5 no-auth
    "socks5://proxy_user:55688@localhost:1079" # SOCKS5 auth
)

echo "Direct IP check:"
curl -s http://httpbin.org/ip | jq .origin
echo "--------------------"

for proxy in "${proxies[@]}"; do
    echo "Testing proxy: $proxy"
    echo "Resulting IP:"
    curl -x "$proxy" -s http://httpbin.org/ip | jq .origin
    echo "--------------------"
done