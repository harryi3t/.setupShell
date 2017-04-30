#!/bin/bash -e

sudo apt-get install zsh -y
rm -rf ~/.oh-my-zsh

# f: fail, s:silent, S:show error, L: follow redirect
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "last 5 lines of zshrc files before"
cat ~/.zshrc | tail -5

echo ""                                                          >> ~/.zshrc
echo "# Added automatically from script by harryi3t"             >> ~/.zshrc
echo "plugins=(git z zsh-completions)"                           >> ~/.zshrc
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source ~/.oh-my-zsh/plugins/z/z.sh"                        >> ~/.zshrc

echo "last 5 lines of zshrc files after"
cat ~/.zshrc | tail -5

source ~/.zshrc
