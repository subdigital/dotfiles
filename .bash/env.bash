export EDITOR="vim"
export TERM=xterm
export CLICOLOR=1
export PATH=~/bin:~/.ec2/bin:/usr/local/bin:/usr/local/heroku/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

export EC2_HOME=~/.ec2
export JAVA_HOME=`/usr/libexec/java_home` # http://stackoverflow.com/questions/6588390/where-is-java-home-on-osx-yosemite-10-10-mavericks-10-9-mountain-lion-10


# Load secrets into ENV if present
secrets_path=~/.bash/secrets.bash
[ -f $secrets_path ] && source $secrets_path

docker_vars_path=~/.dockerrc
[ -f $docker_vars_path ] && source $docker_vars_path
