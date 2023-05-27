#!/bin/sh

set -e

DEBIAN_FRONTEND=noninteractive

echo Cloning dotfiles
git clone --bare https://github.com/ecshreve/figgy.git "$HOME/.cfg"
git --git-dir="$HOME/.cfg/" --work-tree="$HOME" checkout
git --git-dir="$HOME/.cfg/" --work-tree="$HOME" pull --force

echo Running fish setup
fish -c 'setup'

sudo usermod -s /usr/bin/fish eric
