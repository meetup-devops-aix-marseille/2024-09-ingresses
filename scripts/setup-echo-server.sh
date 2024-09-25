#!/bin/bash

set -euo pipefail

BASEDIR="$(dirname "$0")"


helm repo add ealenn https://ealenn.github.io/charts
helm repo update ealenn

kubectl create namespace echo-server || true

helm upgrade --install echo-server ealenn/echo-server \
  --namespace echo-server \
  -f "$BASEDIR/../values/echo-server.yaml" \
  --version 0.5.0

echo "echo-server installed"
exit 0
