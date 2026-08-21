#!/bin/bash

# stop if any command fails.
set -e

# find the project folder from this script's location.
# this works even when the script is run from another directory.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# running total of resources reported by kubectl.
total_deployed=0

printf '\n\033[1;36mDeploying dashboard application:\033[0m\n'
printf '  1. app-deploy.yaml\n'
printf '  2. app-service.yaml\n'

printf '\n========== Applying manifests...\n\n'
# apply every Kubernetes resource in the k8s folder.
printf 'Applying Kubernetes resources...\n'
apply_output=$(kubectl apply -f "$SCRIPT_DIR/../k8s/")
printf '%s\n' "$apply_output"

# count created, configured, and unchanged resources.
applied_count=$(printf '%s\n' "$apply_output" | awk '$NF ~ /^(created|configured|unchanged)$/ { count++ } END { print count + 0 }')
total_deployed=$((total_deployed + applied_count))

printf '\n========== Deployment status:\n\n'
# show the current state after deployment.
kubectl get pods -A
printf '\n========== Service status:\n\n'
kubectl get services -A
printf '\n\033[1;36mDeployment complete.\033[0m\n'
printf 'Total resources applied: %d\n' "$total_deployed"

echo