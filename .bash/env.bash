export EDITOR="atom"
export TERM=xterm
export CLICOLOR=1
export PATH=~/bin:/usr/local/bin:/usr/local/heroku/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin

# Load secrets into ENV if present
secrets_path=~/.bash/secrets.bash
[ -f $secrets_path ] && source $secrets_path

docker_vars_path=~/.dockerrc
[ -f $docker_vars_path ] && source $docker_vars_path

