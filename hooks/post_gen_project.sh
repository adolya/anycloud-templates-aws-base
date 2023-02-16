#!/usr/bin/env sh
set -e

echo '**** Preparing Terraform **** '
export AWS_REGION="{{ cookiecutter.AWS_REGION }}"
export AWS_ACCESS_KEY_ID="{{ cookiecutter.AWS_ACCESS_KEY_ID }}"
export AWS_SECRET_ACCESS_KEY="{{ cookiecutter.AWS_SECRET_ACCESS_KEY }}"
terraform init
terraform apply --auto-approve
mv backend_tf backend.tf
terraform init -force-copy
echo '**** Commiting code to repository: {{ cookiecutter.app_git_repo }}) ****'
git init
git add .
git commit -m "initial commit"
git remote add origin {{ cookiecutter.app_git_repo }}
git push -u origin master
terraform output -json
