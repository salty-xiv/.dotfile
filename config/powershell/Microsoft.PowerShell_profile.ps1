# PSReadLine extension to provide VI keybindings
#Set-PSReadlineOption -EditMode vi

# Bash style completion, AWESOME for completion of paths and directories!!!
#Set-PSReadLineKeyHandler -Key Tab -Function Complete
#Set-PSReadLineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory

# REMOVE gl, so that we can use gl.bat for git pull instead of Get-Location
#Remove-Alias -Force -Name gl
#Remove-Alias -Force -Name gp
#Remove-Alias -Force -Name gm

# Alias
function ll { Get-ChildItem -Force }
#function dot { cd $HOME\documents\aac-docs\workspace\git\salty-xiv\.dotfile\ }
#function psh { cd $HOME\documents\PowerShell\ }
#function ala { cd $HOME\AppData\Roaming\alacritty }

# git alias
#function gs { git status }
#function gd { git diff }
#function gds { git diff --staged }

# oh-my-posh
oh-my-posh init pwsh --config ~/documents/aac-docs/workspace/git/salty-xiv/.dotfile/config/powershell/salty.omp.json | Invoke-Expression

# imports zlocation
Import-Module ZLocation
