module "utilities" {
  source = "git@github.com:adolya/terraform-tools.git"
}

provider "aws" {
  default_tags {
    tags = merge({ 
      CreatedDate = "{% now 'utc', '%Y-%m-%dT%H:%M:%SZ' %}" 
      ProjectName = "{{cookiecutter.__project_name}}-base"
      TerraformVersion = module.utilities.terraform_version 
    })
  }
}