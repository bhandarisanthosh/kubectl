#!/bin/bash

trap 'exit' ERR

echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config

bash -c "kubectl $*"
