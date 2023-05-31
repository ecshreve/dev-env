packer {
  required_plugins {
    docker = {
      version = " >= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu-base" {
  image  = "reg.slab.lan:5000/devbox-hashi:packer"
  commit = true
  run_command = ["-d", "-i", "-t", "--", "{{.Image}}"]
}

build {
  name    = "devbox-tools"
  sources = ["source.docker.ubuntu-base"]

  provisioner "ansible-local" {
    playbook_file = "./playbook.yml"
    extra_arguments = ["-vvvv"]
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "reg.slab.lan:5000/devbox-tools"
      tags       = ["0.0.1", "packer", "latest"]
    }
    post-processor "docker-push" {}
  }
}
