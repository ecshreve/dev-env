packer {
  required_plugins {
    docker = {
      version = " >= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu-base" {
  image  = "reg.slab.lan:5000/devbox-base:packer"
  commit = true
  run_command = ["-d", "-i", "-t", "--", "{{.Image}}"]
}

build {
  name    = "devbox-docker"
  sources = ["source.docker.ubuntu-base"]

  provisioner "ansible-local" {
    playbook_file = "./playbook.yml"
    extra_arguments = ["-vvvv"]
    galaxy_file = "./requirements.yml"
    galaxy_roles_path = "./roles"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "reg.slab.lan:5000/devbox-docker"
      tags       = ["0.0.3", "packer", "latest"]
    }
    post-processor "docker-push" {}
  }
}
