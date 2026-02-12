setopt HIST_IGNORE_ALL_DUPS

alias grep="grep --color=auto"
alias ll="lsd -Ahl --color=auto --group-dirs=first"
alias ls="lsd -Ah --color=auto --group-dirs=first"
alias ping="ping -c 4"

if [ -d ${BREW_PREFIX}/bin ]; then
  export PATH=${BREW_PREFIX}/bin:${PATH}
fi

if [ -d ${HOME}/.local/bin ]; then
  export PATH=${HOME}/.local/bin:${PATH}
fi

if [ -d ${BREW_PREFIX}/share/zsh/site-functions ]; then
  export FPATH=${FPATH}:${BREW_PREFIX}/share/zsh/site-functions:${HOME}/.local/share/zsh/site-functions
fi

if [ $(command -v mise) ]; then
  eval "$(mise activate zsh)"
fi

if [ $(command -v sheldon) ]; then
  eval "$(sheldon source)"
  bindkey '^[^J' autosuggest-execute
fi

if [ $(command -v starship) ]; then
  eval "$(starship init zsh)"
fi

if [ $(command -v wezterm) ]; then
  source ${HOME}/.config/wezterm/wezterm.sh
fi

autoload -Uz compinit && compinit

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
