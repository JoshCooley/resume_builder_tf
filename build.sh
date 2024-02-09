#! /usr/bin/env bash
set -o errexit

terraform init -input=false -lock=false
terraform apply -auto-approve -lock=false
echo
yarn install \
  --frozen-lockfile \
  --no-progress \
  --non-interactive
yarn run showdown makehtml \
  --config disableForced4SpacesIndentedSublists \
  --input resume.md \
  --output resume.html
echo
chromium \
  --headless \
  --disable-gpu \
  --no-pdf-header-footer \
  --print-to-pdf=resume.pdf resume.html
