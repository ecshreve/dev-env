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

  provisioner "file" {
    content = "{\n\t\"insecure-registries\": [\n\t\t\"registry.slab.lan\",\n\t\t\"registry.slab.lan:5000\",\n\t\t\"reg.slab.lan\",\n\t\t\"reg.slab.lan:5000\"\n\t}\n}"
    destination = "/tmp/daemon.json"
  }

  provisioner "ansible-local" {
    playbook_file = "./playbook.yml"
    extra_arguments = ["-vvvv"]
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "reg.slab.lan:5000/devbox-docker"
      tags       = ["0.0.1", "packer"]
    }
    post-processor "docker-push" {}
  }
}
