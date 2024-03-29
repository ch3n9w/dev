# Personal Development Toolkit 📡

This repo contains my configuration of kitty, tmux, lf, zsh, todotxt-cli and neovim.

## Try

You can try my configuration in docker container.

```bash
git clone https://github.com/ch3n9w/dev
cd dev
docker build . -t dev:latest
docker run -it dev /bin/zsh
```
## Install

```bash
git clone https://github.com/ch3n9w/dev
cd dev
# install dependency software and install configuration
./scripts/install-software.sh
# install fonts
./scripts/install-font.sh
```

Alternatively (if you dont want to install all of them), you can copy the configuration directory you like to XDG_CONFIG_HOME, for example:

```
nvim -> ~/.config/nvim
kitty -> ~/.config/kitty
tmux -> ~/.config/tmux
lf -> ~/.config/lf
todo -> ~/.config/todo
zsh/zsh -> ~/.config/zsh
zsh/zshrc -> ~/.zshrc
```

## Uninstall

```bash
./scripts/uninstall.sh
```

## Noteable Info

### Kitty

1. use Firacode Nerd Font and Victor Mono Nerd Font, use LXGW WenKai for Chinese characters.

### Tmux

1. commonly used keys are set as shortcuts that dont require prefix key, which can still be used though
2. Ctrl-hjkl and Ctrl-q can be used both in tmux and vim for window operations.
3. use tmux-continuum and resurrect to restore workspaces.
4. If you get dizzy remembering shortcuts, just use your mouse.

### Zsh

1. customize powerlevel10k for a more compact look, check `zsh/zsh/theme.zsh`
2. settings about software are in `zsh/zsh/plugins`, you can add here by yourself
3. disable vim mode for consistence.

### Neovim

1. most keybindings are in `nvim/lua/keymap/init.lua`, others are in plugins' file.
2. disgard f/F t/T inline search and only use global search enhanced by flash.nvim.
3. the completion behavior simulate vscode's, which is more intuitive:)

### lf

1. integrate with fzf, you can press `f` to fuzzy search files and directories from pwd
2. since lf use `rifle` to open file in my config, ranger is still needed.

## Other

1. Highly recommended to install key, it's a great tool to remap capslock to esc and ctrl, see [keyd](https://github.com/rvaiya/keyd)
2. Some software should be manually installed if you are using debian.

## Trouble Shooting

1. If you have installed xsel and use my configuration under wayland, you may encounter clipboard problem, in which neovim use `xsel` as clipboard provider instead of `wl-copy`, to solve the problem, just uninstall `xsel`.
