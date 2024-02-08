#! /usr/bin/env bash
set -o errexit

terraform init -input=false -lock=false
terraform apply -auto-approve -lock=false

yarn install --frozen-lockfile --no-progress --non-interactive
yarn run showdown makehtml --input resume.md --output resume.html
