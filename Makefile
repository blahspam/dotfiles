# use bash for brace expansions
SHELL := bash

# set default xdg dirs if not set
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_CACHE_HOME ?= $(HOME)/.cache
XDG_DATA_HOME ?= $(HOME)/.local/share

# simple stowable modules
modules :=  git npm pg tig
uname := $(shell uname)

# run everything
all: apt brew nvim zsh $(modules)

# initialize dirs if necessary
init-dirs:
	@mkdir -pv $(HOME)/Develop"
	@mkdir -pv "$(XDG_CONFIG_HOME)"
	@mkdir -pv "$(XDG_CACHE_HOME)"
	@mkdir -pv "$(XDG_DATA_HOME)"

# initialize apt 
init-apt:
ifeq ($(uname), Linux)
	@$(CURDIR)/apt/init.sh
endif

# initialize homebrew  
init-homebrew: 
ifeq ($(uname), Darwin) 
	@command -v brew > /dev/null 2>&1 || ruby -e $(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/master/install")
	@brew tap Homebrew/bundle
endif

# update linux packages 
apt: init-apt
ifeq ($(uname), Linux) 
	@sudo apt update -y --q
	@sudo apt install $(grep -vE "^\s*#" filename  | tr "\n" " ")
endif

# update macos packages 
brew: init-homebrew
ifeq ($(uname), Darwin) 
	@brew update
	@brew bundle --no-lock --file="./homebrew/Brewfile" 
endif

# stow neovim & install plugins
nvim: init-dirs
	@mkdir -pv "$(XDG_CACHE_HOME)/nvim"
	@mkdir -pv "$(XDG_DATA_HOME)/nvim/"{backup,swap,undo}
	@stow -v --target=${HOME} nvim
	@nvim +PlugInstall +qall!

# stow zsh
zsh: init-dirs
	@mkdir -pv "$(XDG_CACHE_HOME)/"{zsh,less}
	@mkdir -pv "$(XDG_DATA_HOME)/"{zsh,less}
	@stow --v --target=${HOME} zsh

# stow "simple" modules
$(modules): init-dirs
	@mkdir -pv "$(XDG_DATA_HOME)/$@"
	@mkdir -pv "$(XDG_CACHE_HOME)/$@"
	@stow --v --target=${HOME} $@



.PHONY: all apt brew nvim zsh $(modules)
