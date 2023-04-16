remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "pt-stage-terraform-state"

    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}


terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

#    arguments = [
#      "-var-file=../../account.tfvars"
#    ]
#  }
#}

    optional_var_files = [
      "${find_in_parent_folders("account.tfvars", "skip-account-if-does-not-exist")}",
      "${find_in_parent_folders("tenant.tfvars", "skip-tenant-if-does-not-exist")}",
    ]
  }
}