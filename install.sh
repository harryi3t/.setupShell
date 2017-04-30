#!/bin/bash -e

sudo apt-get install zsh -y
rm -rf ~/.oh-my-zsh
rm ~/.zshrc-plugin || true

mkdir ~/.zsh || true
if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
fi

touch ~/.zshrc-plugin
echo "# Added automatically from script by harryi3t"             >> ~/.zshrc-plugin
echo ""                                                          >> ~/.zshrc-plugin
echo "plugins=(git z zsh-completions)"                           >> ~/.zshrc-plugin
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc-plugin
echo "source ~/.oh-my-zsh/plugins/z/z.sh"                        >> ~/.zshrc-plugin

# f: fail, s:silent, S:show error, L: follow redirect
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
