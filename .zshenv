setopt no_global_rcs
export DOTFILES=~/.dotfiles

export VISUAL=vim
export EDITOR=$VISUAL

export PATH="/~bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# platform specific
case "$(uname)" in
  Darwin) source ~/.zshenv.macos;;
  *) ;;
esac

# local
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
