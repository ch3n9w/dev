
export WORKSPACE=$HOME/.local/workspace
export CGO_ENABLED=1
export GOPATH=$HOME/Projects/go
export GOPROXY=https://goproxy.cn
export GO111MODULE=on
export XDG_CONFIG_HOME=$HOME/.config
# export https_proxy=http://127.0.0.1:7890
# export http_proxy=http://127.0.0.1:7890
# export ALL_PROXY="socks5://127.0.0.1:7891"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:/usr/lib:$GOPATH/bin:$JAVA_HOME/bin:$JRE_HOME/bin:$HOME/.local/bin

export LC_ALL="en_US.UTF-8"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# for tomcat debug
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export JRE_HOME=$JAVA_HOME/jre
export CATALINA_HOME=/home/ch4ser/work/apache-tomcat-8.5.89
export CLASSPATH=$HOME:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib:$CATALINA_HOME/lib
#
# export TERMCMD=alacritty
export TERMCMD=kitty

# let zsh-autosuggestions to work
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

