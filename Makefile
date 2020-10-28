DOTFILES ?= ${HOME}/.dotfiles

stows =  git npm psql tig zsh

install-brew:
	@command -v brew > /dev/null 2>&1 || ruby -e $(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install")
	@brew tap Homebrew/bundle

brew: install-brew	
	@brew bundle --file="$(DOTFILES)/Brewfile"

vim: 
	stow vim
	@vim -u $(HOME)/.vim/plugins +PlugInstall +PlugClean! +qa

$(stows):
	stow $@

.PHONY: install-brew brew vim $(stows)
