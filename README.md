# dotfiles redux

## Installation

Clone this repository

```sh
git clone https://github.com/blahspam/dotfiles ~/.dotfiles
```

If starting from a fresh OSX install, you can run the corresponding setup script. This script will install homebrew, a number of applications, programming languages, and utilities, configure some "sane" operating system defaults, and install the dotfiles (hopefully?)

```sh
~/.dotfiles/setup/osx-setup.sh hostname
```

If you simply want to update your files, you can run [rcdn](https://thoughtbot.github.io/rcm/rcdn.1.html)/[rcup](https://thoughtbot.github.io/rcm/rcup.1.html)

```sh
cd ~/.dotfiles
rcdn -B host
RCRC="./rcrc" rcup -B host
```

## Credits

I've rehashed my dotfiles many times over the years... each time influenced by someone who did it better.

Some noteables include [jfred](https://github.com/jfred/dotfiles), [mnarrell](https://github.com/mnarrell/dotfiles), [holman](https://github.com/holman/dotfiles), and, most recently, the good folks over at [thoughtbot](https://github.com/thoughtbot/dotfiles/)
