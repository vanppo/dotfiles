export BREW_PREFIX=/opt/homebrew

if [ -d ${BREW_PREFIX}/bin ]; then
  export PATH=${BREW_PREFIX}/bin:${PATH}
fi

if [ -d ${HOME}/.local/bin ]; then
  export PATH=${HOME}/.local/bin:${PATH}
fi

export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker
export LESSHISTFILE=${XDG_STATE_HOME}/less/history
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
