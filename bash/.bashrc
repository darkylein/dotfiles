# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# Start starship
eval "$(starship init bash)"

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Aliases
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -al'
