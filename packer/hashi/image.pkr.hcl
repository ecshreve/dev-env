packer {
  required_plugins {
    docker = {
      version = " >= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "docker-base" {
  image  = "reg.slab.lan:5000/devbox-docker:packer"
  commit = true
  run_command = ["-d", "-i", "-t", "--", "{{.Image}}"]
}

build {
  name    = "devbox-hashi"
  sources = ["source.docker.docker-base"]

  provisioner "ansible-local" {
    playbook_file = "./playbook.yml"
    extra_arguments = ["-v"]
    galaxy_file = "./requirements.yml"
    galaxy_roles_path = "./roles"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "reg.slab.lan:5000/devbox-hashi"
      tags       = ["0.0.3", "packer", "latest"]
    }
    post-processor "docker-push" {}
  }
}
