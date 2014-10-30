export EDITOR="vim"
export TERM=xterm
export CLICOLOR=1
export PATH=~/bin:~/.ec2/bin:/usr/local/bin:/usr/local/heroku/bin:/usr/local/sbin:$PATH

export EC2_HOME=~/.ec2
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home


# Load secrets into ENV if present
secrets_path=~/.bash/secrets.bash
[ -f $secrets_path ] && source $secrets_path
