# Cloud as Code Templates

[![Terraform](https://img.shields.io/badge/Terraform-1.3.7-green)](https://www.terraform.io/)
[![Terraform](https://img.shields.io/badge/Cookiecutter-2.1.1-green)](https://www.terraform.io/)

## Pre-requisites
Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)<br>
Install [Cookiecutter](https://cookiecutter.readthedocs.io/en/stable/installation.html)<br>
Install [Terraform](https://developer.hashicorp.com/terraform/downloads)<br>
Create [Git Repository](https://github.com/new)<br>
Create an account in [AWS console](https://aws.amazon.com/)<br>
Under account name in AWS console go to security credentials and create access key for root user<br>

## Generate
```console
cookiecutter git@github.com:adolya/cact-template-base.git
```
Confirm to switch local state to S3 for further automation

Open terraform.tfstate and search for   
```console
"outputs": {
    "base_info": {
```

## Create secrets in your repository settings:
AWS_ACCESS_KEY_ID <br>
with value from tfstate output: github_AWS_ACCESS_KEY_ID<br>
AWS_SECRET_ACCESS_KEY<br>
with value from tfstate output: github_AWS_SECRET_ACCESS_KEY<br>
## To access AWS console use:
admin_user with admin_user_password

# IMPORTANT
After account infrastructure defined as code. Go to AWS console security credentials and deactivate/delete access key we used at the begining<br>
Also enable Two Factor Authentication for your root account. And use the admin_user, for your future needs.
