# setupShell
includes the basic alias and settings I need after installing a new Linux machine

# Basic Installation

### This will install zsh and oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/harryi3t/.setupShell/master/install.sh)"
```

### This will source the plugins into your zshrc file
```bash
echo "source ~/.zshrc-plugin" >> ~/.zshrc
source ~/.zshrc
```


### To modify the autocompletion color refer the chart below
Choose a color number __XXX__ from the chart and run
```bash
UPDATE_HIGHLIGHT_COLOR XXX
```
![bash-colors](https://i.stack.imgur.com/e63et.png)
