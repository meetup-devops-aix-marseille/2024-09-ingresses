#!/bin/bash

set -euo pipefail

BASEDIR="$(dirname "$0")"


helm repo add apisix https://charts.apiseven.com
helm repo update apisix

kubectl create namespace ingress-apisix || true

helm upgrade --install apisix apisix/apisix \
  --namespace ingress-apisix \
  -f "$BASEDIR/../values/apisix.yaml" \
  --version 2.9.0

echo "apisix installed"
exit 0
