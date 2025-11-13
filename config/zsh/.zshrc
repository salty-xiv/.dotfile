# Set up the prompt
# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ":completion:*" auto-description "specify: %d"
zstyle ":completion:*" completer _expand _complete _correct _approximate
zstyle ":completion:*" format "Completing %d"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" menu select=2
eval "$(dircolors -b)"
# zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ":completion:*" matcher-list "" "m:{a-z}={A-Z}" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=* l:|=*"
zstyle ":completion:*" menu select=long
zstyle ":completion:*" select-prompt %SScrolling active: current selection at %p%s
zstyle ":completion:*" use-compctl false
zstyle ":completion:*" verbose true

zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
zstyle ":completion:*:kill:*" command "ps -u $USER -o pid,%cpu,tty,cputime,cmd"

####################
# PATH
####################
# append
path=("/opt/nvim/" $path)
path=("/opt/love2d/" $path)

# NVM/NPM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

####################
# Custom Prompt
####################
export PS1="%{$(tput setaf 39)%}%n%{$(tput setaf 111)%}@%{$(tput setaf 34)%}%m %{$(tput setaf 214)%}%~ %{$(tput sgr0)%} > "

####################
# Alias
####################
## shell
alias ..="cd .."
alias ll="ls -alF --color=auto"

## nvim
# alias nvim="nvim"
alias vim="nvim ."
alias v="nvim ."

## git
alias gs="git status"
alias gc="git commit -m"
alias ga="git add"
alias gd="git diff"
alias gds="git diff --staged"
alias gu="git push"
alias gl="git pull"

# tmux
alias t="tmux"
alias ta="tmux attach"

# grep
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# nixos
# alias nbuild="sudo nixos-rebuild switch"
# alias nedit="sudo nvim /etc/nixos/configuration.nix"
alias nbuild="sudo nixos-rebuild switch --impure --flake ~/nixos-conf/"
alias nedit="nvim ~/nixos-conf"

# config
# alias cedit="cd ~/.dotfile && nvim ."

# config
alias passsync="bash ~/.bashscript/passwordsync.sh"
