#!/usr/bin/env sh
set -e

export AWS_REGION="{{ cookiecutter.AWS_REGION }}"
echo "**** main region - $AWS_REGION"
export AWS_ACCESS_KEY_ID="{{ cookiecutter.AWS_ACCESS_KEY_ID }}"
echo "**** Using $AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="{{ cookiecutter.AWS_SECRET_ACCESS_KEY }}"
terraform init
terraform apply --auto-approve
mv main_tf main.tf
terraform init
echo '**** Commiting code to repository: {{ cookiecutter.app_git_repo }})
git init
git add .
git commit -m "initial commit"
git remote add origin {{ cookiecutter.app_git_repo }}
git push -u origin master