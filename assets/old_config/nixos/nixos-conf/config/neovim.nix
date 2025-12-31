{ config, pkgs, ... }:
{
  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    vim # basic editor
    alacritty # terminal
    tmux # tmux

    # code
    # clang # c and c formatter
    gcc14 # c++ for nvim
    lua51Packages.lua # lua for nvim

    # lsp
    lua-language-server # lua lsp

    # linter
    luajitPackages.luacheck # lua lint

    # formatter
    nixfmt-rfc-style # nix format
    stylua # lua format
    prettier # general formater for multi lang

  ];
}
