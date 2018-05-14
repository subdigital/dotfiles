if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
PATH=/usr/local/bin:/usr/local/heroku/bin:$PATH:/usr/local/sbin

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# local bin overrides 
PATH=$PATH:bin:/Applications/Postgres.app/Contents/Versions/9.6/bin

source ~/.bashrc
[[ -f ~/.iterm2_shell_integration.bash ]] && source ~/.iterm2_shell_integration.bash

export PATH
