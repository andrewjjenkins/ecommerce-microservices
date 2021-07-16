#!/bin/bash

set -euo pipefail

kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  labels:
    istio-injection: enabled
  name: ecommerce
EOF

kubectl apply -f stripe-secret.yaml
kubectl apply -f rabbitmq.yaml
kubectl apply -f payment-history.yaml
kubectl apply -f payment-service.yaml
kubectl apply -f order-service.yaml
kubectl apply -f catalog-service.yaml
kubectl apply -f catalog-ui.yaml
kubectl apply -f catalog-ui-gateway.yaml

exit 0
