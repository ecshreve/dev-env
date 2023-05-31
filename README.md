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
	"name": "toolbox",
	"image": "reg.slab.lan:5000/devbox-dotfiles:packer",
	"features": {
		"ghcr.io/devcontainers/features/docker-outside-of-docker:1": {}
	},
	"customizations": {
		"vscode": {
			"extensions": [
				"golang.Go",
				"redhat.ansible",
				"GitHub.copilot",
				"hashicorp.hcl",
				"hashicorp.terraform",
				"mutantdino.resourcemonitor",
				"Gruntfuggly.todo-tree",
				"esbenp.prettier-vscode"
			]
		}
	},
	"runArgs": ["--hostname", "toolbox"],
	"remoteUser": "eric"
}
```