
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Alias
function listdir {
    Get-ChildItem -Force
}
Set-Alias ll listdir

function neovimhere {
    nvim .
}
Set-Alias v neovimhere
Set-Alias nvim neovimhere

function dotfile {
    cd $HOME\documents\aac-docs\workspace\git\salty-xiv\.dotfile\
}
Set-Alias dot dotfile

# git alias
function gitstatus {
    git status
}
Set-Alias gs gitstatus

function gitdiff {
    git diff
}
Set-Alias gd gitdiff

function gitdiffstaged {
    git diff --staged
}
Set-Alias gds gitdiffstaged

# Need parameter so needs to be a function in powershell :(
#alias gc="git commit -m"
#alias ga="git add"

