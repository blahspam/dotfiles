#!/usr/bin/env bash

cd "$(dirname "$0")";

# Install Homebrew if necessary
if [ ! hash brew 2>/dev/null ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew update
brew tap Homebrew/bundle
brew bundle
brew upgrade
brew cleanup

# change shell to brewed zsh if we havent already
declare -r zsh_bin="`brew --prefix`/bin/zsh"
if [ -n "${zsh_bin}" ]; then
  if [ -z "$(cat /etc/shells | grep $zsh_bin)" ]; then
    echo $zsh_bin | sudo tee -a /etc/shells
    chsh -s $zsh_bin
  fi
fi

# link private ssh config from Dropbox
ln -sf ~/Dropbox/System/ssh-config ~/.ssh/config

# Preferences
# Global:
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock expose-animation-duration -float 0.12
# Disk Images
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# Finder:
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Mail
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
# Print
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Safari
defaults write com.apple.Safari IncludeDebugMenu -bool true
# Screen Capture
defaults write com.apple.screencapture disable-shadow -bool true
# Other things
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
chflags nohidden ~/Library

# kill / restart apps
echo "Changed defaults. Restarting apps…"
for app in Safari Finder Dock Mail; do killall "$app"; done
echo "Restarted apps. All done."

cd -
