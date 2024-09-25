#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOTDIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

NAME="${1:-ingressss-notls-10}"
VALUES_FILE="${2:-${ROOTDIR}/values/_no-tls.yaml}"
START="${3:-0}"
NUMBER="${4:-10}"

MANIFESTS_DIR="${ROOTDIR}/manifests/${NAME}"

mkdir -p "${MANIFESTS_DIR}"

helm template "${NAME}" "${ROOTDIR}/helm/ingressss" -f "${VALUES_FILE}" \
  -n echo-server \
  --set ingress.start=${START} \
  --set ingress.number=${NUMBER} > "${MANIFESTS_DIR}/${START}-${NUMBER}.yaml"

exit 0
