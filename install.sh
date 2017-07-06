#!/usr/bin/env bash

# run from this directory
cd "$(dirname "$0")"

# ensure we have latest
git pull origin master
git submodule update --recursive --remote

# run any platform specific scripts
case "$(uname)" in
  Darwin) ./macos.sh;;
  *) ;;
esac

# rsync files into place
rsync -aqh \
  --exclude ".git/" \
	--exclude ".DS_Store" \
  --exclude "Brewfile" \
  --exclude "LICENSE" \
  --exclude "README.md" \
  --exclude "*.sh" \
	--no-perms . ~

# fetch/run vim-plug
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim -u $HOME/.vimrc.bundles +PlugInstall +PlugClean! +qa

./reload.sh

# return from whence we came
cd ~-
