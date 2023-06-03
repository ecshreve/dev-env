# dev-env

## images

### base

ubuntu 22.04 with dev environment

### docker

base + docker installed

### hashi

base + docker + hashicorp tools installed

### tools

base + docker + hashicorp tools + other dev tools installed

### personal

base + docker + hashicorp tools + other dev tools + dotfiles installed


## devcontainer usage

example `.devcontainer.json`:
```json
{
	"name": "toolbox",
	"image": "ecshreve/devbox:tools",
	"features": {
		"ghcr.io/devcontainers/features/docker-outside-of-docker:1": {}
	},
	"customizations": {
		"vscode": {
			"extensions": [
				"golang.Go",
			]
		}
	},
	"runArgs": ["--hostname", "toolbox"],
}
```

or use the image with my dotfile configs already baked in:
```json
{
	"name": "toolbox",
	"image": "ecshreve/devbox",
	"features": {
		"ghcr.io/devcontainers/features/docker-outside-of-docker:1": {}
	},
	"runArgs": ["--hostname", "toolbox"],
	"remoteUser": "eric",
}
```