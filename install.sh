#!/bin/bash -e

sudo apt-get install zsh -y

# f: fail, s:silent, L: follow redirect
sh -c "$(curl -fsL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
