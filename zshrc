setopt HIST_IGNORE_ALL_DUPS

alias grep="grep --color=auto"
alias ll="lsd -Ahl --color=auto --group-dirs=first"
alias ls="lsd -Ah --color=auto --group-dirs=first"
alias oc="opencode"

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

zstyle ":completion:*" cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"
autoload -Uz compinit select-word-style
compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}"
select-word-style bash
