#! /usr/bin/env bash

# Prerequisites: make, gcc, git

# extra sources
sudo apt-get install -y -q \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# source: docker
if [[ ! -f /etc/apt/sources.list.d/docker.list ]]; then
  curl -s https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  echo "deb https://download.docker.com/linux/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/docker.list
fi

# source: helm
if [[ ! -f /etc/apt/sources.list.d/helm.list ]]; then
  curl -s https://baltocdn.com/helm/signing.asc | sudo apt-key add -
  echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm.list
fi

# source: jetbrains (unofficial)
if [[ ! -f /etc/apt/sources.list.d/jetbrains-ppa.list ]]; then
  curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | sudo apt-key add -
  echo "deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com bionic main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list 
fi

# source: kubectl
if [[ ! -f /etc/apt/sources.list.d/kubernetes.list ]]; then
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
fi

# install packages
sudo apt-get update -y -qq && 
  apt-get upgrade -y -qq && 
  apt-get install -y -q \
    apt-transport-https \
    awscli \
    docker-ce \
    fonts-cascadia-code \
    fzf \
    gnupg2 \
    goland \
    golang \
    helm \
    httpie \
    jq \
    kubectl \
    mercurial \
    neovim \
    nodejs \
    npm \
    pandoc \
    postgis \
    postgresql \
    python \
    scala \
    stow \
    tig \
    yarn \
    zsh    

# install antibody 
if [[ ! -x /usr/local/bin/antibody ]]; then 
  curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
fi
