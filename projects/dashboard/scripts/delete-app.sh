#!/bin/bash

# stop if any command fails.
set -e

# find the project folder from this script's location.
# this works even when the script is run from another directory.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# running total of resources handled by kubectl.
total_deleted=0

printf '\n\033[1;36mDeleting dashboard application:\033[0m\n'
printf '  1. app-deploy.yaml\n'
printf '  2. app-service.yaml\n'

printf '\n========== Deleting manifests...\n\n'
# delete every Kubernetes resource in the k8s folder.
# missing resources are ignored so cleanup can continue.
printf 'Deleting Kubernetes resources...\n'
delete_output=$(kubectl delete \
  --ignore-not-found=true \
  -f "$SCRIPT_DIR/../k8s/")

printf '%s\n' "$delete_output"
# count only resources that kubectl actually deleted.
deleted_count=$(printf '%s\n' "$delete_output" | awk '$NF == "deleted" { count++ } END { print count + 0 }')
total_deleted=$((total_deleted + deleted_count))

# show what is still running after cleanup.
printf '\n========== Checking remaining Pods...\n\n'
kubectl get pods -A
printf '\n========== Checking remaining Services...\n\n'
kubectl get services -A
printf '\n==========\033[1;36m Destroy complete.\033[0m\n'
printf 'Total destroyed: %d\n' "$total_deleted"

echo