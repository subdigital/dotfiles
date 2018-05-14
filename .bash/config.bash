
function __git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function __git_dirty {
  if [[ -d .git ]]; then
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo " •"
  fi
}

function __my_rvm_ruby_version {
  if [[ -f .rvmrc ]]; then
    local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
    [ "$gemset" != "" ] && gemset="@$gemset"
    local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
    [ "$version" == "1.8.7" ] && version=""
    local full="$version$gemset"
    [ "$full" != "" ] && echo "[$full]"
  fi
}

function __my_rbenv_ruby_version {
  if [[ -f .rbenv-version ]]; then
    rbenv local
  else
    rbenv global
  fi
}

function __minutes_since_last_commit_with_branch {
  echo `ruby -e "git_status = (%x{git status 2> /dev/null}); last_commit = (%x{git log --pretty=format:'%at' -1 2> /dev/null}).gsub(/^\* (.+)$/, '(\1) '); seconds = Time.now.to_f - last_commit.to_f; minutes = seconds.to_f / 60; ((seconds > 60*60*2) ? (time_since_commit = ('+2h')) : (time_since_commit = minutes.to_i.to_s + 'm') if (git_status != ''));print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(' + time_since_commit.to_s + '|\1) ')"`
}

function bash_prompt {
  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  local UC=$W                 # user's color
  [ $UID -eq "0" ] && UC=$R   # root's color

  PS1="$K\h $EMG\w$EMC \$(__minutes_since_last_commit_with_branch)$EMR\$(__git_dirty)${NONE} $ "
}
bash_prompt

function presentation_prompt {
  # presentation mode
  PS1="$ "
  clear
}

ssh_load_autocomplete()
{
  if [[ -d ~/.ssh/config ]]
  then
    complete -W "$(awk '/^\s*Host\s*/ { sub(/^\s*Host /, ""); print; }' ~/.ssh/config)" ssh
  fi
}

ssh_load_autocomplete

# Git completion for bash
git_completion=~/.bash/git-completion.bash
[ -f $git_completion ] && source $git_completion
