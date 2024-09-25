#!/bin/bash

set -euo pipefail

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update prometheus-community

helm install prometheus-operator-crds prometheus-community/prometheus-operator-crds


echo "prometheus-operator-crds installed"
exit 0
