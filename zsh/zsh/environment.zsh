export TERM=xterm-256color
export COLORTERM=truecolor
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:/usr/lib:$GOPATH/bin:$JAVA_HOME/bin:$JRE_HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin

export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim


# let zsh-autosuggestions work
export SAVEHIST=100000
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTFILE=$HOME/.zsh_history
# share history in different terminal
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
# This will make only alphanumeric characters count as words.
# better experience for ctrl+left/right
export WORDCHARS=''
export LS_COLORS='no=00;37:fi=00:di=00;34:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
