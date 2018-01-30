setopt no_global_rcs

export DOTFILES=~/.dotfiles

export VISUAL=vim
export EDITOR=$VISUAL

unset PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# platform specific environmentals
case "$(uname)" in
  Darwin) source ~/.zshenv.macos;;
  *) ;;
esac

# local
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
