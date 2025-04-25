# Test Proxy Helm Chart

This Helm chart deploys sing-box proxies with and without authentication.

## Proxy Types

1. HTTP Proxy (No Authentication) - Port 3128
2. SOCKS5 Proxy (No Authentication) - Port 1080
3. HTTP Proxy (With Authentication) - Port 3128
4. SOCKS5 Proxy (With Authentication) - Port 1080

## Authentication

For authenticated proxies, the default credentials are:

- Username: `proxy_user`
- Password: `55688`

## Installation

```bash
# Install the chart
helm install test-proxy ./test-proxy

# Upgrade existing installation
helm upgrade test-proxy ./test-proxy
```

## Configuration

See `values.yaml` for configurable parameters.

## Usage Examples

### HTTP Proxy

```bash
# Without authentication
export http_proxy=http://[CLUSTER-IP]:3128
export https_proxy=http://[CLUSTER-IP]:3128

# With authentication
export http_proxy=http://proxy_user:55688@[CLUSTER-IP]:3128
export https_proxy=http://proxy_user:55688@[CLUSTER-IP]:3128
```

### SOCKS5 Proxy

```bash
# Without authentication
export ALL_PROXY=socks5://[CLUSTER-IP]:1080

# With authentication
export ALL_PROXY=socks5://proxy_user:55688@[CLUSTER-IP]:1080
```