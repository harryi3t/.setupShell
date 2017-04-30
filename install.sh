#!/bin/bash -e

sudo apt-get install zsh -y

# f: fail, s:silent, S: show error, L: follow redirect
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
