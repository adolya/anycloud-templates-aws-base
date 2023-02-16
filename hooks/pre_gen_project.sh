#!/usr/bin/env sh

echo '**** Welcome to Cloud as Code Templates ****'
terraform --version


set -u # or set -o nounset
: "$AWS_REGION"
: "$AWS_ACCESS_KEY_ID"
: "$AWS_SECRET_ACCESS_KEY"
