export DOTFILES=~/.dotfiles

export VISUAL=vim
export EDITOR=$VISUAL

export PATH="/~bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

# platform specific environmentals
case "$(uname)" in
  Darwin) source ~/.zshenv.macos;;
  *) ;;
esac

# local
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
