export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
export LESSHISTFILE=-
export SHELL_SESSIONS_DISABLE=1
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_CONFIG_HOME=${HOME}/.config
# export XDG_CONFIG_DIRS=${XDG_CONFIG_HOME}
export XDG_DATA_HOME=${HOME}/.local/share
# export XDG_DATA_DIRS=${XDG_DATA_HOME}
export http_proxy=http://localhost:4096
export https_proxy=http://localhost:4096

if [[ -d ${HOME}/.config/nvm ]]; then
  export NVM_DIR=${HOME}/.config/nvm
  export npm_config_cache=${XDG_CACHE_HOME}/npm
  export npm_config_userconfig=${XDG_CONFIG_HOME}/npm/npmrc
fi

if [[ -d ${HOME}/.local/bin ]]; then
  export PATH=${HOME}/.local/bin:${PATH}
fi

if [[ -s ${HOME}/.cargo/env ]]; then
  source ${HOME}/.cargo/env
fi
