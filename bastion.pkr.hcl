packer {
  required_plugins {
    amazon = {
      version = ">= 1.3.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "generic_bastion" {
  ami_name              = "diso-devops/bastion/ubuntu-jammy-22.04-amd64-server-generic"
  force_deregister      = true
  force_delete_snapshot = true
  tags = {
    Name        = "diso-devops/bastion/ubuntu-jammy-22.04-amd64-server-generic-{{ timestamp }}"
  }
  ami_users = [
    "037161842252",
    "068084030754",
    "473630360727"
  ]
  run_tags = {
    Name = "packer-bastion-builder"
    deploy_to_all_environments = var.deploy_to_all_environments
  }
  instance_type = "t3.micro"
  region        = "eu-west-2"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  sources = [
    "source.amazon-ebs.generic_bastion"
  ]
  provisioner "shell" {
    scripts = ["bootstrap.sh"]
  }
}
