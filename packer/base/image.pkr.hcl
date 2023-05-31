packer {
  required_plugins {
    docker = {
      version = " >= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu-base" {
  image  = "ubuntu:22.04"
  commit = true
  run_command = ["-d", "-i", "-t", "--", "{{.Image}}"]
}

build {
  name    = "devbox-base"
  sources = ["source.docker.ubuntu-base"]

  provisioner "shell" {
    inline = [
      "apt-get update",
      "apt-get install -y python3 python3-pip",
      "python3 -m pip install ansible",
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "./playbook.yml"
    extra_arguments = ["-vvvv"]
  }

  provisioner "shell" {
    script = "setup.sh"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "reg.slab.lan:5000/devbox-base"
      tags       = ["0.0.1", "packer", "latest"]
    }
    post-processor "docker-push" {}
  }
}