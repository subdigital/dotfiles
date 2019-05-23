alias ..="cd .."

# quick edit aliases
alias reload="source ~/.bash/aliases.bash"
alias ea='vim ~/.bash/aliases.bash && reload'

# use terminal mvim
alias vim='mvim -v'

# See disk usage in the current folder only
alias ds='du -h -d 1'

alias ll='ls -l'
alias cpwd='pwd | pbcopy' #copy working directory
alias cpdir=cpwd

#terminal
function title() {
  echo -n -e "\033]0;$1\007"
}

#Finder
alias o='open . &'

#Processes
alias tu='top -o cpu' # processes sorted by CPU
alias tm='top -o vsize' # processes sorted by Memory

#Rails
alias rs='bundle exec rails server'
alias r='rake'
alias rmig='bundle exec rake db:migrate'
alias rc='bundle exec rails console'

# CocoaPods
alias pod-dev=$HOME/projects/CocoaPods/bin/pod

# bundler
alias bec='bundle exec cucumber'
function be() {
  bundle exec $*
}

#Heroku
function hrmig() {
  heroku rake db:migrate --app $1
}

function hrdeploy {
  rake heroku:deploy app=$1
}

# Chef
alias kc='knife cookbook'
alias kcu='knife cookbook upload'

#Git
alias g='git status'
alias gb='git branch'
alias grc='git rebase --continue'
alias gpp='git pull --rebase && git push'
alias gmff='git merge --ff-only'
alias gpull='git pull origin master'
alias gpush='git push origin master'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gl='git log --oneline'

# Pretty-printing
alias format_json='python -m json.tool'

#create a new branch & switch to it
function gcb() {
  git checkout -b $*
}

#move to a branch
function gco() {
  git checkout $*
}

#commit pending changes and quote args
function gg() {
  git commit -v -a -m "$*"
}

# fetch gitignore templates from gitignore.io
function gi() {
  curl https://www.gitignore.io/api/$*
}

alias gd='git diff'

function xcbeta() {
  xc /Applications/Xcode-beta.app
}

function find_xcode_projects() {
  cat <<EOF | ruby -rfileutils
  files = Dir.glob('**/*.{xcworkspace,xcodeproj}')
    .reject {|p|
      p.include?('Pods') ||
      p.include?('xcodeproj/project.xcworkspace') }
    .map {|x| { path: x, depth: x.scan(/\//).count, workspace: x.include?('xcworkspace')} }
    .sort_by {|a| [a[:depth], a[:workspace] ? 0 : 1] }
    .map {|x| x[:path] }
  puts files
EOF
}


function xc() {
  xcode=${1:-/Applications/Xcode.app}
  project_file=$(find_xcode_projects | head -n1)

  if [ -z "$project_file" ]
  then
    echo "Couldn't find a workspace or a project to open."
  else
    echo "Opening $project_file..."
    open "$project_file" -a $xcode
  fi
}

# starts an HTTP server on port 8000
alias pserve='python -m SimpleHTTPServer 8000'

tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}


