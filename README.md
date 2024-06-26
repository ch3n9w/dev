# Personal Development Toolkit 📡

This repo contains my configuration of kitty, tmux, lf, zsh and neovim.

## Try

You can try my configuration in docker container.

```bash
git clone https://github.com/ch3n9w/dev
cd dev
docker build . -t dev:latest
docker run -it dev:latest /bin/zsh
```

## Install

```bash
git clone https://github.com/ch3n9w/dev
cd dev
# install dependency software and install configuration
./scripts/install-software.sh
```

Alternatively (if you dont want to install all of them), you can copy the configuration directory you like to XDG_CONFIG_HOME, for example:

```
nvim -> ~/.config/nvim
kitty -> ~/.config/kitty
tmux -> ~/.config/tmux
lf -> ~/.config/lf
zsh/zsh -> ~/.config/zsh
zsh/zshrc -> ~/.zshrc
```

## Noteable Info

- Kitty
  - use JetbrainMono Nerd Font and LXGW WenKai, please install them by yourself.
- Tmux
  - commonly used keys are set as shortcuts that dont require prefix key, which can still be used though
  - use tmux-continuum and resurrect to restore workspaces.
  - If you get dizzy remembering shortcuts, just use your mouse.
- Zsh
  - settings about software are in `zsh/zsh/plugins`, you can add here by yourself
  - disable vim mode for consistence.
- Neovim
  - Neovim is good at single window editing, please use vscode for large scale projects:)
  - most keybindings are in `nvim/lua/keymap.lua`, others are in plugins' file.
  - disgard f/F t/T inline search and only use global search enhanced by flash.nvim.
  - the completion behavior simulate vscode's, which is more intuitive:)
- lf
  - integrate with fzf, you can press `f` to fuzzy search files and directories from pwd

## Keymap

| Software |            Key             |              Effect              |
| :------: | :------------------------: | :------------------------------: |
|   zsh    |            C-r             |      execute lf filemanager      |
|   zsh    |        C-backspace         |       delete word backward       |
|    lf    |             gh             |          go to home (~)          |
|    lf    |             gd             |        go to ~/Documents         |
|    lf    |             gn             |        go to ~/Downloads         |
|    lf    |             gp             |         go to ~/Projects         |
|    lf    |             H              | go to previous visited directory |
|    lf    |             L              |   go to next visited directory   |
|    lf    |             a              |              mkdir               |
|    lf    |             t              |              touch               |
|    lf    |             r              |     rename file or directory     |
|    lf    |             o              |    open with custom software     |
|    lf    |             .              |         show hidden file         |
|    lf    |             ;              |      execute shell command       |
|    lf    |             y              |               copy               |
|    lf    |             d              |               cut                |
|    lf    |             p              |              paste               |
|    lf    |             D              |          move to trash           |
|    lf    |           delete           |                rm                |
|    lf    |             f              |      fuzzy search using fzf      |
|   tmux   |            C-h             |       go to the left pane        |
|   tmux   |            C-j             |       go to the pane below       |
|   tmux   |            C-k             |        go to the top pane        |
|   tmux   |            C-l             |       go to the right pane       |
|   tmux   |            C-q             |            kill pane             |
|   tmux   |           C-S-j            |     swap with the next pane      |
|   tmux   |           C-S-k            |   swap with the previous pane    |
|   tmux   |            C-x             |    split window horizontally     |
|   tmux   |           C-S-x            |     split window vertically      |
|   tmux   |            C-f             |       make pane fullscreen       |
|   tmux   |            C-t             |        create new window         |
|   tmux   |           C-S-t            |          rename window           |
|   tmux   |           C-PgUp           |      go to previous window       |
|   tmux   |           C-PgDn           |        go to next window         |
|   tmux   |          C-S-PgUp          |    swap with previous window     |
|   tmux   |          C-S-PgDn          |      swap with next window       |
|   tmux   |        C-(number x)        |          go to window x          |
|   tmux   |            C-s             |          choose session          |
|   tmux   |           C-S-s            |          rename session          |
|   tmux   |            C-n             |        create new session        |
|  neovim  |             L              |      go to the end of line       |
|  neovim  |             H              |     go to the begin of line      |
|  neovim  |             J              |    go to the previous buffer     |
|  neovim  |             K              |      go to the next buffer       |
|  neovim  |             f              |     scroll half page forward     |
|  neovim  |             F              |    scroll half page backward     |
|  neovim  |             ;              |      enter commandline mode      |
|  neovim  |             g=             |         format document          |
|  neovim  |        2-LeftMouse         |           toggle fold            |
|  neovim  |             CR             |           toggle fold            |
|  neovim  |             sw             |        fuzzy search word         |
|  neovim  |             sf             |      fuzzy search filename       |
|  neovim  |             z              |   fuzzy search opened buffers    |
|  neovim  |             sd             |     fuzzy search diagnostics     |
|  neovim  |             ga             |        (lsp) code action         |
|  neovim  |             ge             |  (lsp) show diagnostics in line  |
|  neovim  |             gh             |        (lsp) get document        |
|  neovim  |             gn             |       (lsp) rename symbol        |
|  neovim  |             gd             |      (lsp) go to definition      |
|  neovim  |             gr             |       (lsp) find reference       |
|  neovim  |            C-/             |           comment line           |
|  neovim  |             /              |         search and jump          |
|  neovim  |             ?              | search and select in treesitter  |
|  neovim  | keymaps in plugins/cmp.lua |         code completions         |
