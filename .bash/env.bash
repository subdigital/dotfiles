export EDITOR="vim"
export TERM=xterm
export PATH=~/bin:~/.ec2/bin:/usr/local/bin:/usr/local/heroku/bin:/usr/local/sbin:$PATH

export EC2_HOME=~/.ec2
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

# Rails Performance goodness
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000

# Load secrets into ENV if present
secrets_path=~/.bash/secrets.bash
[ -f $secrets_path ] && source $secrets_path
