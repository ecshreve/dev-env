packer {
  required_plugins {
    docker = {
      version = " >= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu-base" {
  image  = "reg.slab.lan:5000/devbox-tools:packer"
  commit = true
  run_command = ["-d", "-i", "-t", "--", "{{.Image}}"]
}

build {
  name    = "devbox-dotfiles"
  sources = ["source.docker.ubuntu-base"]

  provisioner "ansible-local" {
    playbook_file = "./playbook.yml"
    extra_arguments = ["-vvvv"]
  }

  provisioner "shell" {
    inline = [
      "sudo -u eric curl -Lks https://raw.githubusercontent.com/ecshreve/figgy/main/install | sudo -u eric /bin/sh"
    ]
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "reg.slab.lan:5000/devbox-dotfiles"
      tags       = ["0.0.1", "packer", "latest"]
    }
    post-processor "docker-push" {}
  }
}
