export BREW_PREFIX="/opt/homebrew"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"

if [ -d ${BREW_PREFIX}/bin ]; then
  export PATH=${BREW_PREFIX}/bin:${PATH}
fi

if [ -d ${HOME}/.local/bin ]; then
  export PATH=${HOME}/.local/bin:${PATH}
fi

export XDG_CACHE_HOME=${HOME}/.cache
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state

export LANG=en_US.UTF-8
export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker
export LESSHISTFILE=${XDG_STATE_HOME}/less/history
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
