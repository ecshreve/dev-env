# dev-env

## images

### base

ubuntu 22.04 with minimal configuration

### docker

base + docker installed

### hashi

base + docker + hashicorp tools installed

### tools

base + docker + hashicorp tools + other dev tools installed

### dotfiles

base + docker + hashicorp tools + other dev tools + dotfiles installed


## devcontainer usage

example `.devcontainer.json`:
```json
{
	"name": "dotbox",
	"image": "reg.slab.lan:5000/devbox-dotfiles:packer",
	"features": {
		"ghcr.io/devcontainers/features/docker-outside-of-docker:1": {}
	},
	"runArgs": ["--hostname", "dotbox"],
	"remoteUser": "eric"
}
```