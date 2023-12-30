# look for a file that matches this machine's hostname and source it

local_file="$HOME/.zsh/local/$(hostname).zsh"
if [[ -f $local_file ]] then
  source $local_file 
else
  touch $local_file
  echo "Added a file at $local_file to include machine-specific configuration."
fi
