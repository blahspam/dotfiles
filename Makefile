DOTFILES ?= ${HOME}/.dotfiles
XDG_CONFIG_HOME := ${HOME}/.config
XDG_CACHE_HOME := ${HOME}/.cache
XDG_DATA_HOME := ${HOME}/.local/share

modules :=  git npm pg tig

# install homebrew
prepare-brew:
	@command -v brew > /dev/null 2>&1 || ruby -e $(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install")
	@brew tap Homebrew/bundle

# ensure base XDG dirs exist
prepare-xdg:
	@mkdir -pv "${XDG_CONFIG_HOME}"
	@mkdir -pv "${XDG_CACHE_HOME}"
	@mkdir -pv "${XDG_DATA_HOME}"


# update/upgrade brew bundle
brew: install-brew
	@brew update
	@brew upgrade
	@brew bundle --file="$(DOTFILES)/Brewfile"

nvim: prepare-xdg
	@mkdir -pv "${XDG_CACHE_HOME}/$@"
	@mkdir -pv "${XDG_DATA_HOME}/nvim/"{backup,swap,undo}
	@nvim +PlugInstall +qall!
	@stow -v $@

zsh: prepare-xdg
	@mkdir -p "${XDG_CACHE_HOME}/zsh"
	@mkdir -p "${XDG_DATA_HOME}/zsh"
	@mkdir -p "${XDG_CACHE_HOME}/less"
	@mkdir -p "${XDG_DATA_HOME}/less"
	@stow zsh

$(modules): prepare-xdg
	@mkdir -pv "${XDG_DATA_HOME}/$@"
	@mkdir -pv "${XDG_CACHE_HOME}/$@"
	stow $@

.PHONY: prepare-brew prepare-xdg brew nvim zsh $(modules)
