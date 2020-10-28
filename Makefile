uname := $(shell uname)

default: all

packages: 
ifeq ($(uname), Darwin)
	@command -v brew > /dev/null 2>&1 || ruby -e $(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install")
	@brew tap Homebrew/bundle
	@brew bundle
else ifneq (,$(wildcard /etc/lsb-release))
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
	echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
	@xargs -a packages apt install -y
else 
	@xargs -a packages yum install -y
endif

vim: 
	stow vim
	@vim -u $(HOME)/.vim/plugins +PlugInstall

zsh:
	stow zsh

all: packages vim zsh
	stow git 
	stow npm
	stow psql
	stow tig	
	stow zsh -v 

.PHONY: packages vim zsh all
