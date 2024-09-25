#!/bin/bash

set -euo pipefail

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.crds.yaml

helm repo add jetstack https://charts.jetstack.io
helm repo update jetstack

kubectl create namespace cert-manager || true

helm upgrade cert-manager jetstack/cert-manager \
  --install \
  --namespace cert-manager \
  --version v1.14.4

echo "cert-manager installed"
exit 0
