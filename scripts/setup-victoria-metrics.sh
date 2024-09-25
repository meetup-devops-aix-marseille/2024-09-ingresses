#!/bin/bash

set -euo pipefail

helm repo add vm https://victoriametrics.github.io/helm-charts/
helm repo update vm

kubectl create namespace monitoring || true

helm upgrade vm-stack vm/victoria-metrics-k8s-stack \
  --install \
  --namespace monitoring \
  -f ../values/vm-k8s-stack.yaml \
  --version 0.20.0

echo "vm-k8s-stack installed"
exit 0
