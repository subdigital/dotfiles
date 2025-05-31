export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.mint/bin:$PATH

export XDG_CONFIG_HOME="$HOME/.config"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# homebrew
eval $(/opt/homebrew/bin/brew shellenv)

ZSH_THEME="gozilla"

COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source $HOME/.zsh/config.zsh

source $HOME/.zsh/mise.zsh
source $HOME/.zsh/zoxide.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/git.zsh
source $HOME/.zsh/postgres.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/ruby.zsh
source $HOME/.zsh/ssh.zsh
source $HOME/.zsh/xcode.zsh
source $HOME/.zsh/yazi.zsh

if [[ -f $HOME/.zsh/secrets.zsh ]]; then
  source $HOME/.zsh/secrets.zsh
else
  touch $HOME/.zsh/secrets.zsh
fi

# source machine-specific config (by hostname)
source $HOME/.zsh/local/local_config.zsh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

