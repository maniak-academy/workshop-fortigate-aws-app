terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.18.0"
    }
  }
}

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "appfgs3-mh7s-terraform-state"
    key            = "appfgs3-mh7s-terraform-state"
    region         = "eu-west-1"
    dynamodb_table = "appfgs3-mh7s-terraform-state-lock-dynamo"
  }
}

data "terraform_remote_state" "infrastructure" {
  backend = "s3"
  config = {
    bucket = "fgs3-pa97-terraform-state"
    key    = "fgs3-pa97-terraform-state"
    region = "eu-west-1"
  }
}


provider "aws" {
  region = "eu-west-1"
}

provider "fortios" {
  hostname = data.terraform_remote_state.infrastructure.outputs.FGTPublicIP
  token    = var.fortios_token
  insecure = true
}