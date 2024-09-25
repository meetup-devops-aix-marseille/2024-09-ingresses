#!/bin/bash

set -euo pipefail

kubectl create namespace monitoring || true


helm repo add ovh-mks-exporter https://rverchere.github.io/ovh-mks-exporter
helm repo update ovh-mks-exporter

helm upgrade ovh-mks-exporter ovh-mks-exporter/ovh-mks-exporter \
  --install \
  --namespace monitoring \
  --version 1.0.1

echo "cert-manager installed"
exit 0
