terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }
    aws = {
      source = "hashicorp/aws"
    }
    namecheap = {
      source = "namecheap/namecheap"
      version = ">= 2.0.0"
    }
  }
  required_version = ">= 0.13"
}

provider "aws" {
   region = var.region
}

data "http" "externalip" {
  url = "http://ipv4.icanhazip.com"
}

provider "namecheap" {
  user_name = var.namecheap.username
  api_user = var.namecheap.username
  api_key = var.namecheap.apikey
  client_ip = chomp(data.http.externalip.body)
  use_sandbox = false
}
