#!/bin/bash -e

sudo apt-get install zsh -y
rm -rf ~/.oh-my-zsh

touch ~/.zshrc-plugin
echo ""                                                          >> ~/.zshrc-plugin
echo "# Added automatically from script by harryi3t"             >> ~/.zshrc-plugin
echo "plugins=(git z zsh-completions)"                           >> ~/.zshrc-plugin
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc-plugin
echo "source ~/.oh-my-zsh/plugins/z/z.sh"                        >> ~/.zshrc-plugin

# f: fail, s:silent, S:show error, L: follow redirect
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
