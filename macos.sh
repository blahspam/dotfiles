#!/usr/bin/env bash

cd "$(dirname "$0")";

# Install Homebrew if necessary
if ! type brew > /dev/null; then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew tap Homebrew/bundle
brew bundle
brew upgrade
brew cleanup 

# set shell to zsh
declare -r zsh_bin="`brew --prefix`/bin/zsh"
if [ -n "${zsh_bin}" ]; then
  if [ -z "$(cat /etc/shells | grep $zsh_bin)" ]; then
    echo $zsh_bin | sudo tee -a /etc/shells
    chsh -s $zsh_bin
  fi
fi

# install kubectls
for kube_ver in '1.8.3', '1.11.3'
do
  kube_dir="/usr/local/opt/kubectl@$kube_ver"
  if [ ! -d $kube_dir ]; then
    mkdir -p $kube_dir && \
    cd $kube_dir && \
    curl -O https://storage.googleapis.com/kubernetes-release/release/v$kube_ver/bin/darwin/amd64/kubectl && \
    chmod +x kubectl && \
    ln -sf $kube_dir/kubectl /usr/local/bin/kubectl-$kube_ver && \
    cd -
  fi
done

# install helm
helm_ver='2.11.0'
helm_dir="/usr/local/opt/helm@$helm_ver/darwin-amd64/"
if [ ! -d $helm_dir ]; then
  mkdir -p $helm_dir/ && \
  cd $helm_dir && \
  curl -O https://storage.googleapis.com/kubernetes-helm/helm-v$helm_ver-darwin-amd64.tar.gz && \
  tar -xzf helm-v$helm_ver-darwin-amd64.tar.gz && \
  chmod +x darwin-amd64/helm && \
  ln -sf $helm_dir/darwin-amd64/helm /usr/local/bin/helm && \
  cd -
fi

# link private ssh config from Dropbox
ln -sf ~/Dropbox/System/ssh-config ~/.ssh/config

# Preferences
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock expose-animation-duration -float 0.12

defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

defaults write com.apple.Safari IncludeDebugMenu -bool true

defaults write com.apple.screencapture disable-shadow -bool true

sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

chflags nohidden ~/Library

# kill / restart apps
#echo "Changed defaults. Killing apps…"
#for app in Dock Finder Mail Safari; do killall "$app" &>/dev/null; done

cd ~-
