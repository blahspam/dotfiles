#! /usr/bin/env bash

# install mandatory packages
sudo apt update -y -qq
sudo apt install -y -qq \
  apt-transport-https \
  ca-certificates \
  curl \
  fzf \
  gcc \
  git \
  gnupg2 \
  make \
  stow \
  zsh

# add helm repo
if [[ ! -f /etc/apt/sources.list.d/helm.list ]]; then
  curl -s https://baltocdn.com/helm/signing.asc | sudo apt-key add -
  echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm.list
fi

# add kubectl repo
if [[ ! -f /etc/apt/sources.list.d/kubernetes.list ]]; then
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
fi

# set login shell
sudo chsh -s /usr/bin/zsh
