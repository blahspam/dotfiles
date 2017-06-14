#!/usr/bin/env bash

# run from this directory
cd "$(dirname "$0")"

# ensure we have latest
git pull origin master
git submodule update --recursive --remote

# run any os specific scripts
case "$(uname)" in
  Darwin) ./macos/up.sh;;
  *) ;;
esac

echo "meh"
# rsync files into place
rsync -aqh \
  --exclude ".git/" \
  --exclude "macos/" \
	--exclude ".DS_Store" \
  --exclude "LICENSE" \
  --exclude "README.md" \
  --exclude "reload.sh" \
	--exclude "install.sh" \
	--no-perms . ~

echo "feh"

# fetch/run vim-plug
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim -u $HOME/.vimrc.bundles +PlugInstall +PlugClean! +qa

./reload.sh

# return from whence we came
cd -
