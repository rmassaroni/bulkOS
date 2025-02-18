#!/bin/zsh


cd $HOME #?


# daily welcome message


# export WINEPREFIX='$HOME/wineprefix/prefix' # can probably delete


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh"
fi



# Quit sourcing during installation. Can be placed lower, right before all zap-specific things.
if [ -z "$ZSH_VERSION" ]; then
    echo "This script requires Zsh. You are likely seeing this because the install script is not done yet. Exiting."
    return
fi 


# source dotfiles if found. will make reusable function
if [ -f "$HOME/.aliases" ]; then 
    source ~/.aliases 
else
    echo "~/.aliases not found."
fi
if [ -f "$HOME/.scripts.sh" ]; then
    source ~/.scripts.sh
else
    echo "~/.scripts.sh not found."
fi
if [ -d "$HOME/.gpush" ]; then
    source ~/.gpush/gpush.sh
else
    echo "~/.gpush not found."
fi

source ~/.local/share/zap/zap.zsh

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e #?

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "romkatv/powerlevel10k"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/completions"
# plug "zap-zsh/zap-prompt" #must be commented out when entering external drive


# check if the current directory is on an external drive
is_external_drive() {
    local external_drives=("/media" "/mnt")
    local current_dir=$(pwd)
    for drive in $external_drives; do
        if [[ $current_dir == $drive* ]]; then
            return 0  # Directory is on an external drive
        fi
    done
    return 1
}

# Function to load zap-prompt only if we're not on an external drive
load_zap_prompt() {
    if ! is_external_drive && ! $(alias | grep -q 'zap-prompt'); then
        plug "zap-zsh/zap-prompt"
    fi
}

# Check directory change dynamically
autoload -U add-zsh-hook
add-zsh-hook chpwd load_zap_prompt

# Run initial check when starting
load_zap_prompt






# ?
# Use modern completion system
# autoload -Uz compinit
# compinit

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true
#
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.gpush:$PATH"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH" #old


export JAVA_HOME=/opt/jdk-17.0.11+9 
export PATH=$JAVA_HOME/bin:$PATH
#old paths. need to be updated


# # Load and initialise completion system
# autoload -Uz compinit
# compinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
