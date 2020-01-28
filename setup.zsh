#!/usr/bin/env zsh

if [ ! -d ~/.fzf ]; then
  git clone https://github.com/junegunn/fzf.git ~/.fzf
  yes n | ~/.fzf/install
fi

if [ ! `whence hstr` ]; then
  sudo add-apt-repository -y ppa:ultradvorka/ppa
  sudo apt update
  sudo apt install hstr
  hstr --show-configuration >> ~/.zshrc
fi

cd ~/.dotfiles/stow
for s in *; do stow -t ~ $s; done

mkdir -p ~/.psql_history

vi +PlugInstall +qall
