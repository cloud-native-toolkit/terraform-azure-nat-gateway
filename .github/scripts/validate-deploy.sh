#!/usr/bin/env bash

ENABLED=$(cat .enabled)

if [[ "${ENABLED}" == "false" ]]; then
  echo "The NAT Gateway is not enabled."
fi

echo "Terraform state:"
terraform state list
