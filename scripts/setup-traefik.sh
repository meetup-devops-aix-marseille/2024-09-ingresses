#!/bin/bash

set -euo pipefail

BASEDIR="$(dirname "$0")"

helm repo add traefik https://traefik.github.io/charts
helm repo update traefik

kubectl create namespace traefik || true

helm upgrade --install traefik traefik/traefik \
  --namespace traefik \
  -f "$BASEDIR/../values/traefik.yaml" \
  --version 27.0.2

echo "traefik installed"
exit 0
