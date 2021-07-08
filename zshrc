alias ..="cd .."
alias grep="grep --color=auto"
alias ls="gls -A --group-directories-first"
alias ll="gls -Al --group-directories-first"
alias tree="tree --dirsfirst"

autoload -Uz bashcompinit && bashcompinit
autoload -Uz compinit && compinit

bindkey '^[^M' autosuggest-execute

export BREW_PREFIX=$(brew --prefix)

[ -s ${BREW_PREFIX}/opt/nvm/nvm.sh ] && source ${BREW_PREFIX}/opt/nvm/nvm.sh
[ -s ${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -s ${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/local/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh 
