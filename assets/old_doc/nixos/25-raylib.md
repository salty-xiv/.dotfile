# raylib install from reddit

source: https://www.reddit.com/r/raylib/comments/1gqshp8/solved_using_raylib_in_nixos/

# SOLVED: Using Raylib in NixOS

## 1 - Build raylib from source

First, clone the raylib repository from Github:

```bash
git clone --depth 1 https://github.com/raysan5/raylib.git raylib
cd raylib/src/
```

Create a shell.nix file with the following content to set up the necessary environment:

```nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXinerama
        xorg.libXi
        xorg.libX11.dev
    ];
}
```

Enter the nix-shell environment:

```bash
nix-shell
```

Next, compile raylib:

```
make PLATFORM=PLATFORM_DESKTOP
```

Edit the raylib/src/Makefile and update the DESTDIR variable to your desired directory. I like to put in $HOME/.local:
NOTE: this is Makefile

```Makefile
DESTDIR ?= $(HOME)/.local
RAYLIB_INSTALL_PATH ?= $(DESTDIR)/lib
RAYLIB_H_INSTALL_PATH ?= $(DESTDIR)/include
```

Install the library to the directories above:

```bash
sudo make install
```

## 2 - Build your game

Once raylib is installed on your NixOS system, you can compile your game. Create a Makefile like the following to build
the game with raylib:

```Makefile
RAYLIB ?= $(HOME)/.local
RAYLIB_INCLUDE_DIR ?= $(RAYLIB)/include
RAYLIB_LIB_DIR ?= $(RAYLIB)/lib

all:
  gcc src/main.c -I $(RAYLIB_INCLUDE_DIR) -L $(RAYLIB_LIB_DIR) -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
```

Now, compile and run your game:

```bash
make && ./a.out
```

## 3 - Neovim config

If you're using Neovim with clangd, you can generate a compile_commands.json file by following these steps. First,
enter the development environment provided by the flake.nix in this repository:

```bash
nix develop
```

Next, run the following command to generate the compilation database for clangd:

```
nix run nixpkgs#bear -- -- make
```

Now, when you enter Neovim, clangd will be able to find the libraries and provide autocomplete functionality. This
setup is, in my opinion, the most basic and effective way to configure raylib on NixOS. It's the approach I've chosen,
and I haven't encountered any issues so far. I hope this helps you as well!

REPO: https://github.com/gabrieldlima/raylib-template/tree/main
