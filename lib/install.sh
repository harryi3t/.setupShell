#!/bin/bash -e

sudo apt-get install zsh -y
rm -rf ~/.oh-my-zsh
rm ~/.zshrc-plugin || true

mkdir ~/.zsh || true
if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
fi

curl -o ~/.zshrc-plugin https://raw.githubusercontent.com/harryi3t/.setupShell/master/.zshrc-plugin

# f: fail, s:silent, S:show error, L: follow redirect
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
