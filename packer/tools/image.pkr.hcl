packer {
  required_plugins {
    docker = {
      version = " >= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "hashi-base" {
  image  = "reg.slab.lan:5000/devbox-hashi:packer"
  commit = true
  run_command = ["-d", "-i", "-t", "--", "{{.Image}}"]
}

build {
  name    = "devbox-tools"
  sources = ["source.docker.hashi-base"]

  provisioner "ansible-local" {
    playbook_file = "./playbook.yml"
    extra_arguments = ["-v"]
  }

  provisioner "shell" {
    script = "./go-tools.sh"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "reg.slab.lan:5000/devbox-tools"
      tags       = ["0.0.4", "packer", "latest"]
    }
    post-processor "docker-push" {}
  }
}
