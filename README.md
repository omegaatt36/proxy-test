# Proxy Test Environment

## Helm Chart Setup

### Services

*   **HTTP Proxy (No Authentication):**
    *   Image: `ghcr.io/sagernet/sing-box`
    *   Service: `http-noauth`
    *   Port: `3128`
*   **HTTP Proxy (Authentication):**
    *   Image: `ghcr.io/sagernet/sing-box`
    *   Service: `http-auth`
    *   Port: `3128`
    *   Credentials: `proxy_user:55688`
*   **SOCKS5 Proxy (No Authentication):**
    *   Image: `ghcr.io/sagernet/sing-box`
    *   Service: `socks-noauth`
    *   Port: `1080`
*   **SOCKS5 Proxy (Authentication):**
    *   Image: `ghcr.io/sagernet/sing-box`
    *   Service: `socks-auth`
    *   Port: `1080`
    *   Credentials: `proxy_user:55688`

### Usage

1.  Install the chart:

    ```bash
    # From the repository root
    helm install test-proxy ./helm
    ```

2.  Test the proxies using kubectl port-forward and the test script:

    ```bash
    # Port-forward the services
    kubectl port-forward svc/http-noauth 3128:3128 &
    kubectl port-forward svc/http-auth 3127:3128 &
    kubectl port-forward svc/socks-noauth 1080:1080 &
    kubectl port-forward svc/socks-auth 1079:1080 &

    # Run the test script
    ./test.sh
    ```

## Test Script

The `test.sh` script iterates through the following proxy configurations:

*   `http://localhost:3128` (HTTP, no auth)
*   `http://proxy_user:55688@localhost:3127` (HTTP, with auth)
*   `socks5://localhost:1080` (SOCKS5, no auth)
*   `socks5://proxy_user:55688@localhost:1079` (SOCKS5, with auth)

It uses `curl` to fetch the origin IP address through each proxy and `jq` to extract the IP from the JSON response.

## Authentication

For authenticated proxies, the credentials are:

- Username: `proxy_user`
- Password: `55688`
