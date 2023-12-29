#!/bin/bash

if sudo -n true 2>/dev/null; then
    echo "User can run sudo commands, check passed."
else
    echo "User cannot run sudo commands."
    exit 1
fi

if [ -f /etc/debian_version ]; then
  echo "Detect Debian based system, installing packages with apt..."
  sudo apt update
  sudo apt install -y tmux zsh ranger kitty rsync htop bat fzf python3 unzip fd-find lsd wget ripgrep neovim zathura
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
  sudo ln -s /usr/bin/batcat /usr/bin/bat
  sudo ln -s /usr/bin/fdfind /usr/bin/fd
  sudo ln -s /usr/bin/python3 /usr/bin/python
  echo "Please install glow manually if you want, check https://github.com/charmbracelet/glow?tab=readme-ov-file#installation."
fi

if [ -f /etc/arch-release ]; then
  echo "Detect Arch based system, installing packages with pacman..."
  sudo pacman -S --needed --noconfirm tmux zsh ranger kitty rsync htop bat python fzf unzip zoxide lsd fd wget ripgrep neovim glow zathura
fi

git submodule init
git submodule update

BASEDIR=~/.config
read -p "Do you want to overwrite or backup the configuration file? (o/b): " response

if [ "$response" == "o" ]; then
    echo "Overwriting the configuration file..."
    yes | rm -r $BASEDIR/tmux
    yes | rm -r $BASEDIR/zsh
    yes | rm -r $BASEDIR/ranger
    yes | rm -r $BASEDIR/nvim
    cp -r ./tmux $BASEDIR/
    cp -r ./zsh/zsh $BASEDIR/
    cp -r ./zsh/zshrc ~/.zshrc
    cp -r ./ranger $BASEDIR/
    cp -r ./nvim $BASEDIR/
elif [ "$response" == "b" ]; then
    echo "Backup the configuration file..."
    mv $BASEDIR/tmux $BASEDIR/tmux_bak
    mv $BASEDIR/zsh $BASEDIR/zsh_bak
    mv ~/.zshrc ~/.zshrc_bak
    mv $BASEDIR/ranger $BASEDIR/ranger_bak
    mv $BASEDIR/nvim $BASEDIR/nvim_bak
    cp -r ./tmux $BASEDIR/
    cp -r ./zsh/zsh $BASEDIR/
    cp -r ./zsh/zshrc ~/.zshrc
    cp -r ./ranger $BASEDIR/
    cp -r ./nvim $BASEDIR/
else
    echo "Invalid response. Please enter 'o' or 'b'."
    exit 1
fi