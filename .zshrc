# Load version control information
autoload -Uz vcs_info

precmd() { vcs_info }
setopt PROMPT_SUBST

## COLORS/PROMPT
autoload -U colors && colors

COLOR1='blue'
COLOR2='magenta'

DIRECTORY=$'%K{$COLOR1}%F{black} \uf413 %(3~|\u2026/%2~|%~) %F{$COLOR1}'

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats $'%K{$COLOR2}\ue0c8%F{black} \ue725 %b %F{$COLOR2}'

# Set prompt
PROMPT=$'${DIRECTORY}${vcs_info_msg_0_}%k\ue0c8%f '

## COMPLETION
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
