# Neovim

stow should take care of dotfiles. lazy loads the plugins

```bash
# nvim # text editor
sudo pacman -S neovim
```

need to install secondary packages for formatting linting etc..

```bash
# lua-language-server # lua lsp
# lua51.lua # lua 5.1
# luacheck # lua linter
# luarocks # lua package manager
# prettier # general formatter
# stylua # lua formatter
# tree-sitter-cli # tree-sitter cmd
sudo pacman -S lua-language-server lua51 luacheck luarocks prettier stylua tree-sitter-cli
```

```bash
# rust # rust
# rust-analyzer # rust lsp
# rustfmt # rust formatter
# taplo-cli # toml formatter
sudo pacman -S rust rust-analyzer rustfmt taplo-cli
```

# Tmux

stow should take care of dotfiles.

```bash
# tmux # terminal panes
sudo pacman -S tmux
```
