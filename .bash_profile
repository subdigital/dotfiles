if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
PATH=/usr/local/bin:/usr/local/heroku/bin:$PATH:/usr/local/sbin

# local bin overrides 
PATH=$PATH:bin

source ~/.bashrc

export PATH
