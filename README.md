# dev-env

## images

### base

ubuntu 22.04 with minimal system and user configuration

### devbox

base + development tools and configuration from dotfiles repo

## usage

example `.devcontainer.json`:
```json
{
	"name": "devbox",
	"image": "registry.slab.lan:5000/devenv:devbox",
	"features": {
		"ghcr.io/devcontainers/features/docker-outside-of-docker:1": {}
	},
	"runArgs": ["--hostname", "devbox"],
	"remoteUser": "eric"
}
```