[![](https://images.microbadger.com/badges/image/rawmind/alpine-link-local.svg)](https://microbadger.com/images/rawmind/alpine-link-local "Get your own image badge on microbadger.com")

alpine-link-local
=================

A base image to add link local route to a vswitch. 

## Build

```
docker build -t rawmind/alpine-link-local:<version> .
```

## Versions

- `0.2` [(Dockerfile)](https://github.com/rawmind0/alpine-link-local/blob/0.2/Dockerfile).

## Env variables

- DESTINATION_IP        # Mandatory: Set the destination ip.
- BRIDGE                # Mandatory: Set the vswitch to set the route.
- KEEP_ALIVE="0"        # Set to 1 to keep container alive. (to run in k8s)

## Usage

This image basically, add a net route to a vswitch. It's specially thought to add link local ip routes to a host.

```
docker run -t \
  -e "DESTINATION_IP=169.254.169.251" \
  -e "BRIDGE=docker0" \
  --cap-add NET_ADMIN \
  --network=host \
  rawmind/alpine-link-local:<version> .
```

