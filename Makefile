uname := $(shell uname)

packages: 
ifeq ($(uname), Darwin)
	@command -v brew > /dev/null 2>&1 || ruby -e $(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install")
	@brew tap Homebrew/bundle
	@brew bundle
else ifeq ($(uname), Debian)
	@xargs -a packages apt install -y
endif

vim: 
	stow vim
	@vim -u $(HOME)/.vim/plugins +PlugInstall +PlugClean! +qa

zsh: 
	stow zsh

all: packages 
	stow npm
	stow git
	stow zsh

.PHONY: packages vim zsh all
