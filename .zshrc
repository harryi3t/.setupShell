# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh
plugins=(git z zsh-completions)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.setupShell/main.sh
source ~/.oh-my-zsh/plugins/z/z.sh

export NVM_DIR="/home/harry/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export LC_ALL=en_US.UTF-8
