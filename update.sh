rsync -av --delete ~/.config/tmux/ ./tmux/
rsync -av --delete ~/.config/zellij/ ./zellij/
rsync -av --delete ~/.config/nvim/ ./nvim/
rsync -av --delete ~/.config/alacritty/ ./alacritty/
rsync -av --delete ~/.config/kitty/ ./kitty/
rsync -av --delete ~/.config/zsh/ ./zsh/
rsync -a ~/.zshrc ./zshrc

yes | rm -r tmux/plugins/*
yes | rm -r zsh/plugins/*

