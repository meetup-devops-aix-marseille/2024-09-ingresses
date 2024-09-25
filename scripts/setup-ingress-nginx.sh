#!/bin/bash

set -euo pipefail

BASEDIR="$(dirname "$0")"


helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update ingress-nginx

kubectl create namespace ingress-nginx || true

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  -f "$BASEDIR/../values/ingress-nginx.yaml" \
  --version 4.10.0

echo "ingress-nginx installed"
exit 0
