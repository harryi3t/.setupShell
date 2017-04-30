#!/bin/bash

sudo apt-get install zsh -y
rm -rf ~/.oh-my-zsh

# f: fail, s:silent, L: follow redirect
sh -c "$(curl -fsL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo ""                                                          >> ~/.zshrc
echo "# Added automatically from script by harryi3t"             >> ~/.zshrc
echo "plugins=(git z zsh-completions)"                           >> ~/.zshrc
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source ~/.oh-my-zsh/plugins/z/z.sh"                        >> ~/.zshrc

source ~/.zshrc
