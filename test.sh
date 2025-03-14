#!/usr/bin/env bash

set -e

proxies=(
  "http://localhost:3128"
  "http://proxy_user:55688@localhost:3127"
  "socks5://localhost:1080"
  "socks5://proxy_user:55688@localhost:1079"
)

for proxy in "${proxies[@]}"; do
  curl -s -x "$proxy" http://httpbin.org/ip | jq .origin
done
