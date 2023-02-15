module "utilities" {
  source = "git@github.com:adolya/terraform-tools.git"
}

provider "aws" {
  default_tags {
    tags = merge({ 
      created = "{% now 'utc', '%Y-%m-%dT%H:%M:%SZ' %}" 
      project-name = "{{cookiecutter.__project_name}}-static-site"
      terraform-version = module.utilities.terraform_version
      cact-name = "base"
    })
  }
}