
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' '' 'm:{[:lower:]}={[:upper:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/andrew/.zshrc'

autoload -U colors && colors

# Git branch info    
last_command() {
    if [[ $? -eq 0 ]]; then
     echo -n "%F{green}% ✓"
    else
     echo -n "%F{red}% ✗"
   fi

}
git_info() {
   
    if [[ -n $(git status -s  2> /dev/null) ]]; then
	    echo -n "%F{yellow}% ✱ "
	else
	    echo -n "%F{green}% "

    fi


    echo -n "$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    
    
}

# Precmd is executed just before each prompt
precmd() {
    PS1="$(last_command) $(date +"%H:%M") $(git_info) %F{blue}%~ %F{magenta}❯ %F{reset}"
}



# Custom Git prompt function

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
# # Share history between all zsh sessions
setopt append_history         # Append new history to the history file instead of overwriting it
setopt inc_append_history     # Write commands to history immediately, not just at exit

# Ignore duplicate and commands starting with space
setopt hist_ignore_dups       # Don't save duplicate commands
setopt hist_ignore_space      # Don't save commands that start with a space

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line


bindkey '^R' history-incremental-search-backward  # Ctrl+R to search backwards
bindkey '^S' history-incremental-search-forward    # Ctrl+S to search forwards
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
