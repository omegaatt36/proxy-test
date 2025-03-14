# Proxy Test Environment

This repository provides a Docker Compose configuration for setting up HTTP and SOCKS5 proxy environments. It uses Squid and Dante to create proxy servers, supporting both authenticated and non-authenticated testing scenarios.

## Services

*   **Squid (No Authentication):**
    *   Image: `ubuntu/squid`
    *   Port: `3128:3128`
    *   Configuration: `squid-noauth/squid.conf`
*   **Squid (Authentication):**
    *   Image: `ubuntu/squid`
    *   Port: `3127:3128`
    *   Configuration: `squid-auth/squid.conf`, `squid-auth/squid-passwd`
*   **Dante (No Authentication):**
    *    Image: `vimagick/dante`
    *    Port: `1080:1080`
    *   Configuration: `dante-noauth/sockd.conf`
*  **Dante (Authentication):**
    *   Image: `vimagick/dante`
    *   Port: `1079:1080`
    *   Configuration: `dante-auth/sockd.conf`, `dante-auth/dante-users`

## Usage

1.  Build and run the containers:

    ```bash
    docker compose up -d
    ```

2.  Test the proxies. You can use `curl -x` as a basic test, see `test.sh` script for examples:

    ```bash
    ./test.sh
    ```

The `test.sh` script iterates through the following proxy configurations:

*   `http://localhost:3128` (Squid, no auth)
*   `http://proxy_user:55688@localhost:3127` (Squid, with auth)
*   `socks5://localhost:1080` (Dante, no auth)
*   `socks5://proxy_user:55688@localhost:1079` (Dante, with auth)

It uses `curl` to fetch the origin IP address through each proxy and `jq` to extract the IP from the JSON response.